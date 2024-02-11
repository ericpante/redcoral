#!/bin/bash

################################ Slurm options #################################

### Job name
#SBATCH --job-name=vcf_RAD

### Limit run time "days-hours:minutes:seconds"
#SBATCH --time=00:15:00

### Requirements
#SBATCH --partition=fast
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=2GB
#SBATCH --account=2402_redcoral

### Email
#SBATCH --mail-user=didier.aurelle@univ-amu.fr
#SBATCH --mail-type=ALL

### Output
#SBATCH --output=/shared/home/daurelle/vcfRAD-%j.out

################################################################################


module load  vcftools/0.1.16 

cd /shared/projects/2402_redcoral

vcftools --vcf RAD_Corallium_test_30ind.vcf --missing-indv --out list_missing_indiv.txt 

vcftools --vcf RAD_Corallium_test_30ind.vcf --max-missing 0.75 --recode --out RAD_Corallium_test_30ind_75.vcf
