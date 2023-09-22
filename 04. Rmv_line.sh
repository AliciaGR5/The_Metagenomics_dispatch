#!/bin/bash

## Author: Alicia Garcia-Roldan
## Date: April 2023


FILE=$1

awk 'NR>1' ${FILE} > ${FILE}.paqui
