#!/bin/bash
# Clonal assignment for one participant (heavy chain, IgG+IgM, both replicates pooled):
#   clone_prep.R (pool, TIgGER genotype, threshold) -> DefineClones -> CreateGermlines
# Usage: run_clones_participant.sh <participant>
PID=$1
R=/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023
OUT=$R/Clones/$PID
LOG=$R/Clones/logs/$PID.log
GERM=~/share/germlines/imgt/human/vdj
mkdir -p $OUT $R/Clones/logs
cd $OUT

echo "START $PID $(date '+%F %T')" >> $R/Clones/logs/progress.txt
t0=$(date +%s)
/usr/bin/time -v Rscript $R/Clones/scripts/clone_prep.R $PID $R/clone_participant_libraries.tsv $OUT > $LOG 2>&1 \
    || { echo "FAIL $PID clone_prep $(date '+%F %T')" >> $R/Clones/logs/progress.txt; exit 1; }
t1=$(date +%s)

TH=$(awk -F'\t' '$1=="threshold"{print $2}' ${PID}_threshold.txt)
if [ -z "$TH" ] || [ "$TH" = "NA" ]; then
    echo "FAIL $PID no threshold $(date '+%F %T')" >> $R/Clones/logs/progress.txt; exit 1
fi

DefineClones.py -d ${PID}_IGH_genotyped.tsv --vf v_call_genotyped --act set --model ham --norm len \
    --dist $TH --nproc 4 --outname ${PID}_IGH >> $LOG 2>&1 \
    || { echo "FAIL $PID DefineClones $(date '+%F %T')" >> $R/Clones/logs/progress.txt; exit 1; }
t2=$(date +%s)

CreateGermlines.py -d ${PID}_IGH_clone-pass.tsv -g dmask --cloned --vf v_call_genotyped \
    -r $GERM/imgt_human_IGHV.fasta $GERM/imgt_human_IGHD.fasta $GERM/imgt_human_IGHJ.fasta ${PID}_IGHV_genotype.fasta \
    --outname ${PID}_IGH >> $LOG 2>&1 \
    || { echo "FAIL $PID CreateGermlines $(date '+%F %T')" >> $R/Clones/logs/progress.txt; exit 1; }
t3=$(date +%s)

echo "END $PID threshold=$TH prep_s=$((t1-t0)) defineclones_s=$((t2-t1)) germlines_s=$((t3-t2)) $(date '+%F %T')" >> $R/Clones/logs/progress.txt
