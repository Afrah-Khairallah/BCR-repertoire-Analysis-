# Per-participant heavy-chain preparation for clonal assignment
#   1. pool productive IGH sequences from IgG R1/R2 and IgM R1/R2 (complete db-pass tables)
#   2. TIgGER: novel alleles, Bayesian genotype, reassign V calls (v_call_genotyped)
#   3. SHazaM clonal threshold on v_call_genotyped (density, gmm fallback)
# Usage: Rscript clone_prep.R <participant> <library_map.tsv> <out_dir>

suppressPackageStartupMessages({
  library(airr)
  library(alakazam)
  library(shazam)
  library(tigger)
  library(dplyr)
})

args <- commandArgs(trailingOnly = TRUE)
pid <- args[1]; map_file <- args[2]; out_dir <- args[3]
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)
germ_ighv <- readIgFasta("~/share/germlines/imgt/human/vdj/imgt_human_IGHV.fasta")

# 1. Pool libraries
lib_map <- read.delim(map_file, stringsAsFactors = FALSE)
lib_map <- lib_map[lib_map$participant == pid, ]
stopifnot(nrow(lib_map) > 0)
db <- bind_rows(lapply(seq_len(nrow(lib_map)), function(i) {
  d <- read_rearrangement(lib_map$path[i])
  d <- d[d$productive %in% TRUE & d$locus == "IGH", ]
  d$sequence_id <- paste0(lib_map$library[i], "|", d$sequence_id)
  d$library <- lib_map$library[i]
  d$sample <- lib_map$sample[i]
  d$isotype <- ifelse(grepl("_H_G$", lib_map$sample[i]), "IgG", "IgM")
  d$replicate <- ifelse(grepl("_[GM]1", lib_map$library[i]), "R1", "R2")
  d
}))
cat("pooled productive IGH sequences:", nrow(db), "\n")
print(table(db$library))

# 2. TIgGER genotyping
# pos_range starts at IMGT position 80 (CDR1 onwards): the VH FR1 primers (NR_VHPrimers, ~25 nt)
# anneal within FR1, and primer-derived bases there produce family-wide false "novel" alleles
novel <- findNovelAlleles(db, germline_db = germ_ighv, v_call = "v_call", pos_range = 80:312, nproc = 4)
novel_sel <- selectNovel(novel)
cat("novel alleles detected:", sum(!is.na(novel_sel$polymorphism_call)), "\n")
geno <- inferGenotypeBayesian(db, germline_db = germ_ighv, novel = novel,
                              v_call = "v_call", find_unmutated = TRUE)
geno_seqs <- genotypeFasta(geno, germ_ighv, novel)
db <- reassignAlleles(db, geno_seqs, v_call = "v_call")
write.table(geno, file.path(out_dir, paste0(pid, "_genotype.tsv")), sep = "\t", row.names = FALSE, quote = FALSE)
writeFasta <- function(seqs, file) writeLines(paste0(">", names(seqs), "\n", seqs), file)
writeFasta(geno_seqs, file.path(out_dir, paste0(pid, "_IGHV_genotype.fasta")))
write.table(novel, file.path(out_dir, paste0(pid, "_novel_alleles.tsv")), sep = "\t", row.names = FALSE, quote = FALSE)
png(file.path(out_dir, paste0(pid, "_genotype.png")), width = 800, height = 1200)
plotGenotype(geno, text_size = 10)
dev.off()

# 3. Clonal threshold (same settings as R_tuning.R, on genotyped V calls)
dist <- distToNearest(db, sequenceColumn = "junction", vCallColumn = "v_call_genotyped",
                      jCallColumn = "j_call", model = "ham", normalize = "len",
                      nproc = 4, subsample = 10000)
thr_method <- "density"
fit <- tryCatch(findThreshold(dist$dist_nearest, method = "density"), error = function(e) NULL)
if (is.null(fit) || is.na(fit@threshold)) {
  thr_method <- "gmm"
  fit <- tryCatch(findThreshold(dist$dist_nearest, method = "gmm", model = "gamma-gamma"),
                  error = function(e) NULL)
}
threshold <- if (is.null(fit) || is.na(fit@threshold)) NA else fit@threshold
if (!is.null(fit)) {
  png(file.path(out_dir, paste0(pid, "_threshold.png")))
  plot(fit, title = paste(pid, thr_method))
  dev.off()
}
writeLines(c(paste0("threshold\t", threshold), paste0("method\t", thr_method)),
           file.path(out_dir, paste0(pid, "_threshold.txt")))
cat("threshold:", threshold, "(", thr_method, ")\n")

write_rearrangement(db, file.path(out_dir, paste0(pid, "_IGH_genotyped.tsv")))
