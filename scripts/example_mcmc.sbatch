#!/bin/bash

#SBATCH --job-name=EMC_KIDS
#SBATCH --output=emc-%a.out
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=10
#SBATCH --partition=standard
#SBATCH --qos=user_qos_timeifler
#SBATCH --account=timeifler
#SBATCH --mem-per-cpu=5GB
#SBATCH --time=50:00:00
#SBATCH --export=none

echo Running on host `hostname`
echo Time is `date`
echo Directory is `pwd`
echo Slurm job NAME is $SLURM_JOB_NAME
echo Slurm job ID is $SLURM_JOBID

cd $SLURM_SUBMIT_DIR
source start_cocoa
##FLAG--again not sure if filepath is correct
export OMP_PROC_BIND=close
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
mpirun -n ${SLURM_NTASKS} --bind-to core --rank-by core --map-by numa:pe=${OMP_NUM_THREADS} cobaya-run ./projects/cocoa_kids/EXAMPLE_MCMC${SLURM_ARRAY_TASK_ID}.yaml -r
