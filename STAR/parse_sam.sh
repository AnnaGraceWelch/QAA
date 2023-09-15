#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=interactive               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=1                #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB
#SBATCH --reservation=bgmp-res

conda activate bgmp-QAA

/usr/bin/time -v /projects/bgmp/agwel/bioinfo/Bi623/QAA/STAR/parse_sam.py -f /projects/bgmp/agwel/bioinfo/Bi623/QAA/STAR/22_3H_both_S16_L008_Aligned.out.sam

/usr/bin/time -v /projects/bgmp/agwel/bioinfo/Bi623/QAA/STAR/parse_sam.py -f /projects/bgmp/agwel/bioinfo/Bi623/QAA/STAR/23_4A_control_S17_L008_Aligned.out.sam

