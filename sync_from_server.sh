#!/bin/bash
# Refresh the repository copy of the scripts from the analysis server folders.
# Run from the repository root, then review with `git diff` and commit.
set -euo pipefail
PIPE=/home/afrahkhairallah/B/Scripts_B-Cell-20230209T074351Z-001/Scripts_B-Cell
RERUN=/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023
for f in Presto_flow.sh Miseq_Presto_Process.sh Presto_flow1.sh R_tuning.R R_tigger.R prestor_report.R fastq2fasta1.py sample_amal.sh; do
  cp -p "$PIPE/$f" preprocessing/
done
cp -p "$PIPE"/Primers/NR_{CH,CK,CL,VH,VK,VL}Primers.fasta preprocessing/primers/
rsync -a --prune-empty-dirs --exclude='Scripts/Vis2025/' --exclude='run_stage2.sh' --include='*/' --include='*.R' --include='*.sh' --include='*.py' \
  --include='clone_participant_libraries.tsv' --exclude='*' "$RERUN"/ analysis/
git status --short
