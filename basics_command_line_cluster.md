# introduction to the terminal and the shell 

## useful readings

This handbook is very useful:

https://practicalcomputing.org/



## getting started and basic commands

if you need to install software on ubuntu, check out `apt-get` https://doc.ubuntu-fr.org/apt-get. 
to ease your work, consider installing `homebrew` (https://docs.brew.sh/Homebrew-on-Linux) and `fish` (https://fishshell.com). 

***Note that you do not the authorisation to install softwares on the IFB cluster.
***

work in class - getting acquainted with the following commands:
- getting the docs: `man` (enter `q`to quit the manual)
- nagivating across folders: `pwd`, `ls`, `cd`, `tree`, `du -h`
- creating a file: `touch`, redirecting standard output with `>`, creating folder `mkdir`
- copying `cp`, moving `mv`, removing `rmdir`, `rm`
- printing the content of a file: `cat` for zipped files : `zcat`
- understanding and changing file permissions (`chmod`)
- working with archives: `tar` and tarballs
- compressing `gzip` and decompressing `gunzip`
- file download: `wget`
- wildcards (characters with special meanings) and globbing: `?`, `*`, `!`, `[...]`...
- piping: `|`
- scripting: `.sh`
- variables: `$PATH`, `$HOME`, `$1`, `$@`...

## practical work on the IFB cluster

**You first have to connect to the cluster via ssh.**


When you log on the IFB cluster, you should be on your home directory. This is used to store your Unix profile. Data are stored in the /shared folder. See documentation here: https://ifb-elixirfr.gitlab.io/cluster/doc/logging-in/ 

### navigation with command line

Use the following commands to Print the address of your Working Directory (pwd), LiSt the files or directories (ls), Change Directory (cd), go to upper directory (cd ..) or Make a new DIRectory in your data directory (adapt the command to your login). Type one command at a time.

*	Check the results with FileZilla!
*	Note that command lines can go with options (e.g. ls -l)

```
pwd
ls
ls -l
ls -d */
cd /shared/projects/2402_redcoral/appr-2402-30
ls
mkdir output_RAD
ls
cd ..
ls
```

### useful shortcuts!

up arrow: in most shells, the up arrow will move back to your previous commands: no need to type everything again!

tab: while typing, the tab key allows auto-completion. If a file or directory matches with the beginning of what you typed, it will be completed with the tab.


### text files

Get the file you will work on. This is a fasta file (alignement of sequences) which can be manipulated with text tools. The "cp" command allows to CoPy a file.

```
cd /shared/projects/2402_redcoral/appr-2402-30
cp /shared/projects/2402_redcoral/Corallium_CR_Genbank.fas ./
ls

```

Check the beginning of the file (with N lines)

```
head Corallium_CR_Genbank.fas -n 20

```

You can send this to a new texit file 

```
head Corallium_CR_Genbank.fas -n 20 > head_Corallium.txt

```

You can directly interact with the text file with the command nano

```
nano Corallium_CR_Genbank.fas

```
Try to modify sequence names in the fasta file.

There are other useful tools to work with text files such as:

grep
https://man7.org/linux/man-pages/man1/grep.1.html

sed
https://man7.org/linux/man-pages/man1/sed.1.html

### submit a job

To do some analyses you will usually submit a job.  
See the documentation: 

https://ifb-elixirfr.gitlab.io/cluster/doc/slurm/slurm_user_guide/ 

First you need to prepare a script, usually on your computer with a text editor (such as Geany). In this script you will specify the commands to execute, the maximum duration, the required memory... Then you copy this script to your directory on the cluster, you make it executable and you launch it (see below). The  Slurm manager takes into account the different requests to share computing resources among users. Do not ask too much if you don't need it.

See examples of file in the github. Prepare a script on your computer, copy it in your IFB directory with FileZilla. Then make it executable and submit it as below. Note the -A 2402_redcoral option which will be useful to request more resources!

```
# go to your working directory
cd /shared/projects/2402_redcoral/appr-2402-30

# make the script executable (to do only once)
chmod u+x simple_script_cluster_IFB.sh

# launch the script
sbatch simple_script_cluster_IFB.sh

# check if it's still running
squeue -u appr-2402-30

``` 

Examples of other possibilities in bash scripts
https://www.freecodecamp.org/news/bash-scripting-tutorial-linux-shell-script-and-command-line-for-beginners/ 

In the IFB clusters you will use some modules / softwares for your analyses. 

List the available softwares:

```
module avail
```

*Load a software (you can try it now, but it will be included in your script):
*
```
module load fastqc/0.11.7
```

Unload a software

```
module unload fastqc/0.11.7
```


Unload all softwares at the end of your script

```
module purge
```



**You will need these tools to prepare your scripts for the use of ipyrad or vcftools on the cluster for example. Start from the scripts prepared for the workshop and adapt them to your analyses: what softwares, working directory, memory,duration...**



## getting `fastq`data

have a look at the NIH Small Read Archive: https://www.ncbi.nlm.nih.gov/sra/?term=SRR1754715 
SRR1754715 is a `fastq` file from SRA (RADseq Pedicularis sect. Cyathophora). you can get the data manually through the SRA interface but we are going to do it through the terminal. 

We will use the SRA tool kit. Here is the HowTos: https://github.com/ncbi/sra-tools/wiki/HowTo:-fasterq-dump and https://github.com/ncbi/sra-tools/wiki/08.-prefetch-and-fasterq-dump

1. Get the toolkit: 
```
wget --output-document sratoolkit.tar.gz https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
```
2. Extract the tookit from tarball
```
tar -vxzf sratoolkit.tar.gz
```
3. Add the toolkit to the `$PATH` (for this session only)
```
export PATH=$PATH:$PWD/sratoolkit.3.0.0-xxx/bin # xxx: replace by your version.
```
4. Test it. 
```
which fastq-dump
```

Now we can use the kit to get multiple SRR data files. 
```
prefetch ACCESSION ## or --option-file SRR_Acc_List.txt for a list
fastq-dump ACCESSION ACCESSION ACCESSION ACCESSION ...
```





