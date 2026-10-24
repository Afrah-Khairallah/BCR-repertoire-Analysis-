##############################################################################################################################################################
# Clonal expansion and diversity per sample (IgG, IgM)
#   Clone size = number of unique sequences assigned to the clone in that sample.
#   Expansion metrics: number of clones, fraction of singleton clones, fraction of sequences in the 10 largest clones.
#   Diversity: alakazam alphaDiversity (Hill numbers, q = 0-4), uniformly rarefied to the smallest sample
#   (min_n = 30) with 200 bootstrap re-samplings; q = 0 (richness), 1 (Shannon), 2 (Simpson) compared between groups.
##############################################################################################################################################################

source("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Clones/analysis/00_clone_common.R")
suppressPackageStartupMessages(library(alakazam))

out_dir <- file.path(out_root, "Clonality")
dir.create(out_dir, showWarnings = FALSE)

db <- fread(seq_table, select = c("sample", "isotype", "clone_id"))

sizes <- db[, .(clone_size = .N), by = .(isotype, sample, clone_id)]
expansion <- sizes[order(-clone_size), .(n_sequences        = sum(clone_size),
                                         n_clones           = .N,
                                         frac_singletons    = mean(clone_size == 1),
                                         frac_seq_top10     = sum(head(clone_size, 10)) / sum(clone_size),
                                         largest_clone_frac = max(clone_size) / sum(clone_size)),
                   by = .(isotype, sample)]
expansion[, Hiv_Status := status_of(sample)]

metrics <- c(frac_seq_top10 = "Sequences in 10 largest clones (fraction)",
             frac_singletons = "Singleton clones (fraction)")
exp_stats <- lapply(names(metrics), function(m) group_stats(expansion, m))
names(exp_stats) <- names(metrics)

#Hill diversity, rarefied to the smallest sample within each isotype
div_list <- list()
for (iso in isotypes) {
  d <- as.data.frame(db[isotype == iso])
  set.seed(12345)
  div <- alphaDiversity(d, group = "sample", clone = "clone_id", min_q = 0, max_q = 4, step_q = 0.5,
                        nboot = 200, min_n = 30, uniform = TRUE)
  dd <- as.data.table(div@diversity)
  dd[, isotype := iso]
  div_list[[iso]] <- dd
  message(iso, ": rarefied to ", div@n[1], " sequences per sample")
}
diversity <- rbindlist(div_list, use.names = TRUE, fill = TRUE)
diversity[, Hiv_Status := status_of(sample)]
fwrite(diversity, file.path(out_dir, "Hill_diversity_curves.csv"))

hill <- dcast(diversity[q %in% c(0, 1, 2)], isotype + sample + Hiv_Status ~ paste0("hill_q", q), value.var = "d")
div_stats <- lapply(c("hill_q0", "hill_q1", "hill_q2"), function(m) group_stats(hill, m))
names(div_stats) <- c("hill_q0", "hill_q1", "hill_q2")

sheets <- list(Expansion_per_sample = expansion, Hill_per_sample = hill)
for (m in names(exp_stats)) {
  sheets[[paste0(m, "_Kruskal")]] <- exp_stats[[m]]$kruskal
  sheets[[paste0(m, "_Wilcoxon")]] <- exp_stats[[m]]$wilcox
}
for (m in names(div_stats)) {
  sheets[[paste0(m, "_Kruskal")]] <- div_stats[[m]]$kruskal
  sheets[[paste0(m, "_Wilcoxon")]] <- div_stats[[m]]$wilcox
}
save_workbook(sheets, file.path(out_dir, "Clonality_diversity_stats.xlsx"))

for (iso in isotypes) {
  for (m in names(metrics))
    plot_per_subject(expansion[isotype == iso], m, metrics[[m]], iso,
                     file.path(out_dir, paste0(m, "_", iso, ".png")), c(0, 1))
  for (m in c("hill_q0", "hill_q1", "hill_q2"))
    plot_per_subject(hill[isotype == iso], m, paste0("Hill diversity, q = ", sub("hill_q", "", m)), iso,
                     file.path(out_dir, paste0(m, "_", iso, ".png")))

  #Diversity curves: group median across samples, with per-sample curves faint
  dcur <- diversity[isotype == iso]
  gmed <- dcur[, .(d = median(d)), by = .(Hiv_Status, q)]
  p <- ggplot(dcur, aes(x = q, y = d, colour = Hiv_Status)) +
    geom_line(aes(group = sample), alpha = 0.25) +
    geom_line(data = gmed, linewidth = 1.2) +
    scale_colour_manual(values = mycolors, name = "HIV Status") +
    scale_y_log10() +
    ggtitle(iso) + xlab("Order (q)") + ylab("Hill diversity (D)") +
    theme_Publication() + theme(axis.text.x = element_text(angle = 0, hjust = 0.5))
  ggsave(file.path(out_dir, paste0("Hill_diversity_curves_", iso, ".png")), plot = p,
         width = 7, height = 5, bg = "white", dpi = 800)
}
