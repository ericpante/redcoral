# introduction to the terminal and the shell 

## getting started and basic commands

if you need to install software on ubuntu, check out `apt-get` https://doc.ubuntu-fr.org/apt-get. 
to ease your work, consider installing `homebrew` (https://docs.brew.sh/Homebrew-on-Linux) and `fish` (https://fishshell.com). 

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
