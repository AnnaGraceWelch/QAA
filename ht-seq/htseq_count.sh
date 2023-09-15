#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=1                #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB
#SBATCH --time=1-00:00:00

conda activate bgmp-QAA

/usr/bin/time -v htseq-count --stranded=yes /projects/bgmp/agwel/bioinfo/Bi623/QAA/STAR/22_3H_both_S16_L008_Aligned.out.sam \
/projects/bgmp/agwel/bioinfo/Bi623/QAA/DB/Mus_musculus.GRCm39.110.gtf > stranded_22_3H_both_S16_L008.tsv

/usr/bin/time -v htseq-count --stranded=yes /projects/bgmp/agwel/bioinfo/Bi623/QAA/STAR/23_4A_control_S17_L008_Aligned.out.sam \
/projects/bgmp/agwel/bioinfo/Bi623/QAA/DB/Mus_musculus.GRCm39.110.gtf > stranded_23_4A_control_S17_L008.tsv

/usr/bin/time -v htseq-count --stranded=reverse /projects/bgmp/agwel/bioinfo/Bi623/QAA/STAR/22_3H_both_S16_L008_Aligned.out.sam \
/projects/bgmp/agwel/bioinfo/Bi623/QAA/DB/Mus_musculus.GRCm39.110.gtf > reverse_22_3H_both_S16_L008.tsv


/usr/bin/time -v htseq-count --stranded=reverse /projects/bgmp/agwel/bioinfo/Bi623/QAA/STAR/23_4A_control_S17_L008_Aligned.out.sam \
/projects/bgmp/agwel/bioinfo/Bi623/QAA/DB/Mus_musculus.GRCm39.110.gtf > reverse_23_4A_control_S17_L008.tsv
