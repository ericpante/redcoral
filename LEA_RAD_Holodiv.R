# LEA snmf analysis of RAD data from Holodiv project
# if required install LEA R package
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("LEA")

library(LEA)
library(RColorBrewer)
setwd("~/Nextcloud/Amidex/analyses_RAD/")

# analysis Marseille only
# limit at 25% missing data

Marseille2_geno <- vcf2geno("Marseille2_SNP25_reordered.vcf")
Marseille2.at = snmf(Marseille2_geno, K = 1:10, ploidy = 2, entropy = TRUE, CPU = 1, repetitions = 10, project = "force")


IndMarseille2 <-  read.csv("liste_Marseille2_SNP25_reordered.txt", header = FALSE)

# check cross entropy

plot(Marseille2.at, col="blue4", cex=1.4, pch=19)

# plot replicates

par(mfrow=c(2,5))
for(i in 1:10){ qmatrix = Q(Marseille2.at, K = 2, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2.at, K = 3, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2.at, K = 4, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2.at, K = 5, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2.at, K = 6, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2.at, K = 7, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2.at, K = 8, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2.at, K = 9, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2.at, K = 10, run = i)
barplot(t(qmatrix))}

# plot best replicate for each K value  

par(mfrow=c(1,1))

my_colors = c("orange", "blue", "green", "grey")

bestMarseille2 = which.min(cross.entropy(Marseille2.at, K=2))
qmatrix = Q(Marseille2.at, K = 2, run = bestMarseille2)
barplot(t(qmatrix), names.arg = IndMarseille2[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))

bestMarseille2 = which.min(cross.entropy(Marseille2.at, K=3))
qmatrix = Q(Marseille2.at, K = 3, run = bestMarseille2)
barplot(t(qmatrix), names.arg = IndMarseille2[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))

bestMarseille2 = which.min(cross.entropy(Marseille2.at, K=4))
qmatrix = Q(Marseille2.at, K = 4, run = bestMarseille2)
barplot(t(qmatrix), names.arg = IndMarseille2[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))

bestMarseille2 = which.min(cross.entropy(Marseille2.at, K=5))
qmatrix = Q(Marseille2.at, K = 5, run = bestMarseille2)
barplot(t(qmatrix), names.arg = IndMarseille2[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))


# analysis Marseille only
# limit at 25% missing data and filter on loci with FIS < 0.8

Marseille2_08_geno <- vcf2geno("Marseille2_SNP25_FIS08.vcf")

Marseille2_08.at = snmf(Marseille2_08_geno, K = 1:10, ploidy = 2, entropy = TRUE, CPU = 1, repetitions = 10, project = "force")


IndMarseille2 <-  read.csv("liste_Marseille2_SNP25_reordered.txt", header = FALSE)

# check cross entropy

plot(Marseille2_08.at, col="blue4", cex=1.4, pch=19)

# plot replicates

par(mfrow=c(2,5))
for(i in 1:10){ qmatrix = Q(Marseille2_08.at, K = 2, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2_08.at, K = 3, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2_08.at, K = 4, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2_08.at, K = 5, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2_08.at, K = 6, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2_08.at, K = 7, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2_08.at, K = 8, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2_08.at, K = 9, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(Marseille2_08.at, K = 10, run = i)
barplot(t(qmatrix))}

# plot best replicate for each K value  

par(mfrow=c(1,1))

bestMarseille2_08 = which.min(cross.entropy(Marseille2_08.at, K=2))
qmatrix = Q(Marseille2_08.at, K = 2, run = bestMarseille2_08)
barplot(t(qmatrix), names.arg = IndMarseille2[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))

bestMarseille2_08 = which.min(cross.entropy(Marseille2_08.at, K=3))
qmatrix = Q(Marseille2_08.at, K = 3, run = bestMarseille2_08)
barplot(t(qmatrix), names.arg = IndMarseille2[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))

bestMarseille2_08 = which.min(cross.entropy(Marseille2_08.at, K=4))
qmatrix = Q(Marseille2_08.at, K = 4, run = bestMarseille2_08)
barplot(t(qmatrix), names.arg = IndMarseille2[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))

bestMarseille2_08 = which.min(cross.entropy(Marseille2_08.at, K=5))
qmatrix = Q(Marseille2_08.at, K = 5, run = bestMarseille2_08)
barplot(t(qmatrix), names.arg = IndMarseille2[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))



###### LEA analysis on dataset with 166 outlier loci from pcadapt  #############

outl_Marseille2_geno <- vcf2geno("outlier_Marseille2_08_order.vcf")
outl_Marseille2.at = snmf(outl_Marseille2_geno, K = 1:10, ploidy = 2, entropy = TRUE, CPU = 1, repetitions = 10, project = "force")


IndMarseille2_outl <-  read.csv("liste_reorder_outliers_Marseille2_08.txt", header = FALSE)

# check cross entropy

plot(outl_Marseille2.at, col="blue4", cex=1.4, pch=19)


# plot replicates

par(mfrow=c(2,5))
for(i in 1:10){ qmatrix = Q(outl_Marseille2.at, K = 2, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(outl_Marseille2.at, K = 3, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(outl_Marseille2.at, K = 4, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(outl_Marseille2.at, K = 5, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(outl_Marseille2.at, K = 6, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(outl_Marseille2.at, K = 7, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(outl_Marseille2.at, K = 8, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(outl_Marseille2.at, K = 9, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(outl_Marseille2.at, K = 10, run = i)
barplot(t(qmatrix))}

# plot best replicate for each K value  

par(mfrow=c(1,1))

bestMarseille2_08 = which.min(cross.entropy(outl_Marseille2.at, K=2))
qmatrix = Q(outl_Marseille2.at, K = 2, run = bestMarseille2_08)
barplot(t(qmatrix), names.arg = IndMarseille2_outl[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))

bestMarseille2_08 = which.min(cross.entropy(outl_Marseille2.at, K=3))
qmatrix = Q(outl_Marseille2.at, K = 3, run = bestMarseille2_08)
barplot(t(qmatrix), names.arg = IndMarseille2_outl[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))

bestMarseille2_08 = which.min(cross.entropy(outl_Marseille2.at, K=4))
qmatrix = Q(outl_Marseille2.at, K = 4, run = bestMarseille2_08)
barplot(t(qmatrix), names.arg = IndMarseille2_outl[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))

bestMarseille2_08 = which.min(cross.entropy(outl_Marseille2.at, K=5))
qmatrix = Q(outl_Marseille2.at, K = 5, run = bestMarseille2_08)
barplot(t(qmatrix), names.arg = IndMarseille2_outl[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))


# analysis Marseille only
##### 28 loci, top 1% FST ####

MarseilleTop1_geno <- vcf2geno("Marseille2_top01_COR_RIPL.recode.vcf")
MarseilleTop1.at = snmf(MarseilleTop1_geno, K = 1:10, ploidy = 2, entropy = TRUE, CPU = 12, repetitions = 10, project = "force")


IndMarseilleTop1 <-  read.csv("poplist_Marseille2_top1.txt", header = FALSE)

# check cross entropy

plot(MarseilleTop1.at, col="blue4", cex=1.4, pch=19)

# plot replicates

par(mfrow=c(2,5))
for(i in 1:10){ qmatrix = Q(MarseilleTop1.at, K = 2, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(MarseilleTop1.at, K = 3, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(MarseilleTop1.at, K = 4, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(MarseilleTop1.at, K = 5, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(MarseilleTop1.at, K = 6, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(MarseilleTop1.at, K = 7, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(MarseilleTop1.at, K = 8, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(MarseilleTop1.at, K = 9, run = i)
barplot(t(qmatrix))}

for(i in 1:10){ qmatrix = Q(MarseilleTop1.at, K = 10, run = i)
barplot(t(qmatrix))}

# plot best replicate for each K value  

par(mfrow=c(1,1))

bestMarseilleTop1 = which.min(cross.entropy(MarseilleTop1.at, K=2))
qmatrix = Q(MarseilleTop1.at, K = 2, run = bestMarseilleTop1)
barplot(t(qmatrix), names.arg = IndMarseilleTop1[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))

bestMarseilleTop1 = which.min(cross.entropy(MarseilleTop1.at, K=3))
qmatrix = Q(MarseilleTop1.at, K = 3, run = bestMarseilleTop1)
barplot(t(qmatrix), names.arg = IndMarseilleTop1[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))

bestMarseilleTop1 = which.min(cross.entropy(MarseilleTop1.at, K=4))
qmatrix = Q(MarseilleTop1.at, K = 4, run = bestMarseilleTop1)
barplot(t(qmatrix), names.arg = IndMarseilleTop1[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))

bestMarseilleTop1 = which.min(cross.entropy(MarseilleTop1.at, K=5))
qmatrix = Q(MarseilleTop1.at, K = 5, run = bestMarseilleTop1)
barplot(t(qmatrix), names.arg = IndMarseilleTop1[,1], cex.names = 0.8, las = 2, col = brewer.pal(6, "Dark2"))




