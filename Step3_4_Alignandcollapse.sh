#!/bin/bash
#
#SBATCH --job-name=alignall
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
pbmm2 align --preset ISOSEQ --sort polished_clustered_hapla.bam M_hapla_assembly_v1.fasta hapla.all.aligned.bam
isoseq3 collapse --do-not-collapse-extra-5exons --max-5p-diff 5 --max-3p-diff 5 polished_clustered_hapla.hq.bam hapla.bulk_collapsed.gff


# Print out values of the current jobs SLURM environment variables

env | grep SLURM

