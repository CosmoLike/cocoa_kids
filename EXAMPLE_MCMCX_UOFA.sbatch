#!/bin/bash

#SBATCH --job-name=KIDS
#SBATCH --output=KIDS-%A_%a.out
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=5
#SBATCH --partition=high_priority
#SBATCH --qos=user_qos_timeifler
#SBATCH --account=timeifler
#SBATCH --time=70:00:00

# Clear the environment from any previously loaded modules
module purge > /dev/null 2>&1
module load anaconda
conda init bash
source ~/.bashrc 

echo Running on host `hostname`
echo Time is `date`
echo Directory is `pwd`
echo Slurm job NAME is $SLURM_JOB_NAME
echo Slurm job ID is $SLURM_JOBID

cd $SLURM_SUBMIT_DIR
conda activate cocoa
source start_cocoa

export OMP_PROC_BIND=close
if [ -n "$SLURM_CPUS_PER_TASK" ]; then
  export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
else
  export OMP_NUM_THREADS=1
fi

mpirun -n ${SLURM_NTASKS} --mca btl tcp,self --oversubscribe --bind-to core --map-by node:pe=${OMP_NUM_THREADS} cobaya-run ./projects/kids/EXAMPLE_MCMC${SLURM_ARRAY_TASK_ID}.yaml -r

