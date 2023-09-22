#!/bin/bash

## Author: Alicia Garcia-Roldan
## Date: April 2023


for f in $(cat names.txt)
do
	echo -e "COME ON..."
	bash Rmv_line.sh $f
done
