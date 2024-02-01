### Access to SLURM (to submit jobs) :

```
ssh student1@core.cluster.france-bioinformatique.fr
```

### Access to the shared directory where data are stored :

```
cd /shared/projects/2302_redcoral
```

### Submit a job (when connected) with access to the resources dedicated to the training session :

```
sbatch my-job.sh -A 2302_redcoral
```
### Configuration of FileZilla (see screenshot below as well)

protocol : `SFTP-SSH`
host : `core.cluster.france-bioinformatique.fr`
authentification : ask password
user : `student1`

![image](https://github.com/ericpante/redcoral/assets/7203505/676f608e-3574-41ef-8d05-2aa9660843df)


### Distant site on FileZilla :

Home / scripts and job submission : `/shared/home/student1`
(may appear as `/shared/ifbstor1/home/student1`)

Data storage : /shared/projects/2302_redcoral`


