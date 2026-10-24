library(shazam)
library(alakazam)
db <- alakazam::readChangeoDb("FIN_collapse-unique_igblast_db-pass.tsv")
locus_call <- names(sort(table(db$locus), decreasing = TRUE))[1]
dist_ham <- distToNearest(db, sequenceColumn="junction", vCallColumn="v_call", jCallColumn="j_call", model="ham", normalize="len", nproc=1, locusValues=c(locus_call), subsample=10000)
output <- findThreshold(dist_ham$dist_nearest, method="density")
threshold <- output@threshold
png(file="R_tuning.png")
plot(output, title="Density Method")
dev.off()

write.table(print(output), file="R_output.txt",sep = "\t", row.names = FALSE)
