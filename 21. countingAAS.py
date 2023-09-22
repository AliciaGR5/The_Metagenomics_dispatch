#!/usr/bin/python3
# -*- coding: utf-8 -*-

"""
@author: Alicia Garcia-Roldan & Cristina Galisteo
Created: May 2021
"""

import argparse
from Bio import SeqIO

## ARGUMENTS:
parser = argparse.ArgumentParser(
    description="Calculate the percentage of each amino acid in the INPUT sequence(s). You might want to filter your secuence by length before using this script. If so, cleaning_seq.py script is what you are looking for.") 

parser.add_argument( # Introduce el fichero fasta
                    '-in',
                    action="store",
                    dest="infile",
                    help="Input. Amino acids file (.faa)")
results = parser.parse_args() 


##SCRIPT: 
Conteo = {} # Diccionario 
total_AAS = 0 # Count total aas

for seq_record in SeqIO.parse(results.infile, "fasta"):
    for i in seq_record.seq:
        if i == "X" or i == "*":
            break
        else: 
                if i in Conteo:
                    Conteo[i] += 1 # Each time the letter is repeated, it must be added
                else: 
                    Conteo[i] = 1 # If it not repeated, nothing changes
    if "X" != seq_record.seq:  # If the sequence is not translated, does not count 'X' as AAS. 
        total_AAS = total_AAS + len(seq_record.seq)



# We print the result of counting the frequency in a dictionary:
print("\n The number of times the amino acids appear is:\n", Conteo)
# We calculate which amino acid appears the most and the least:
aa_mas_repetido = max(zip(Conteo.values(), Conteo.keys())) 
aa_menos_repetido = min(zip(Conteo.values(), Conteo.keys()))
# We print the result, indicating it in a way that makes it easier to read:
print("\n The amino acid that appears most frequently is (number of times, aa):", aa_mas_repetido) 
print("\n The amino acid that appears least frequently is (number of times, aa):", aa_menos_repetido,"\n")
# Line breaks have been added to make the information clearer when reading it.
print("Total number of amino acids: ", total_AAS, "\t")




archivo = open("{}.aas.out".format(results.infile), "w")
archivo.write(str(results.infile) + ":" + "\n")
archivo.write("aas" + "\t" + "Total" + "\t" + "Percentage" + "\n")
for key in Conteo: 
    archivo.write(str(key) + "\t" + str(Conteo[key]) +"\t" + str(Conteo[key]*100/total_AAS) + "\n")

archivo.close()
