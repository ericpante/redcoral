# PCA on RAD seuqencing data
# for details and tutorials on PCA see: https://adegenet.r-forge.r-project.org/files/tutorial-basics.pdf
# adapt the script to your local directory and file names

# install packages; for example:

install.packages("pegas")

# the installation of adegenet may take some time and require some dependencies


# load packages (some of them are just for plotting)

library(ape)
library(ade4)
library(adegenet)
library(pegas)
library(RColorBrewer)
library(ggsci)


# set working directory: command line or in the lower right panel, choose file, go to your directory
# then choose "more" > "set as working directory" 

setwd("~/Nextcloud/red_coral_GFCM")

# import individuals list 
# prepare a popfile in text alone (no word!): first column with individual names, second column with population name
# import population file:

popsCorallium <- read.csv("popfile_Corallium.txt", header = FALSE, sep = "")
View(popsCorallium)

# import vcf file
# the last argument corresponds to the limit in the number of markers

Corallium_vcf <- read.vcf("Corallium_RAD_filtered.vcf", from = 1, to = 60000)
Corallium_ind <- loci2genind(Corallium_vcf)

# assign populations to individuals in the genind file and check order
pop(Corallium_ind) <- popsCorallium[,2]
Corallium_ind$pop


# perform PCA; first scale the data
Corallium_scaled <- scaleGen(Corallium_ind, NA.method = "mean")

# PCA with 10 factors retained (see tutorial for more information)
pcaCorallium <- dudi.pca(Corallium_scaled, scale=FALSE, nf = 10, scannf = FALSE)

# check the results
summary(pcaCorallium)
pcaCorallium$li

# what is the percentage of variance explained by the different axes?
# what are the coordinates of the first individual on the first four axis?


# plot the results
# simple plot, test the different possibilities (see tutorial for other representations)

s.label(pcaCorallium_pop$li, xax = 1, yax = 2)

# with some colors
# the number of colors should correspond to the number of groups / populations
# list of available colors http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
# plot on different axes

couls <- c("orange", "blue", "green", "grey")
s.class(dfxy = pcaCorallium$li, fac = pop(Corallium_ind), xax = 1, 
        yax = 2, cstar = 0, cellipse = 0, clabel = 1, cpoint = 6, pch = 19, col = couls, grid = FALSE)

# export the plot with more options for picture format and size
# the picture will be saved in your working directory

tiff("PCA_Corallium_axis1-2.tiff", width = 3000, height = 1500, units = "px", res=300)
s.class(dfxy = pcaCorallium$li, fac = pop(Corallium_ind), xax = 1, 
        yax = 2, cstar = 0, cellipse = 0, clabel = 0, cpoint = 6, pch = 21,
        col = couls, grid = FALSE)
dev.off()

tiff("PCA_Corallium_axis3-4.tiff", width = 3000, height = 1500, units = "px", res=300)
s.class(dfxy = pcaCorallium$li, fac = pop(Corallium_ind), xax = 3, 
        yax = 4, cstar = 0, cellipse = 0, clabel = 0, cpoint = 6, 
        col = couls, grid = FALSE)
dev.off()

# other options are available with ggplot2
# https://ggplot2.tidyverse.org/ 
