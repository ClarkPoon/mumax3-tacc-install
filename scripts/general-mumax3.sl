#!/bin/bash
#SBATCH -J mumax3-general        # Job Name
#SBATCH -o mumax.o%j  # output and error file name (%j expands to jobID) Name of the output file (eg. myMPI.oJobID)
#SBATCH -n 4         # number of tasks per node
#SBATCH -N 1         # total number of mpi tasks requested
#SBATCH -p gpu              # Queue name
#SBATCH -t 24:00:00       # Run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=vivian.rogers@utexas.edu    # Email notification address MAKE THIS YOURS, PLEASE
#SBATCH --mail-type=ALL                  # Email at Begin/End of job  (UNCOMMENT)
#SBATCH -A Spintronic-Computing

module load gcc
module load cuda/9.0


cp -r

FOLDERPATH=$SCRATCH/mumax3/$FOLDERNAME 

mkdir $FOLDERPATH
cp -r * $FOLDERPATH
cd $FOLDERPATH

ibrun mumax3 $FILENAME

cd ../
cp -r $FOLDERNAME $mumaxOutputPath