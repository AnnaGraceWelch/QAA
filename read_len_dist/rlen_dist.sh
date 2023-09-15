#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=1                #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB
#SBATCH --time=1-00:00:00

conda activate bgmp-QAA

/usr/bin/time -v /projects/bgmp/agwel/bioinfo/Bi623/QAA/read_len_dist/rlen_dist.py \
-r1 /projects/bgmp/agwel/bioinfo/Bi623/QAA/trimmomatic/22_3H_R1.trimmed.fastq.gz \
-r2 /projects/bgmp/agwel/bioinfo/Bi623/QAA/trimmomatic/22_3H_R2.trimmed.fastq.gz \
-o1 /projects/bgmp/agwel/bioinfo/Bi623/QAA/read_len_dist/22_3H_R1.len.dist.tsv \
-o2 /projects/bgmp/agwel/bioinfo/Bi623/QAA/read_len_dist/22_3H_R2.len.dist.tsv \
-o3 /projects/bgmp/agwel/bioinfo/Bi623/QAA/read_len_dist/22_3H.readlength.dist

# /usr/bin/time -v /projects/bgmp/agwel/bioinfo/Bi623/QAA/read_len_dist/rlen_dist.py \
# -r1 /projects/bgmp/agwel/bioinfo/Bi623/QAA/trimmomatic/23_4A_R1.trimmed.fastq.gz \
# -r2 /projects/bgmp/agwel/bioinfo/Bi623/QAA/trimmomatic/23_4A_R2.trimmed.fastq.gz \
# -o1 /projects/bgmp/agwel/bioinfo/Bi623/QAA/read_len_dist/23_4A_R1.len.dist.tsv \
# -o2 /projects/bgmp/agwel/bioinfo/Bi623/QAA/read_len_dist/23_4A_R2.len.dist.tsv \
# -o3 /projects/bgmp/agwel/bioinfo/Bi623/QAA/read_len_dist/23_4A.readlength.dist







