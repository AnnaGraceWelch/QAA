#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=1                #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB
#SBATCH --time=1-00:00:00

conda activate bgmp-QAA

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 --outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 --readFilesCommand zcat \
--readFilesIn /projects/bgmp/agwel/bioinfo/Bi623/QAA/trimmomatic/22_3H_R1.trimmed.fastq.gz /projects/bgmp/agwel/bioinfo/Bi623/QAA/trimmomatic/22_3H_R2.trimmed.fastq.gz \
--genomeDir /projects/bgmp/agwel/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.dna.ens110.STAR_2.7.10b \
--outFileNamePrefix 22_3H_both_S16_L008_

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 --outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 --readFilesCommand zcat \
--readFilesIn /projects/bgmp/agwel/bioinfo/Bi623/QAA/trimmomatic/23_4A_R1.trimmed.fastq.gz /projects/bgmp/agwel/bioinfo/Bi623/QAA/trimmomatic/23_4A_R2.trimmed.fastq.gz \
--genomeDir /projects/bgmp/agwel/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.dna.ens110.STAR_2.7.10b \
--outFileNamePrefix 23_4A_control_S17_L008
