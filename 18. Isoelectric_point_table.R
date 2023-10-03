
# Author: Alicia Garcia-Roldan

# Date: June 2023


# To calculate the isoelectric point we use the table obtained with SqueezeMeta (table 03.faa)
# and we use the script fasta2pi explained in the protocol. We will have a new table (03.faa.fasta2pi.txt)
# it only contains CDS. We will compare this table with the Squeezemeta table (table 13) this table contains
# CDS, tRNA, rRNA y tmRNA so we will have to do in BASH:

# grep "CDS" 13.IC19_5_SQM.orftable > file1.txt
# 
# grep "CDS" 13.IC19_5_SQM.orftable | cut -f1 > file2.txt
# 
# grep -f file2.txt 03.IC19_5_SQM.faa.fasta2pi.txt > file3.txt

# Let's compare file1.txt and file3.txt!!

library(stringr)

## DATASET ##

allgc_1 <- c(IC195 = "file1_IC195_CDS.txt", IC22="file1_IC22_CDS.txt", IC361="file1_IC361_CDS.txt",
             IC362="file1_IC362_CDS.txt", IC391="file1_IC391_CDS.txt", IC392="file1_IC392_CDS.txt")

allgc_3 <- c(IC195 = "file3_IC195.txt", IC22="file3_IC22.txt", IC361="file3_IC361.txt",
             IC362="file3_IC362.txt", IC391="file3_IC391.txt", IC392="file3_IC392.txt")


# Let's play with the data

projs=list()


for (sample in names(allgc_1)) {
  projs[[sample]] = read.csv(allgc_1[[sample]], header=F, sep="\t", quote = "")
  a <- str_split_fixed(projs[[sample]]$V9, ";", n = 2) # Separating information of Tax
  projs[[sample]] <- projs[[sample]][,c("V1", "V3")] # Extracting the name and tax column
  projs[[sample]] <- cbind(projs[[sample]], a) # Mixing the information and creating my own table
  projs[[sample]] <- cbind(projs[[sample]], c(rep(sample, nrow(projs[[sample]])))) # Add sample column
}

df1 <- data.frame(matrix(ncol = 5, nrow = 0)) # Creating our df

for (sample in names(projs)){
  df1 <- rbind(df1, projs[[sample]])
}


for (sample in names(allgc_3)) {
  projs[[sample]] = read.csv(allgc_3[[sample]], header=F, sep="\t", quote = "")
  projs[[sample]] <- projs[[sample]][,c("V1", "V2")] # Extracting the PI and the names (to see if they match with
                                                     # df1 names)
}

df3 <- data.frame(matrix(ncol = 2, nrow = 0)) #Creating another df

for (sample in names(projs)){
  df3 <- rbind(df3, projs[[sample]])
}


df2 <- cbind(df1, df3)
colnames(df2) <- c("Seq","Type", "Domain", "Tax", "Sample", "Seq2", "PI") # Making our perfect df binding
                                                                          # df1 and df2

# If we want to have only Arch and Bact information...

Arch <- df2[df2$Domain == "k_Archaea",]
Bact <- df2[df2$Domain == "k_Bacteria",]
Arch_Bact <- rbind(Arch, Bact)


## SAVE ##

write.table(df2, file = "Isoelectric_point_total.txt",sep = "\t")
write.table(Arch_Bact, file = "Isoelectric_point_ArchBact.txt",sep = "\t")
