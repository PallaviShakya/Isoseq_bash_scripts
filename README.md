Reference used: https://isoseq.how/clustering/cli-workflow.html


Summary of the steps used: These steps can be run directly in the ubuntu command line or in the HPC. I used both depending on memory requirements. The detailed bash codes I used can be found in my Github Repository 

# Step 1: Combining flnc to fofn 

  ```
  ls flnc-1.bam flnc-2.bam flnc-3.bam > flnc.fofn 
  ```
# Step 2: Running Clustering_slurm.sh in slrum 

**input:** flnc.fofn 

**output:**
polished_clustered_hapla.bam 
polished_clustered_hapla.hq.bam 
polished_clustered_hapla.hq.fasta.gz 
polished_clustered_hapla.lq.bam 
polished_clustered_hapla.lq.fasta.gz 
polished_clustered_hapla.cluster 

# Step 3: Align to the genome 

```
pbmm2 align --preset ISOSEQ --sort polished_clustered_hapla.hq.bam M_hapla_v1.fasta hapla.hq.aligned.bam 
```
**input:** polished_clustered_hapla.hq.bam  

**output:** hapla.hq.algined.bam 

# Step 4: Collapse isoforms 

```
isoseq3 collapse --do-not-collapse-extra-5exons --max-5p-diff 5 --max-3p-diff 5 polished_clustered_hapla.hq.bam hapla.bulk_collapsed.gff
```
