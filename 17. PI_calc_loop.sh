#!/bin/bash

## Author: Alicia Garcia-Roldan
## Date: September 2023


for f in $(cat files.txt)
do
	echo -e "Record their faces... (Grabales las caras...)"
	bash PI_calc.sh $f
done
