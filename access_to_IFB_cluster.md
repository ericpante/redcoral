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
