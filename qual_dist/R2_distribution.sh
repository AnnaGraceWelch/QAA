#!/usr/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8            #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4G
#SBATCH --time=1-00:00:00

conda activate base

/usr/bin/time -v /projects/bgmp/agwel/bioinfo/Bi622/Demultiplex/Assignment-the-first/part1/part1.py \
-f /projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R2_001.fastq.gz \
-o 23_4A_control_S17_L008_R2_001.distribution -l 101 -m 23_4A_control_S17_L008_R2

/usr/bin/time -v /projects/bgmp/agwel/bioinfo/Bi622/Demultiplex/Assignment-the-first/part1/part1.py \
-f /projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R2_001.fastq.gz 
-o 22_3H_both_S16_L008_R2_001.distribution -l 101 -m 22_3H_both_S16_L008_R2