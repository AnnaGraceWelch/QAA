#!/usr/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=8            #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4G
#SBATCH --time=1-00:00:00 

conda activate bgmp-QAA

R1_adapter='AGATCGGAAGAGCACACGTCTGAACTCCAGTCA'
R2_adapter='AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT'

input_dir1_R1='/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R1_001.fastq.gz'
input_dir1_R2='/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R2_001.fastq.gz'
input_dir2_R1='/projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R1_001.fastq.gz'
input_dir2_R2='/projects/bgmp/shared/2017_sequencing/demultiplexed/23_4A_control_S17_L008_R2_001.fastq.gz'

output_dir1_R1='/projects/bgmp/agwel/bioinfo/Bi623/QAA/cutadapt_out/cut_22_3H_both_S16_L008_R1_001.fastq.gz'
output_dir1_R2='/projects/bgmp/agwel/bioinfo/Bi623/QAA/cutadapt_out/cut_22_3H_both_S16_L008_R2_001.fastq.gz'
output_dir2_R1='/projects/bgmp/agwel/bioinfo/Bi623/QAA/cutadapt_out/cut_23_4A_control_S17_L008_R1_001.fastq.gz'
output_dir2_R2='/projects/bgmp/agwel/bioinfo/Bi623/QAA/cutadapt_out/cut_23_4A_control_S17_L008_R2_001.fastq.gz'

/usr/bin/time -v cutadapt -a $R1_adapter -A $R2_adapter -o $output_dir1_R1 -p $output_dir1_R2 $input_dir1_R1 $input_dir1_R2

/usr/bin/time -v cutadapt -a $R1_adapter -A $R2_adapter -o $output_dir2_R1 -p $output_dir2_R2 $input_dir2_R1 $input_dir2_R2


