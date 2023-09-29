#!/bin/bash

## Author: Alicia Garci­a-Roldan
## Date:January 2023


########################
### DATA PREPARATION ###
########################

# Before starting, you must prepare all the files in their respective folders, which should be all in fastq format (you will have to use 'cat' when necessary to merge files)

DIRECTORY=$1   # Metagenome folder name

#conda activate metawrap --> It is better to activate it manually
 

########################
### DECOMPRESS FILES ###
########################

echo -e  "\n It's Concha, I'm coming in (Soy Concha, entro) \n"

echo -e "cd ${DIRECTORY}"

cd ${DIRECTORY}

pwd

gunzip *.gz

echo -e "\n It's kickoff time! (Arrranca el partidooo) \n"


########################
### QUALITY ANALYSIS ###
########################

echo -e "\n Let's begin the quality analysis \n"

metawrap read_qc -1 *_1.fastq  -2 *_2.fastq -t 24 -o READ_QC    # IMPORTANT: Check that it ends in 'fastq' and not in 'fq'

rm *.fastq   # We delete the raw fastq files
mv /home/alicia/Metagenomas/${DIRECTORY}/READ_QC/final_pure_reads_*.fastq /home/alicia/Metagenomas/${DIRECTORY}   # We move the relevant files out of the created folder
mv /home/alicia/Metagenomas/${DIRECTORY}/READ_QC/post-QC_report /home/alicia/Metagenomas/${DIRECTORY}
mv /home/alicia/Metagenomas/${DIRECTORY}/READ_QC/pre-QC_report /home/alicia/Metagenomas/${DIRECTORY}

rm -r READ_QC   # Delete the folder

echo -e "\n Analysis finished! (SACABO) \n"

cd ..   # Go back

tar czvf ${DIRECTORY}.tar.gz ${DIRECTORY}
rm -r ${DIRECTORY}
