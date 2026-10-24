##############################################################################################################################################################
# Shared settings for the clone-level (outcome 2) analyses
# Heavy chain only (IgG, IgM); clones defined per participant on pooled IgG R1/R2 + IgM R1/R2
# (Clones/<participant>/<participant>_IGH_germ-pass.tsv, from Clones/scripts/run_clones_participant.sh)
#
# Groups, colours, theme and statistics follow Vis2025/27April2026/GeneUsage.v3.R,
# Wilcoxon_common.R and Vis2025/SHM_mean_per_subject.R
##############################################################################################################################################################

library(data.table)
library(dplyr)
library(ggplot2)
library(ggthemes)
library(ggbeeswarm)
library(openxlsx)

rerun_dir  <- "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023"
clone_dir  <- file.path(rerun_dir, "Clones")
out_root   <- file.path(clone_dir, "analysis", "output")
seq_table  <- file.path(out_root, "clone_sequences_IGH.csv.gz")
dir.create(out_root, showWarnings = FALSE, recursive = TRUE)

#HIV status per participant (same assignment as GeneUsage.v3.R, which lists <participant>_H_G / _H_M)
hiv_status_mapping <- list(
  `Pre-infection`      = c("D2032", "D2136", "D2211", "D2201", "D442p", "D1160p", "D1248p", "D946p", "D268p", "D272p",
                           "D198p", "D2350", "D2215", "D2542", "D2539", "D2331", "D2255", "D2262", "D2257", "D2136c", "D2257c"),
  `PLWH Early-treated` = c("D442", "D1160", "D1248", "D1210", "D946"),
  `PLWH Late-treated`  = c("D208", "D198", "D268a", "D093", "D272aa"),
  `Pre-ART`            = c("D268b", "D272ba", "D198ba")
)
participant_status <- unlist(lapply(names(hiv_status_mapping), function(s)
  setNames(rep(s, length(hiv_status_mapping[[s]])), hiv_status_mapping[[s]])))

hiv_levels      <- c("Pre-infection", "PLWH Early-treated", "Pre-ART", "PLWH Late-treated")
reference_group <- "Pre-infection"
isotypes        <- c("IgG", "IgM")

mycolors <- c(
  "Pre-infection"      = "#00b09a",
  "PLWH Early-treated" = "#d55e00",
  "PLWH Late-treated"  = "#9467bd",
  "Pre-ART"            = "#56b4e9"
)

#Participant from sample name (e.g. D093_H_G -> D093)
participant_of <- function(sample) sub("_H_[GM]$", "", sample)
status_of      <- function(sample) factor(unname(participant_status[participant_of(sample)]), levels = hiv_levels)

# Theme as in SHM_mean_per_subject.R / CDR3_mean_per_subject.R (per-subject figures)
theme_Publication <- function(base_size = 14, base_family = "sans") {
  theme_foundation(base_size = base_size, base_family = base_family) +
    theme(
      plot.title       = element_text(face = "bold", size = rel(1.2), hjust = 0.5),
      text             = element_text(),
      panel.background = element_rect(fill = "white", colour = NA),
      plot.background  = element_rect(fill = "white", colour = NA),
      panel.border     = element_rect(colour = NA),
      axis.title       = element_text(face = "bold", size = rel(1)),
      axis.title.y     = element_text(angle = 90, vjust = 2),
      axis.title.x     = element_text(vjust = 0),
      axis.text.x      = element_text(angle = 45, vjust = 1, hjust = 1),
      axis.line        = element_line(colour = "black"),
      axis.ticks       = element_line(),
      panel.grid.major = element_line(colour = "#f0f0f0"),
      panel.grid.minor = element_blank(),
      legend.key       = element_rect(colour = NA, fill = "white"),
      legend.margin    = margin(),
      legend.text      = element_text(size = rel(0.8)),
      legend.title     = element_text(face = "bold"),
      legend.position  = "right"
    )
}

#Kruskal-Wallis across groups + two-sided Wilcoxon (exact = FALSE) each group vs Pre-infection,
#BH across the three comparisons, separately for each level of `by` (e.g. isotype)
group_stats <- function(dt, value, by = "isotype") {
  dt <- as.data.table(dt)
  kruskal <- dt[, {
    k <- kruskal.test(get(value) ~ Hiv_Status)
    .(test = "Kruskal-Wallis", chi_squared = unname(k$statistic), df = unname(k$parameter),
      n_samples = .N, p_value = k$p.value)
  }, by = by]
  wilcox <- dt[, {
    ref <- get(value)[Hiv_Status == reference_group]
    res <- rbindlist(lapply(setdiff(hiv_levels, reference_group), function(g) {
      x <- get(value)[Hiv_Status == g]
      if (length(x) < 1 || length(ref) < 1)
        return(data.table(comparison = paste(g, "vs", reference_group), n_group = length(x), n_ref = length(ref),
                          median_group = NA_real_, median_ref = NA_real_, W_statistic = NA_real_, p_value = NA_real_))
      w <- wilcox.test(x, ref, exact = FALSE)
      data.table(comparison = paste(g, "vs", reference_group),
                 n_group = length(x), n_ref = length(ref),
                 median_group = median(x), median_ref = median(ref),
                 W_statistic = unname(w$statistic), p_value = w$p.value)
    }))
    res[, p_adj_BH := p.adjust(p_value, method = "BH")]
    res
  }, by = by]
  summary <- dt[, .(n_samples = .N, median = median(get(value)),
                    IQR_low = quantile(get(value), 0.25), IQR_high = quantile(get(value), 0.75),
                    min = min(get(value)), max = max(get(value))), by = c(by, "Hiv_Status")]
  list(summary = summary, kruskal = kruskal, wilcox = wilcox)
}

save_workbook <- function(sheets, file) {
  wb <- createWorkbook()
  headerStyle <- createStyle(textDecoration = "bold", fgFill = "#D9E1F2", border = "Bottom")
  for (s in names(sheets)) {
    addWorksheet(wb, s)
    writeData(wb, s, sheets[[s]])
    setColWidths(wb, s, cols = 1:ncol(sheets[[s]]), widths = "auto")
    addStyle(wb, s, headerStyle, rows = 1, cols = 1:ncol(sheets[[s]]))
  }
  saveWorkbook(wb, file, overwrite = TRUE)
  message("Saved ", file)
}

#Per-subject figure as in SHM_mean_per_subject.R: violin + box of per-sample values, one dot per sample
plot_per_subject <- function(d, value, ylab, title, out_png, y_lim = NULL) {
  d <- as.data.table(d)
  n_per_group <- d[, .N, by = Hiv_Status]
  x_labels <- setNames(paste0(n_per_group$Hiv_Status, "\n(n = ", n_per_group$N, ")"),
                       as.character(n_per_group$Hiv_Status))
  p <- ggplot(d, aes(x = Hiv_Status, y = .data[[value]], fill = Hiv_Status)) +
    geom_violin(alpha = 0.7, scale = "width", trim = TRUE) +
    geom_beeswarm(shape = 21, colour = "black", stroke = 0.6, size = 2.8, cex = 3,
                  corral = "wrap", corral.width = 0.8) +
    geom_boxplot(width = 0.1, outlier.shape = NA, alpha = 0.6, fill = "white") +
    ggtitle(title) +
    scale_x_discrete(labels = x_labels, drop = FALSE) +
    scale_fill_manual(values = mycolors) +
    xlab(NULL) + ylab(ylab) +
    theme_Publication() +
    theme(legend.position = "none")
  if (!is.null(y_lim)) p <- p + coord_cartesian(ylim = y_lim)
  ggsave(out_png, plot = p, width = 5.5, height = 6, bg = "white", dpi = 800)
  message("Saved ", out_png)
  invisible(p)
}
