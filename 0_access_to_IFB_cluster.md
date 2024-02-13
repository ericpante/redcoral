### Access to a remote computer :
 - if you are on linux, you can use the `ssh`command below using the `Konsole` app.
 - if you are on MacOS, you can use the `ssh`command below using the `Terminal` app.
 - if you are on Windows, you will need to download and install an app to communicate to a remote computer via the `ssh`protocol (this is called a ssh client). here are three options : https://mobaxterm.mobatek.net/download-home-edition.html , https://putty.org and https://ubuntu.com/desktop/wsl 

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


