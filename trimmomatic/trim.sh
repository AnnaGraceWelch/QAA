#!/usr/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=compute               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8            #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4G

conda activate bgmp-QAA



/usr/bin/time -v trimmomatic PE /projects/bgmp/agwel/bioinfo/Bi623/QAA/cutadapt_out/cut_22_3H_both_S16_L008_R1_001.fastq.gz \
    /projects/bgmp/agwel/bioinfo/Bi623/QAA/cutadapt_out/cut_22_3H_both_S16_L008_R2_001.fastq.gz \
              22_3H_R1.trimmed.fastq.gz 22_3H_R1un.trimmed.fastq.gz \
              22_3H_R2.trimmed.fastq.gz 22_3H_R2un.trimmed.fastq.gz \
              LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

/usr/bin/time -v trimmomatic PE /projects/bgmp/agwel/bioinfo/Bi623/QAA/cutadapt_out/cut_23_4A_control_S17_L008_R1_001.fastq.gz \
    /projects/bgmp/agwel/bioinfo/Bi623/QAA/cutadapt_out/cut_23_4A_control_S17_L008_R2_001.fastq.gz \
              23_4A_R1.trimmed.fastq.gz 23_4A_R1un.trimmed.fastq.gz \
              23_4A_R2.trimmed.fastq.gz 23_4A_R2un.trimmed.fastq.gz \
              LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35