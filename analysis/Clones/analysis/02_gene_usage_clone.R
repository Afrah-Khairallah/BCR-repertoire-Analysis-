##############################################################################################################################################################
# Clone-level V/D/J gene usage, IgG and IgM
#   Each clone is counted once per sample (alakazam countGenes with clone = "clone_id"), so expanded clones do not
#   inflate usage. A clone containing both IgG and IgM sequences is counted once in each isotype.
#   V gene = TIgGER genotype-corrected call (v_call_genotyped); D and J = IgBLAST calls.
#   Family (e.g. IGHV3) and gene (e.g. IGHV3-23) level, as in the per-sequence tables (H_V_family_f.csv etc.)
#
# Statistics as in 27April2026/Wilcoxon_common.R: per gene, two-sided Wilcoxon rank-sum (exact = FALSE) of each group
# vs Pre-infection on per-sample clone frequencies; BH within each gene-set x comparison family.
# Figures as in GeneUsage.v3.R (violin + jitter + box per gene, same colours and gene selections).
##############################################################################################################################################################

source("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Clones/analysis/00_clone_common.R")
suppressPackageStartupMessages({ library(alakazam); library(ggbreak) })

out_dir <- file.path(out_root, "GeneUsage")
dir.create(out_dir, showWarnings = FALSE)

db <- fread(seq_table, select = c("sample", "isotype", "clone_id", "v_call_genotyped", "d_call", "j_call"))

#Gene selections for the gene-level figures, as in GeneUsage.v3.R
selected_genes <- list(
  IgG = list(v_call_genotyped = c("IGHV3-23", "IGHV3-30", "IGHV1-69", "IGHV3-33", "IGHV4-39",
                                  "IGHV3-21", "IGHV1-18", "IGHV3-11", "IGHV3-7",  "IGHV4-34"),
             d_call = c("IGHD3-10", "IGHD3-22", "IGHD6-19", "IGHD1-26", "IGHD6-6",  "IGHD3-16",
                        "IGHD3-3",  "IGHD2-2",  "IGHD2-15", "IGHD2-21", "IGHD4-17", "IGHD3-9")),
  IgM = list(v_call_genotyped = c("IGHV3-30", "IGHV4-59", "IGHV4-39", "IGHV1-69", "IGHV1-46", "IGHV3-11",
                                  "IGHV3-23", "IGHV4-34", "IGHV3-7",  "IGHV3-21", "IGHV3-48", "IGHV3-30-3"),
             d_call = c("IGHD3-10", "IGHD3-22", "IGHD6-19", "IGHD1-26", "IGHD6-6",  "IGHD3-16",
                        "IGHD3-3",  "IGHD2-2",  "IGHD2-15", "IGHD2-21", "IGHD4-17", "IGHD3-9"))
)
gene_cols <- c(V = "v_call_genotyped", D = "d_call", J = "j_call")
modes     <- c(family = "family", Subfamily = "gene")

theme_gene <- function(base_size = 14, base_family = "sans") {
  theme_Publication(base_size, base_family) +
    theme(plot.title = element_blank(), axis.title.x = element_blank(),
          axis.title.y = element_text(angle = 90, vjust = 2, face = "bold", size = rel(1.1)),
          axis.line = element_line(colour = "black", linewidth = 0.8))
}

make_labels <- function(df) {
  counts <- df %>% group_by(Hiv_Status) %>% summarise(n = n_distinct(sample), .groups = "drop")
  setNames(paste0(counts$Hiv_Status, " (n=", counts$n, ")"), counts$Hiv_Status)
}

#Per-gene Wilcoxon vs Pre-infection, BH across genes within each comparison (Wilcoxon_common.R convention)
gene_wilcox <- function(df) {
  df <- as.data.table(df)
  res <- rbindlist(lapply(setdiff(hiv_levels, reference_group), function(g) {
    r <- rbindlist(lapply(sort(unique(df$gene)), function(gn) {
      x <- df[gene == gn & Hiv_Status == g, clone_freq]
      y <- df[gene == gn & Hiv_Status == reference_group, clone_freq]
      if (length(x) < 1 || length(y) < 1)
        return(data.table(gene = gn, comparison = paste(g, "vs", reference_group), n_group = length(x), n_ref = length(y),
                          median_group = NA_real_, median_ref = NA_real_, W_statistic = NA_real_, p_value = NA_real_,
                          note = "skipped: empty group (n<1)"))
      w <- wilcox.test(x, y, exact = FALSE)
      data.table(gene = gn, comparison = paste(g, "vs", reference_group), n_group = length(x), n_ref = length(y),
                 median_group = median(x), median_ref = median(y), W_statistic = unname(w$statistic),
                 p_value = w$p.value, note = NA_character_)
    }))
    r[, p_adj_BH := p.adjust(p_value, method = "BH")]
    r
  }))
  setcolorder(res, c("gene", "comparison", "n_group", "n_ref", "median_group", "median_ref",
                     "W_statistic", "p_value", "p_adj_BH", "note"))
  res[order(comparison, gene)]
}

gene_plot <- function(df, out_png) {
  labs_n <- make_labels(df)
  p <- ggplot(df, aes(x = reorder(gene, -clone_freq, FUN = median), y = clone_freq, fill = Hiv_Status)) +
    geom_violin(alpha = 0.7, scale = "width", position = position_dodge(width = 0.75)) +
    geom_jitter(aes(fill = Hiv_Status),
                position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75),
                size = 1, alpha = 0.9, stroke = 0.1, shape = 21, color = "black") +
    geom_boxplot(width = 0.2, position = position_dodge(width = 0.75),
                 outlier.shape = NA, alpha = 1, color = "black", size = 0.45) +
    labs(y = "Clone frequency", fill = "HIV Status") +
    scale_fill_manual(values = mycolors, labels = labs_n) +
    theme_gene()
  ggsave(out_png, plot = p, width = 10, height = 4, dpi = 600, bg = "white")
  message("Saved ", out_png)
}

for (iso in isotypes) {
  prefix <- if (iso == "IgG") "H" else "HM"
  d_iso <- as.data.frame(db[isotype == iso])
  tables <- list(); stats <- list()
  for (seg in names(gene_cols)) for (m in names(modes)) {
    col <- gene_cols[[seg]]
    if (seg == "D") d_use <- d_iso[!is.na(d_iso$d_call) & d_iso$d_call != "", ] else d_use <- d_iso
    g <- countGenes(d_use, gene = col, groups = "sample", clone = "clone_id", mode = modes[[m]])
    g <- as.data.table(g)
    setnames(g, col, "gene", skip_absent = TRUE)
    g[, Hiv_Status := status_of(sample)]
    name <- paste0(prefix, "_", seg, "_", m)
    fwrite(g, file.path(out_dir, paste0(name, "_clone.csv")))
    tables[[name]] <- g
    stats[[name]] <- gene_wilcox(g)
    if (m == "family" || seg == "J") {
      gene_plot(g, file.path(out_dir, paste0(name, "_clone.png")))
    } else if (!is.null(selected_genes[[iso]][[col]])) {
      gene_plot(g[gene %in% selected_genes[[iso]][[col]]], file.path(out_dir, paste0(name, "_clone.png")))
    }
  }
  save_workbook(tables, file.path(out_dir, paste0(prefix, "_gene_usage_clone_frequencies.xlsx")))
  all_stats <- rbindlist(stats, idcol = "gene_set")
  save_workbook(c(stats, list(All_comparisons = all_stats)),
                file.path(out_dir, paste0("Wilcoxon_", if (iso == "IgG") "HG" else "HM", "_clone_vs_PreInfection.xlsx")))
  message(iso, ": ", sum(all_stats$p_adj_BH < 0.05, na.rm = TRUE), " gene tests significant (BH p<0.05) of ", nrow(all_stats))
}
