##############################################################################################################################################################
# Clones shared between IgM and IgG within each participant
#   Clones were defined on pooled IgG + IgM sequences, so a clone containing both isotypes indicates a lineage with
#   IgM and class-switched IgG members.
#   Per participant: fraction of IgG clones with IgM members, fraction of IgM clones with IgG members.
##############################################################################################################################################################

source("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Clones/analysis/00_clone_common.R")

out_dir <- file.path(out_root, "Shared_IgM_IgG")
dir.create(out_dir, showWarnings = FALSE)

db <- fread(seq_table, select = c("participant", "isotype", "clone_id"))

clone_iso <- db[, .(has_IgG = any(isotype == "IgG"), has_IgM = any(isotype == "IgM")), by = .(participant, clone_id)]
shared <- clone_iso[, .(n_clones           = .N,
                        n_IgG_clones       = sum(has_IgG),
                        n_IgM_clones       = sum(has_IgM),
                        n_shared           = sum(has_IgG & has_IgM),
                        frac_IgG_with_IgM  = sum(has_IgG & has_IgM) / sum(has_IgG),
                        frac_IgM_with_IgG  = sum(has_IgG & has_IgM) / sum(has_IgM)),
                    by = participant]
shared[, Hiv_Status := factor(unname(participant_status[participant]), levels = hiv_levels)]
shared[, sample := participant]
shared[, all := "IgG-IgM"]

st_g <- group_stats(shared, "frac_IgG_with_IgM", by = "all")
st_m <- group_stats(shared, "frac_IgM_with_IgG", by = "all")
print(st_g$wilcox); print(st_m$wilcox)

save_workbook(list(Per_participant = shared[, !c("sample", "all")],
                   IgG_with_IgM_summary = st_g$summary, IgG_with_IgM_Kruskal = st_g$kruskal, IgG_with_IgM_Wilcoxon = st_g$wilcox,
                   IgM_with_IgG_summary = st_m$summary, IgM_with_IgG_Kruskal = st_m$kruskal, IgM_with_IgG_Wilcoxon = st_m$wilcox),
              file.path(out_dir, "Shared_IgM_IgG_clones_stats.xlsx"))

plot_per_subject(shared, "frac_IgG_with_IgM", "IgG clones with IgM members (fraction)", "IgG clones shared with IgM",
                 file.path(out_dir, "frac_IgG_clones_with_IgM.png"))
plot_per_subject(shared, "frac_IgM_with_IgG", "IgM clones with IgG members (fraction)", "IgM clones shared with IgG",
                 file.path(out_dir, "frac_IgM_clones_with_IgG.png"))
