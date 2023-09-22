#!/usr/bin/env bash

#SBATCH -J <metagenome_name>_SQM
#SBATCH --ntasks=12
#SBATCH --mem=260gb
#SBATCH --time=48:00:00
#SBATCH --error=<metagenome_name>_SQM.%J.err
#SBATCH --output=<metagenome_name>_SQM.%J.out



# IMPORTANT: This is the script for working on PICASSO. You should carefully consider how to launch it based on the server you have access to.
#            If you want more information about SqueezeMeta, I recommend that you read up on it: https://github.com/jtamames/SqueezeMeta


module load squeezemeta/1.6.1post1

SqueezeMeta.pl -m sequential -s Samples_IC42_1.txt -f /mnt/home/users/bio_213_us/agroldan/IC42_1_res -extassembly ./IC42_1_scaffolds.fasta -binners maxbin,metabat2,concoct

sqm2tables.py IC42_1_SQM IC42_1_SQM/results/tables/
