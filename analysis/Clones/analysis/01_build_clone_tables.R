##############################################################################################################################################################
# Build one compact per-sequence table of all clone-assigned heavy-chain sequences
#   - clone_id made unique across participants (<participant>_<clone_id>)
#   - SHM recomputed with SHazaM observedMutations against the D-masked clonal germline, split at IMGT position 78:
#       shm_cdr1_fwr3 = mutation frequency (R+S, %) over IMGT 79-312 (CDR1-FWR3), used for analysis
#       shm_fwr1      = mutation frequency (%) over IMGT 1-78; inflated by the VH FR1 primers (NR_VHPrimers), not used
#       shm_v_identity = (1 - v_identity) * 100, the measure used in the per-sequence analysis, kept for comparison
#   - cdr3_aa_length = junction_length / 3 - 2 (IMGT junction minus the conserved C and W/F)
# Per-participant results are cached in output/per_participant/; delete them to recompute.
##############################################################################################################################################################

source("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Clones/analysis/00_clone_common.R")
suppressPackageStartupMessages(library(shazam))

cache_dir <- file.path(out_root, "per_participant")
dir.create(cache_dir, showWarnings = FALSE)

#IMGT V split at the end of FWR1 (position 78)
fwr1_split <- createRegionDefinition(
  name = "IMGT_V_FWR1_vs_CDR1toFWR3",
  boundaries = factor(c(rep("fwr1", 78), rep("cdr1tofwr3", 234)), levels = c("fwr1", "cdr1tofwr3")),
  description = "IMGT V split at position 78 (end of FWR1)")

keep_cols <- c("sequence_id", "sample", "isotype", "replicate", "library", "clone_id",
               "v_call_genotyped", "d_call", "j_call", "junction_length", "v_identity",
               "consensus_count", "duplicate_count", "sequence_alignment", "germline_alignment_d_mask")

build_participant <- function(pid) {
  cache <- file.path(cache_dir, paste0(pid, "_clone_sequences.csv.gz"))
  if (file.exists(cache)) return(fread(cache))
  f <- file.path(clone_dir, pid, paste0(pid, "_IGH_germ-pass.tsv"))
  message("Reading ", f)
  d <- fread(f, select = keep_cols, sep = "\t", quote = "")
  d <- as.data.frame(d)
  d <- observedMutations(d, sequenceColumn = "sequence_alignment", germlineColumn = "germline_alignment_d_mask",
                         regionDefinition = fwr1_split, frequency = TRUE, combine = FALSE, nproc = 4)
  d <- as.data.table(d)
  d[, `:=`(participant    = pid,
           clone_id       = paste0(pid, "_", clone_id),
           shm_cdr1_fwr3  = (mu_freq_cdr1tofwr3_r + mu_freq_cdr1tofwr3_s) * 100,
           shm_fwr1       = (mu_freq_fwr1_r + mu_freq_fwr1_s) * 100,
           shm_v_identity = (1 - v_identity) * 100,
           cdr3_aa_length = junction_length / 3 - 2)]
  d[, c("sequence_alignment", "germline_alignment_d_mask", "v_identity",
        grep("^mu_freq_", names(d), value = TRUE)) := NULL]
  fwrite(d, cache)
  d
}

participants <- names(participant_status)
done <- participants[file.exists(file.path(clone_dir, participants, paste0(participants, "_IGH_germ-pass.tsv")))]
missing <- setdiff(participants, done)
if (length(missing) > 0) warning("No clone table yet for: ", paste(missing, collapse = ", "))

all_seq <- rbindlist(lapply(done, build_participant))
all_seq[, Hiv_Status := status_of(sample)]
stopifnot(!anyNA(all_seq$Hiv_Status))
fwrite(all_seq, seq_table)
message("Saved ", seq_table, ": ", nrow(all_seq), " sequences, ", uniqueN(all_seq$clone_id), " clones, ",
        length(done), " participants")
