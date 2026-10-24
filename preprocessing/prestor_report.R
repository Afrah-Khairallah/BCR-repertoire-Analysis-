library(alakazam)
library(prestor)

# Run parameters
SAMPLE_PATH <- getwd()
SIZING="figure"
pdf("prestoR_output.pdf") 
## Plot Console Log
console_log <- loadConsoleLog(file.path(SAMPLE_PATH, "Pipeline.log"))
plotConsoleLog(console_log, sizing=SIZING)

## Plot FilterSeq Logs

quality_log_1 <- loadLogTable(file.path(SAMPLE_PATH, "QualityLogR1_table.tab" ))
quality_log_2 <- loadLogTable(file.path(SAMPLE_PATH, "QualityLogR2_table.tab" ))
plotFilterSeq(quality_log_1, quality_log_2, titles=c("Read 1", "Read 2"), sizing=SIZING)


## Plot MaskPrimers Logs

primer_log_1 <- loadLogTable(file.path(SAMPLE_PATH, "PrimerLogR1_table.tab" ))
primer_log_2 <- loadLogTable(file.path(SAMPLE_PATH, "PrimerLogR2_table.tab" ))
# This data lacks PRSTART. Add some dummy values as an example.
primer_log_1$PRSTART <- 17
primer_log_2$PRSTART <- 0
plotMaskPrimers(primer_log_1, primer_log_2, titles=c("Read 1", "Read 2"), 
                style="hist", sizing=SIZING)
plotMaskPrimers(primer_log_1, primer_log_2, titles=c("Read 1", "Read 2"), 
                style="count", sizing=SIZING)
plotMaskPrimers(primer_log_1, primer_log_2, titles=c("Read 1", "Read 2"), 
                style="error", sizing=SIZING)
plotMaskPrimers(primer_log_1, primer_log_2, titles=c("Read 1", "Read 2"), 
                style="pos", sizing=SIZING)

## Plot BuildConsensus Logs

consensus_log_1 <- loadLogTable(file.path(SAMPLE_PATH, "ConsensusLogR1_table.tab"))
consensus_log_2 <- loadLogTable(file.path(SAMPLE_PATH, "ConsensusLogR2_table.tab"))
plotBuildConsensus(consensus_log_1, consensus_log_2, titles=c("Read 1", "Read 2"), 
                   style="size", sizing=SIZING)
plotBuildConsensus(consensus_log_1, consensus_log_2, titles=c("Read 1", "Read 2"), 
                   style="error", sizing=SIZING)
plotBuildConsensus(consensus_log_1, consensus_log_2, titles=c("Read 1", "Read 2"), 
                   style="prfreq", sizing=SIZING)
plotBuildConsensus(consensus_log_1, consensus_log_2, titles=c("Read 1", "Read 2"), 
                   style="prsize", sizing=SIZING)
plotBuildConsensus(consensus_log_1, consensus_log_2, titles=c("Read 1", "Read 2"), 
                   style="prerror", sizing=SIZING)

## Plot AssemblePairs Logs
#assemble_log <- loadLogTable(file.path(SAMPLE_PATH, "AssembleLog_table.tab"))
#align_fields <- c("ERROR", "PVALUE")
#ref_fields <- c("REFID", "GAP", "EVALUE1", "EVALUE2", "IDENTITY")
#align_log <- assemble_log[!is.na(assemble_log$ERROR), !(names(assemble_log) %in% ref_fields)]
#ref_log <- assemble_log[!is.na(assemble_log$REFID), !(names(assemble_log) %in% align_fields)]
#plotAssemblePairs(align_log, ref_log, titles=c("Align", "Reference"), 
#                  style="error", sizing=SIZING)
#plotAssemblePairs(align_log, ref_log, titles=c("Align", "Reference"), 
#                  style="pvalue", sizing=SIZING)
#plotAssemblePairs(align_log, ref_log, titles=c("Align", "Reference"), 
#                  style="length", sizing=SIZING)
#plotAssemblePairs(align_log, ref_log, titles=c("Align", "Reference"), 
#                  style="overlap", sizing=SIZING)
#plotAssemblePairs(align_log, ref_log, titles=c("Align", "Reference"), 
#                  style="hex", sizing=SIZING)
#plotAssemblePairs(align_log, ref_log, titles=c("Align", "Reference"), 
#                  style="field", field="PRCONS", sizing=SIZING)
#plotAssemblePairs(align_log, ref_log, titles=c("Align", "Reference"), 
#                  style="field", field="CONSCOUNT", sizing=SIZING)


## Plot ParseHeaders Logs

parse_log_1 <- loadLogTable(file.path(SAMPLE_PATH, "Final-Unique_headers.tab"))
parse_log_2 <- loadLogTable(file.path(SAMPLE_PATH, "Final-Unique-Atleast2_headers.tab"))
plotParseHeaders(parse_log_1, parse_log_2, titles=c("Total", "Atleast 2 Reads"), 
                 style="primer", sizing=SIZING)
plotParseHeaders(parse_log_1, parse_log_2, titles=c("Total", "Atleast 2 Reads"), 
                 style="count", count="DUPCOUNT", sizing=SIZING) 
plotParseHeaders(parse_log_1, parse_log_2, titles=c("Total", "Atleast 2 Reads"), 
                 style="count", count="CONSCOUNT", sizing=SIZING) 
dev.off()
