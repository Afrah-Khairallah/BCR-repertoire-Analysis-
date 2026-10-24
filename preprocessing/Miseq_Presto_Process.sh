#!/bin/bash
# Example pRESTO pipeline for MiSeq data with UIDs.
# Data from Stern et al, 2014, Sci Trans Med.
# 
# Author:  Jason Anthony Vander Heiden, Gur Yaari
# Modified: Michelle Muthui
# Date:    2022.05.31

# Define run parameters and input files
R1_FILE=$R1_File
R2_FILE=$R2_File
R1_PRIMERS=$For_primer
R2_PRIMERS=$Rev_primer
OUTDIR="$DIR"
PIPELINE_LOG="Pipeline.log"
ZIP_FILES=true

# Make output directory and empty log files
mkdir -p $OUTDIR; cd $OUTDIR
echo '' > $PIPELINE_LOG

# Start
echo "OUTPUT DIRECTORY: ${OUTDIR}"
echo -e "START"
STEP=0

# Remove low quality reads
printf "  %2d: %-*s $(date +'%H:%M %d/%b/%Y')\n" $((++STEP)) 24 "FilterSeq quality"
FilterSeq.py quality -s $R1_FILE -q 15 --outname R1 --outdir . \
	--log QualityLogR1.log >> $PIPELINE_LOG
FilterSeq.py quality -s $R2_FILE -q 15 --outname R2 --outdir . \
	--log QualityLogR2.log >> $PIPELINE_LOG


# Identify primers and UIDs
printf "  %2d: %-*s $(date +'%H:%M %d/%b/%Y')\n" $((++STEP)) 24 "MaskPrimers score"
MaskPrimers.py align -s R1_quality-pass.fastq -p $R1_PRIMERS \
	--maxerror 0.2 --mode trim --barcode --outname R1 \
	--log PrimerLogR1.log >> $PIPELINE_LOG
MaskPrimers.py align -s R2_quality-pass.fastq -p $R2_PRIMERS \
	--maxerror 0.2 --mode trim --outname R2 \
	--log PrimerLogR2.log >> $PIPELINE_LOG

# Assign UID to read 2 sequences
printf "  %2d: %-*s $(date +'%H:%M %d/%b/%Y')\n" $((++STEP)) 24 "PairSeq"
PairSeq.py -1 R1_primers-pass.fastq -2 R2_primers-pass.fastq \
    --1f BARCODE --coord illumina >> $PIPELINE_LOG

# Multiple align UID read groups
printf "  %2d: %-*s $(date +'%H:%M %d/%b/%Y')\n" $((++STEP)) 24 "AlignSets muscle"
#MUSCLE_EXEC=which muscle
AlignSets.py muscle -s R1_primers-pass_pair-pass.fastq \
	--log AlignLogR1.log --outname R1 >> $PIPELINE_LOG
AlignSets.py muscle -s R2_primers-pass_pair-pass.fastq \
	--log AlignLogR2.log --outname R2 >> $PIPELINE_LOG

# Build UID consensus sequences
printf "  %2d: %-*s $(date +'%H:%M %d/%b/%Y')\n" $((++STEP)) 24 "BuildConsensus"
BuildConsensus.py -s R1_align-pass.fastq --bf BARCODE --pf PRIMER \
	--prcons 0.6 --maxerror 0.1 --maxgap 0.5 --outname R1 \
	--log ConsensusLogR1.log >> $PIPELINE_LOG
BuildConsensus.py -s R2_align-pass.fastq --bf BARCODE --pf PRIMER \
	--maxerror 0.1 --maxgap 0.5 --outname R2 \
	--log ConsensusLogR2.log >> $PIPELINE_LOG

# Synchronize consensus sequence files
printf "  %2d: %-*s $(date +'%H:%M %d/%b/%Y')\n" $((++STEP)) 24 "PairSeq"
PairSeq.py -1 R1_consensus-pass.fastq -2 R2_consensus-pass.fastq \
    --coord presto >> $PIPELINE_LOG

# Assemble paired ends via mate-pair alignment
printf "  %2d: %-*s $(date +'%H:%M %d/%b/%Y')\n" $((++STEP)) 24 "AssemblePairs align"
AssemblePairs.py align -1 R2_consensus-pass_pair-pass.fastq \
	-2 R1_consensus-pass_pair-pass.fastq --1f CONSCOUNT --2f PRCONS CONSCOUNT \
	--coord presto --rc tail --minlen 8 --maxerror 0.3 --alpha 1e-5 --scanrev \
	--outname FIN --log AssembleLog.log >> $PIPELINE_LOG

# Rewrite header with minimum of CONSCOUNT
printf "  %2d: %-*s $(date +'%H:%M %d/%b/%Y')\n" $((++STEP)) 24 "ParseHeaders collapse"
ParseHeaders.py collapse -s FIN_assemble-pass.fastq -f CONSCOUNT --act min \
	--outname FIN > /dev/null

# Remove low quality sequences
printf "  %2d: %-*s $(date +'%H:%M %d/%b/%Y')\n" $((++STEP)) 24 "Quality Filter"
FilterSeq.py quality -s FIN_reheader.fastq -q 10 --outname FIN \
        --log QualityLog.log >> $PIPELINE_LOG

# Remove duplicate sequences
printf "  %2d: %-*s $(date +'%H:%M %d/%b/%Y')\n" $((++STEP)) 24 "CollapseSeq"
CollapseSeq.py -s FIN_quality-pass.fastq -n 20 \
	--uf PRCONS --cf CONSCOUNT --act sum --inner \
	--outname FIN >> $PIPELINE_LOG

# Filter to sequences with at least 2 supporting reads
printf "  %2d: %-*s $(date +'%H:%M %d/%b/%Y')\n" $((++STEP)) 24 "SplitSeq group"
SplitSeq.py group -s FIN_collapse-unique.fastq -f CONSCOUNT --num 2 \
    >> $PIPELINE_LOG

# Create tables of final repertoire files
printf "  %2d: %-*s $(date +'%H:%M %d/%b/%Y')\n" $((++STEP)) 24 "ParseHeaders table"
ParseHeaders.py table -s FIN_reheader.fastq \
    -f ID PRCONS CONSCOUNT --outname Final \
    >> $PIPELINE_LOG
ParseHeaders.py table -s FIN_collapse-unique.fastq \
    -f ID PRCONS CONSCOUNT DUPCOUNT --outname Final-Unique \
    >> $PIPELINE_LOG
ParseHeaders.py table -s FIN_collapse-unique_atleast-2.fastq \
    -f ID PRCONS CONSCOUNT DUPCOUNT --outname Final-Unique-Atleast2 \
    >> $PIPELINE_LOG

# Process log files
printf "  %2d: %-*s $(date +'%H:%M %d/%b/%Y')\n" $((++STEP)) 24 "ParseLog"
ParseLog.py -l QualityLogR[1-2].log -f ID QUALITY > /dev/null &
ParseLog.py -l PrimerLogR[1-2].log -f ID BARCODE PRIMER ERROR > /dev/null &
ParseLog.py -l AlignLogR[1-2].log -f ID BARCODE ALIGN > /dev/null &
ParseLog.py -l ConsensusLogR[1-2].log -f BARCODE SEQCOUNT CONSCOUNT PRIMER PRCONS PRCOUNT PRFREQ ERROR \
	> /dev/null &
ParseLog.py -l AssembleLog.log -f ID LENGTH OVERLAP ERROR PVALUE FIELDS1 FIELDS2 \
    > /dev/null &
ParseLog.py -l QualityLog.log -f ID QUALITY > /dev/null &
wait

# Zip intermediate and log files
if $ZIP_FILES; then
    LOG_FILES_ZIP=$(ls *LogR[1-2].log *Log.log)
    tar -zcf LogFiles.tar $LOG_FILES_ZIP
    rm $LOG_FILES_ZIP

    TEMP_FILES_ZIP=$(ls *.fastq | grep -v "FIN_reheader.fastq\|FIN_collapse-unique.fastq\|FIN_collapse-unique_atleast-2.fastq")
    tar -zcf TempFiles.tar $TEMP_FILES_ZIP
    rm $TEMP_FILES_ZIP
fi

# End
printf "Done\n\n"

python3 $director/fastq2fasta1.py -if FIN_collapse-unique.fastq -of FIN_collapse-unique.fasta
AssignGenes.py igblast -s FIN_collapse-unique.fasta -b ~/share/igblast/ --organism human --loci ig --format blast
MakeDb.py igblast -i FIN_collapse-unique_igblast.fmt7 -s FIN_collapse-unique.fasta -r ~/share/germlines/imgt/human/vdj/* --extended \
    2>&1 | tee MakeDb_console.log
MAKEDB_EXIT=${PIPESTATUS[0]}

# Completeness check: every sequence sent to IgBLAST must come out of MakeDb as PASS or FAIL,
# and the db-pass table must hold all PASS records. Stops the sample if MakeDb was cut short.
N_FASTA=$(grep -c '^>' FIN_collapse-unique.fasta)
N_IGBLAST=$(grep -oE 'BLAST processed [0-9]+ queries' FIN_collapse-unique_igblast.fmt7 | grep -oE '[0-9]+')
N_PASS=$(tr '\r' '\n' < MakeDb_console.log | grep -E '^ *PASS>' | grep -oE '[0-9]+' | tail -1)
N_FAIL=$(tr '\r' '\n' < MakeDb_console.log | grep -E '^ *FAIL>' | grep -oE '[0-9]+' | tail -1)
N_ROWS=$(( $(wc -l < FIN_collapse-unique_igblast_db-pass.tsv 2>/dev/null || echo 1) - 1 ))
echo "MAKEDB CHECK: fasta=$N_FASTA igblast=$N_IGBLAST pass=$N_PASS fail=$N_FAIL db_rows=$N_ROWS exit=$MAKEDB_EXIT" | tee -a $PIPELINE_LOG
if [ "$MAKEDB_EXIT" -ne 0 ] || [ -z "$N_PASS" ] || [ -z "$N_FAIL" ] \
    || [ "$N_IGBLAST" != "$N_FASTA" ] \
    || [ $(( N_PASS + N_FAIL )) -ne "$N_FASTA" ] \
    || [ "$N_ROWS" -ne "$N_PASS" ]; then
    echo "ERROR: incomplete IgBLAST/MakeDb output in $OUTDIR -- stopping this sample" | tee -a $PIPELINE_LOG >&2
    exit 1
fi

Rscript $director/R_tuning.R
