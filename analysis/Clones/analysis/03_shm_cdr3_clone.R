##############################################################################################################################################################
# Clone-level SHM and CDR3 length per subject, IgG and IgM
#   Each clone is reduced to one value per sample (mean SHM of its sequences; CDR3 length is the same within a clone),
#   then each sample to the mean over its clones, so expanded clones count once.
#   SHM = mutation frequency over IMGT 79-312 (CDR1-FWR3), excluding the FR1 primer region (see 01_build_clone_tables.R).
#   Per-sequence means (sequence-weighted) are also reported for comparison with the per-sequence analysis.
#
# Statistics and figures as in SHM_mean_per_subject.R / CDR3_mean_per_subject.R.
##############################################################################################################################################################

source("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Clones/analysis/00_clone_common.R")

out_dir <- file.path(out_root, "SHM_CDR3")
dir.create(out_dir, showWarnings = FALSE)

db <- fread(seq_table, select = c("sample", "isotype", "clone_id", "shm_cdr1_fwr3", "shm_fwr1",
                                  "shm_v_identity", "cdr3_aa_length"))

#One value per clone per sample
per_clone <- db[, .(clone_size     = .N,
                    shm_cdr1_fwr3  = mean(shm_cdr1_fwr3, na.rm = TRUE),
                    cdr3_aa_length = median(cdr3_aa_length)),
                by = .(isotype, sample, clone_id)]

per_subject <- per_clone[, .(n_clones                 = .N,
                             mean_shm_clone           = mean(shm_cdr1_fwr3, na.rm = TRUE),
                             mean_cdr3_length_clone   = mean(cdr3_aa_length)),
                         by = .(isotype, sample)]
seq_means <- db[, .(n_sequences             = .N,
                    mean_shm_sequence       = mean(shm_cdr1_fwr3, na.rm = TRUE),
                    mean_shm_fwr1_sequence  = mean(shm_fwr1, na.rm = TRUE),
                    mean_shm_v_identity     = mean(shm_v_identity, na.rm = TRUE),
                    mean_cdr3_length_sequence = mean(cdr3_aa_length)),
                by = .(isotype, sample)]
per_subject <- merge(per_subject, seq_means, by = c("isotype", "sample"))
per_subject[, Hiv_Status := status_of(sample)]
per_subject[, isotype := factor(isotype, levels = isotypes)]
setorder(per_subject, isotype, Hiv_Status, sample)

shm  <- group_stats(per_subject, "mean_shm_clone")
cdr3 <- group_stats(per_subject, "mean_cdr3_length_clone")
print(shm$summary); print(shm$wilcox); print(cdr3$summary); print(cdr3$wilcox)

save_workbook(list(Per_subject = per_subject,
                   SHM_group_summary = shm$summary, SHM_Kruskal_Wallis = shm$kruskal, SHM_Wilcoxon_vs_PreInf = shm$wilcox,
                   CDR3_group_summary = cdr3$summary, CDR3_Kruskal_Wallis = cdr3$kruskal, CDR3_Wilcoxon_vs_PreInf = cdr3$wilcox),
              file.path(out_dir, "SHM_CDR3_clone_per_subject_stats.xlsx"))

y_shm <- c(0, ceiling(max(per_subject$mean_shm_clone) / 2) * 2)
y_cdr <- range(per_subject$mean_cdr3_length_clone) + c(-1, 1)
for (iso in isotypes) {
  d <- per_subject[isotype == iso]
  plot_per_subject(d, "mean_shm_clone", "Mean SHM per clone (%, CDR1-FWR3)", iso,
                   file.path(out_dir, paste0("SHM_clone_per_subject_", iso, ".png")), y_shm)
  plot_per_subject(d, "mean_cdr3_length_clone", "Mean CDR3 length per clone (aa)", iso,
                   file.path(out_dir, paste0("CDR3_clone_per_subject_", iso, ".png")), y_cdr)
}
