#!/bin/bash
# Stage 1: per-chain gene-usage scripts (build pooled per-subject tables + gene-usage CSVs)
R=/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023
cd $R/Scripts
for s in Gene_usage_diversity_H_pooled_samples_AK_v5.R Gene_usage_diversity_L_pooled_samples_AK_v4.R Gene_usage_diversity_H_pooled_samples_AK_v5_HM.R Gene_usage_diversity_K_pooled_samples_AK_v4.R; do
  echo "START $s $(date '+%F %T')" >> $R/logs/progress.txt
  /usr/bin/time -v Rscript $s > $R/logs/${s%.R}.log 2>&1
  echo "END $s exit=$? $(date '+%F %T') maxRSS_kB=$(grep 'Maximum resident' $R/logs/${s%.R}.log | awk '{print $NF}')" >> $R/logs/progress.txt
done
