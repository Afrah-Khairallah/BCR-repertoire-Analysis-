#!/bin/bash

export directory="/mnt/data/B_cell_repertoire/Sam/Sam_2026/Fastq/"

cd $directory
inner=$(ls *.fastq | grep -E "R1_0")
outer=$(ls *.fastq | grep -E "R2_0")

for i in $inner; do
	export R1_File=$directory/$i
	export jam=${i:0:11}
	export R2_File=$directory/$(echo "$outer" | grep -E "$jam")
	
export filename=$(basename -- "$R1_File")
export character=${filename:6:1}
export H="-H-"
export L="-L-"
export K="-K-"
export h="-h-"
export l="-l-"
export k="-k-"
export Hu="_H_"
export Lu="_L_"
export Ku="_K_"
export hu="_h_"
export lu="_l"
export ku="_k_"


if [[ "$filename" == *"$H"* ]] || [[ "$filename" == *"$h"* ]] || [[ "$filename" == *"$Hu"* ]] || [[ "$filename" == *"$hu"* ]]; then
	export For_primer=/home/afrahkhairallah/Scripts_B-Cell/Sample_Data-20230209T081953Z-001/Sample_Data/NR_CHPrimers.fasta
elif [[ "$filename" == *"$K"* ]] || [[ "$filename" == *"$k"* ]] || [[ "$filename" == *"$Ku"* ]] || [[ "$filename" == *"$ku"* ]]; then
	export For_primer=/home/afrahkhairallah/Scripts_B-Cell/Sample_Data-20230209T081953Z-001/Sample_Data/NR_CKPrimers.fasta
elif [[ "$filename" == *"$L"* ]] || [[ "$filename" == *"$l"* ]] || [[ "$filename" == *"$Lu"* ]] || [[ "$filename" == *"$lu"* ]]; then
	export For_primer=/home/afrahkhairallah/Scripts_B-Cell/Sample_Data-20230209T081953Z-001/Sample_Data/NR_CLPrimers.fasta
else
	export For_primer=/home/afrahkhairallah/Scripts_B-Cell/Sample_Data-20230209T081953Z-001/Sample_Data/NR_CPrimers.fasta
fi
if [[ "$filename" == *"$H"* ]] || [[ "$filename" == *"$h"* ]] || [[ "$filename" == *"$Hu"* ]] || [[ "$filename" == *"$hu"* ]]; then
	export Rev_primer=/home/afrahkhairallah/Scripts_B-Cell/Sample_Data-20230209T081953Z-001/Sample_Data/NR_VHPrimers.fasta
elif [[ "$filename" == *"$K"* ]] || [[ "$filename" == *"$k"* ]] || [[ "$filename" == *"$Ku"* ]] || [[ "$filename" == *"$ku"* ]]; then
	export Rev_primer=/home/afrahkhairallah/Scripts_B-Cell/Sample_Data-20230209T081953Z-001/Sample_Data/NR_VKPrimers.fasta
elif [[ "$filename" == *"$L"* ]] || [[ "$filename" == *"$l"* ]] || [[ "$filename" == *"$Lu"* ]] || [[ "$filename" == *"$lu"* ]]; then
	export Rev_primer=/home/afrahkhairallah/Scripts_B-Cell/Sample_Data-20230209T081953Z-001/Sample_Data/NR_VLPrimers.fasta
else
	export Rev_primer=/home/afrahkhairallah/Scripts_B-Cell/Sample_Data-20230209T081953Z-001/Sample_Data/NR_VPrimers.fasta
fi


export File_name=${filename:0:12} 
export director="/home/afrahkhairallah/B/Scripts_B-Cell-20230209T074351Z-001/Scripts_B-Cell/"
#Input output direcotry
export DIR="/mnt/data/B_cell_repertoire/Sam/Sam_2026/Fastq/Output/$File_name"
export DIR1="/mnt/data/B_cell_repertoire/Sam/Sam_2026/Fastq/Output/$File_name"
#if [ ! -d "$DIR" ]
#then
#	mkdir "/home/afrahkhairallah/B/Run_3_Output/Run3"
#fi
  
  
fastqc --extract $R1_File -o $DIR
fastqc --extract $R2_File -o $DIR

envsubst < $director/Miseq_Presto_Process.sh

if ! $director/Miseq_Presto_Process.sh; then
	echo "SKIPPING $File_name: pre-processing or MakeDb check failed (see $DIR/Pipeline.log)" >&2
	continue
fi

fastqc --extract $DIR/FIN_collapse-unique.fastq -o $DIR

envsubst < $director/Presto_flow1.sh
#envsubst < $director/igdiscoverrun.sh
envsubst < $director/sample_amal.sh
#envsubst < $director/sample_file_amal_tester.sh



$director/Presto_flow1.sh
done

