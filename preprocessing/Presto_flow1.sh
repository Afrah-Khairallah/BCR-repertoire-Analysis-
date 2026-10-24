#!/bin/bash
cd $DIR
file="$DIR/R_output.txt"
if [ ! -f "$file" ]
then
	export Tuning_Value=0.1 && echo "No file found using default value: 0.1"
else
	if [ "$(tail -n 1 R_output.txt)" == "NA" ]
	then
		export Tuning_Value=0.1 && echo "No value available using default value: 0.1"
	else
		export Tuning_Value=$(tail -n 1 R_output.txt)
	fi		
fi

DefineClones.py -d FIN_collapse-unique_igblast_db-pass.tsv --act set --model ham --norm len --dist $Tuning_Value
CreateGermlines.py -d FIN_collapse-unique_igblast_db-pass_clone-pass.tsv -g dmask -r ~/share/germlines/imgt/human/vdj/* --cloned
#CreateGermlines.py -d FIN_collapse-unique_igblast_db-pass_clone-pass.tsv -g dmask -r ~/share/germlines/imgt/human/vdj/* --extended --cloned
#CreateGermlines.py -d FIN_collapse-unique_igblast_db-pass_clone-pass.tsv -g dmask -r /home/afrahkhairallah/share/germlines/imgt/human/* --cloned
Rscript $director/prestor_report.R

Rscript $director/R_tigger.R

#$director/igdiscoverrun.sh
$director/sample_amal.sh
#$director/sample_file_amal_tester.sh



