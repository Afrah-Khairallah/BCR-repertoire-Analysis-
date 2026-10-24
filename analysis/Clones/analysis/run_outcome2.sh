#!/bin/bash
# Outcome 2 (clone-level analyses), run after all participants have clone tables
A=/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Clones/analysis
mkdir -p $A/logs
for s in 01_build_clone_tables.R 02_gene_usage_clone.R 03_shm_cdr3_clone.R 04_clonality_diversity.R 05_shared_clones_IgM_IgG.R; do
  echo "START $s $(date '+%F %T')" >> $A/logs/progress.txt
  ( cd $A && /usr/bin/time -v Rscript $s ) > $A/logs/${s%.R}.log 2>&1
  rc=$?
  echo "END $s exit=$rc $(date '+%F %T')" >> $A/logs/progress.txt
  [ $rc -ne 0 ] && break
done
