#!/bin/bash
#
#SBATCH --job-name=clusterall
#SBATCH --ntasks=65 # Number of cores/threads
#SBATCH --mem=65gb
#SBATCH --partition=bigmemht 
#SBATCH --time=17:00:00


##########################################################################################
# Author: Pallavi Shakya
# Email: pshakya@ucdavis.edu 
##########################################################################################

####################


# go to the directory
cd /~directory


#Make things fail on errors
set -o nounset
set -o errexit
set -x


# run commands
isoseq3 cluster FLNC.fofn polished_clustered_hapla.bam -j 10 --verbose --use-qvs


# Print out values of the current jobs SLURM environment variables

env | grep SLURM

