#!/usr/bin/env bash

#SBATCH -J <metagenome_name>_ASSEMBLY
#SBATCH --ntasks=12
#SBATCH --mem=260gb
#SBATCH --time=36:00:00
#SBATCH --error=<metagenome_name>_assembly.%J.err
#SBATCH --output=<metagenome_name>_assembly.%J.out


/mnt/home/soft/spades/programs/x86_64/SPAdes-3.15.4-Linux/bin/spades.py --meta --pe1-1 <final_pure_reads_1_pathway> --pe1-2 <final_pure_reads_2_pathway> -k 21,33,55,77,99,127 -t 12 -o ASSEMBLY_<metagenome_name>


# EXAMPLE:

#/mnt/home/soft/spades/programs/x86_64/SPAdes-3.15.4-Linux/bin/spades.py --meta --pe1-1 /mnt/home/users/bio_213_us/agroldan/22IC32/final_pure_reads_1.fastq.gz --pe1-2 /mnt/home/users/bio_213_us/agroldan/22IC32/final_pure_reads_2.fastq.gz -k 21,33,55,77,99,127 -t 12 -o ASSEMBLY_22IC32