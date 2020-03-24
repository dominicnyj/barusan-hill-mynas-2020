library(SNPRelate)
library(xlsx)

hmyna.fn <- "hmyna.vcf"
snpgdsVCF2GDS(hmyna.fn, "hmyna.gds", method="copy.num.of.ref")

snpgdsSummary("hmyna.gds")

hmyna.gdsfile <- snpgdsOpen("hmyna.gds")
hmyna.pca <- snpgdsPCA(hmyna.gdsfile, autosome.only=FALSE)

# make a data.frame
tab <- data.frame(sample.id = hmyna.pca$sample.id,
                  EV1 = hmyna.pca$eigenvect[,1], # the first eigenvector
                  EV2 = hmyna.pca$eigenvect[,2], # the second eigenvector
                  EV3 = hmyna.pca$eigenvect[,3], # the second eigenvector
                  EV4 = hmyna.pca$eigenvect[,4], # the second eigenvector
                  EV5 = hmyna.pca$eigenvect[,5], # the second eigenvector
                  EV6 = hmyna.pca$eigenvect[,6], # the second eigenvector
                  EV7 = hmyna.pca$eigenvect[,7], # the second eigenvector
                  EV8 = hmyna.pca$eigenvect[,8], # the second eigenvector
                  EV9 = hmyna.pca$eigenvect[,9], # the second eigenvector
                  EV10 = hmyna.pca$eigenvect[,10], # the second eigenvector
                  stringsAsFactors = FALSE)

#extract vectors out for external plotting
write.xlsx(tab, "hmyna_pca.xlsx")

plot(tab$EV2, tab$EV1, xlab="eigenvector 2", ylab="eigenvector 1")
