#!/bin/bash

#SBATCH --job-name=EPT_KIDS
#SBATCH --output=epost-%a.out
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --partition=standard
#SBATCH --qos=user_qos_timeifler
#SBATCH --account=timeifler
#SBATCH --mem-per-cpu=5GB
#SBATCH --time=40:00:00
#SBATCH --export=none

echo Running on host `hostname`
echo Time is `date`
echo Directory is `pwd`
echo Slurm job NAME is $SLURM_JOB_NAME
echo Slurm job ID is $SLURM_JOBID

cd $SLURM_SUBMIT_DIR
source start_cocoa

export OMP_PROC_BIND=close
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
mpirun -n 1 cobaya-run ./projects/kids/EXAMPLE_POST${SLURM_ARRAY_TASK_ID}.yaml -r
