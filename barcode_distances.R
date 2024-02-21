# R code to calculate the number of N differences between barcodes
# useful to set the max_barcode_mismatch parameter in ipyrad
# eric pante 2024-02-21

library(ape)
setwd("~/Desktop/")
read.dna("biscuit_lib4.fasta", format="fasta") -> didier
read.dna("biscuit_lib4.fasta", format="fasta", ) -> didier
dist.dna(didier, model="N")
