#!/bin/bash

#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=interactive               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=1                #optional: number of cpus, default is 1
#SBATCH --mem=32GB                        #optional: amount of memory, default is 4GB
#SBATCH --reservation=bgmp-res
conda activate bgmp-QAA

/usr/bin/time -v STAR --runThreadN 8 \
 --runMode genomeGenerate \
  --genomeDir /projects/bgmp/agwel/bioinfo/Bi623/QAA/Mus_musculus.GRCm39.dna.ens110.STAR_2.7.10b \
 --genomeFastaFiles /projects/bgmp/agwel/bioinfo/Bi623/QAA/DB/Mus_musculus.GRCm39.dna.primary_assembly.fa \
  --sjdbGTFfile /projects/bgmp/agwel/bioinfo/Bi623/QAA/DB/Mus_musculus.GRCm39.110.gtf

