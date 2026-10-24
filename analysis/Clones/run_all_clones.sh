#!/bin/bash
# Run clonal assignment for all 34 participants, 3 at a time
R=/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023
cut -f1 $R/clone_participant_libraries.tsv | tail -n +2 | sort -u | \
    xargs -P 3 -n 1 $R/Clones/scripts/run_clones_participant.sh
echo "ALL DONE $(date '+%F %T')" >> $R/Clones/logs/progress.txt
