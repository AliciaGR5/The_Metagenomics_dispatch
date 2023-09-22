#!/bin/bash

## Author: Alicia Garcia-Roldan
## Date: September 2023



FILE=$1

echo -e  "\n The faces, John, the faces... (Las caras, Juan, las caras...) \n"


cat ${FILE} | fasta2pi > ${FILE}_fasta2pi.txt


echo -e "\n Your job is finished! (TRACATRA) \n"