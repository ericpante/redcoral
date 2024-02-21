### Access to a remote computer :
 - if you are on linux, you can use the `ssh`command below using the `Konsole` app.
 - if you are on MacOS, you can use the `ssh`command below using the `Terminal` app.
 - if you are on Windows, you will need to download and install an app to communicate to a remote computer via the `ssh`protocol (this is called a ssh client). here are three options : https://mobaxterm.mobatek.net/download-home-edition.html , https://putty.org and https://ubuntu.com/desktop/wsl
 - another strategy alltogether is to get linux up and running on your windows system (macos was built on unix). Here are the instruction for running a virtual machine : https://github.com/ericpante/redcoral/blob/main/bioinfo_linux_engl.pdf for installing linux, we recommand ubuntu (https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview)

### More information on the IFB core cluster

https://ifb-elixirfr.gitlab.io/cluster/doc/logging-in/ 

### Access to SLURM (to submit jobs) :

```
ssh student1@core.cluster.france-bioinformatique.fr
```

### Access to the shared directory where data are stored :

```
cd /shared/projects/2402_redcoral
```
On this directory, we are going to use the following `fastq`files : 

```
[epante@core-login1 fastq_files]$ ls -l 
total 1267516
-rw-rw----+ 1 epante   epante   293995157 Feb  1 16:35 CR_lib4_sub.fastq.gz
-rw-rw----+ 1 epante   epante   298435685 Feb  2 13:06 CR_lib5_sub.fastq.gz
-rw-rw----+ 1 epante   epante   295771758 Feb  2 13:07 CR_lib6_sub.fastq.gz
-rw-rw----+ 1 epante   epante   409670192 Feb  2 13:08 CR_lib7_sub.fastq.gz
-rw-rw----+ 1 daurelle daurelle       563 Feb  1 16:35 barcodes_lib4.txt
-rw-rw----+ 1 daurelle daurelle       582 Feb  1 16:35 barcodes_lib5.txt
-rw-rw----+ 1 daurelle daurelle       583 Feb  1 16:35 barcodes_lib6.txt
-rw-rw----+ 1 daurelle daurelle       583 Feb  1 16:35 barcodes_lib7.txt
drwxrwx---+ 2 epante   epante        4096 Feb  2 13:22 biglibs
```

### Submit a job (when connected) with access to the resources dedicated to the training session :

```
sbatch my-job.sh -A 2402_redcoral
```
### Configuration of FileZilla (see screenshot below as well)

protocol : `SFTP-SSH`

host : core.cluster.france-bioinformatique.fr

authentification : ask password (see email with account details)

user : appr-2402-30

![image](https://github.com/ericpante/redcoral/assets/7203505/676f608e-3574-41ef-8d05-2aa9660843df)


### Distant site on FileZilla :

Home / scripts and job submission : /shared/home/appr-2402-30
(may appear as `/shared/ifbstor1/home/student1`)

Data storage : `/shared/projects/2402_redcoral/appr-2402-30`

### running ipyrad on the IFB cluster

You will need a folder with raw data and barcode/sample combination information. 
```
/shared/projects/2402_redcoral/fastq_files
```
To keep things unclutered, and to practice the use of the terminal, you can use the files from the shared project directly (`PATH` above) and put the results in your `HOME`directory. For me, the latter is : `/shared/home/epante/`. 

Create your `params` file. Name your file as `params_[lib]_[initials].txt`. 
to do so, write a `bash script`to load the `ipyrad` module and launch the analysis. 

```
#!/bin/bash

################################ Slurm options #################################

### Job name
#SBATCH --job-name=[YOUR_INITIALS]

### Limit run time "days-hours:minutes:seconds"
#SBATCH --time=0:30:00

### Requirements
#SBATCH --partition=fast
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=16GB
#SBATCH --account=2402_redcoral

### Email
#SBATCH --mail-user=[your@email.edu]
#SBATCH --mail-type=ALL

### Output
#SBATCH --output=/shared/home/epante/ipyrad-%j.out  ### replace epante by your account name

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

# first create a parameter file
# module load ipyrad/0.9.84
ipyrad -n params_[lib]_[initials]  # careful, no extention, '.txt', no special character!
```

Please modify this script and put is in your home folder. Then, execute it using `sbatch`.
Check the status of you job with `squeue`. Check the presence of the `params`file in your directory and read the log file (`ipyrad-[JOBID].out`). 



