#!/bin/bash
### Lines "#SBATCH" configure the job resources
### (even though they look like bash comments)

### Job queue to use (options: batch)
#SBATCH --partition=batch

### Amount of nodes to use
#SBATCH --nodes=1

### Processes per node
#SBATCH --ntasks-per-node=1

### Available cores per node (1-12)
#SBATCH --cpus-per-task=12

### execution time. Format: days-hours:minutes:seconds -- Max: three days
#SBATCH --time 3-00:00:00

## ## Load environment modules
## module load compilers/gcc/4.9

### Enqueue job
CWD=$PWD
cd `dirname $1`
mkdir -p logs
srun -o logs/%j.out -e logs/%j.err /usr/bin/env ruby `basename $1`
cd $CWD

exit 0
