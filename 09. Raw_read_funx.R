
# Author: Alicia Garcia-Roldan

# Date: June 2023

# R v.4.1.2


# Function for counting the reads that form the contigs of our sample (table 19 - contigs)

### Remember to delete the first line (05.Rmv_loop.sh)


## FUNCTION ##

Raw_reads <- function(x) {
  
  
  ## LIBRARY ## 
  
  library(stringr)  # v.1.5.0
  library(tidyverse)  # v.1.3.2
  
  
  ## DATASET ##
  
  zz = read.csv(x, header=T, sep="\t", quote = "")
  
  family_v <- rep(NA, nrow(zz)) # Vector where the selected rank will be save.
  
  l <- (strsplit(as.character(zz$Tax), ";"))
  lp <- grep ("f_", l)  # Positions for family annotation
  t <- unlist(strsplit(as.character(zz$Tax), ";"))  # Todo
  tp <- grep ("f_", t)  # Positions for "all" that includes "family".
  family_v[lp] <- t[tp] # Replace NA with taxo
  zz <- cbind(zz, family_v) # Add as a new column
  
  zz <- zz[,c(1,12,10)]
  
  colnames(zz)[3] <- "Count"
  
  zz_good <- group_by(zz, family_v)
  zz_good <- as.data.frame(summarise(zz_good, sum = sum(Count)))
  
  zz_goodt <- as.data.frame(t(zz_good))
  
  colnames(zz_goodt) <- zz_goodt[1,]
  zz_goodt <- zz_goodt[-1, ]
   
  ## SAVE ##
  
  write.table(zz_goodt, file = "Diversity_table_family_raw.txt",sep = "\t", quote = F, row.name = F)
  
}
