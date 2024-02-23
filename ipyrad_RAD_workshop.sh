#!/bin/bash

################################ Slurm options #################################

### Job name
#SBATCH --job-name=DA

### Limit run time "days-hours:minutes:seconds"
#SBATCH --time=2:00:00

### Requirements
#SBATCH --partition=fast
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=48GB
#SBATCH --account=2402_redcoral

### Email
#SBATCH --mail-user=didier.aurelle@univ-amu.fr
#SBATCH --mail-type=ALL

### Output
#SBATCH --output=/shared/home/daurelle/ipyrad-%j.out  ### replace epante by your account name

######################## Info Printed as Standard Output #########################

echo '########################################'
echo 'Date:' $(date --iso-8601=seconds)
echo 'User:' $USER
echo 'Host:' $HOSTNAME
echo 'Job Name:' $SLURM_JOB_NAME
echo 'Job Id:' $SLURM_JOB_ID
echo 'Directory:' $(pwd)
echo '########################################'

######################## loading ipyrad and running it #########################

# modules loading

module load ipyrad/0.9.84

cd /shared/projects/2402_redcoral/daurelle


# first create a parameter file
# module load ipyrad/0.9.84

# demultiplex
# ipyrad -p params-lib5_DA.txt -s 1  # careful, no extention, '.txt', no special character!

# running all other analyses 
#ipyrad -p params-lib5_DA.txt -s 1234567 -f

### ipryad on two libraries

# separate demultiplexing (create the parameter files first)

#ipyrad -p params-Lib_6.txt -s 1

#ipyrad -p params-Lib_7.txt -s 1

# merge the two libraries

#ipyrad -m Pool67 params-Lib_6.txt params-Lib_7.txt

# modify the parameter file and launch the analysis

ipyrad -p params-Pool67.txt -s 234567 -f





