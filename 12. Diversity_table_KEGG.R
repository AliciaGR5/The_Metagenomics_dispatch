
# Author: Alicia Garcia-Roldan

# Date: May 2023

# R v.4.1.2


# Preparing data obtained with SqueezeMeta (table 12 - KEGG) for Shannon test (alpha diversity)

### Remember to delete the first line (Rmv_bucle.sh) and the # of the table 12 ###


## DATASET ##

files <- unlist(list.files(pattern = "paqui"))   # Files must be .paqui (easy, just delete .txt and write.paqui)
                                                 # or just change in the script the file extension you use and
                                                 # it will work correctly :)


mylist <- list()

for (newfile in files) {
  
  # Read table: 
  f <- read.table(newfile, header = T, sep = "\t")
  
  # Extract KEGG ID: 
  KEGG <- rep(NA, nrow(f)) # Vector where the KEGG ID will be save. 
  lp <- grep ("K", f$kegg.ID)  # Positions for KEGG ID
  t <- unlist(as.character(f$kegg.ID))  # All
  tp <- grep ("K", t)  # Positions for "all" that includes "K".
  
  # They will correspond with the rows with the position "p". 
  KEGG[lp] <- t[tp] # Replace NA with KEGG ID
  f <- cbind(f, KEGG) # Add as a new column
  
  # Get the diversity: 
  mym <- t(table(f$KEGG))  #  Columns are the KEGG ID ...
  rownames(mym) <- newfile     # ... and row is the sample. 
  mylist[[newfile]] <- mym # Save the matrix.
  
}

for (i in 1:length(mylist)){                 # Adding another sample columns
  mylist[[i]] <- as.data.frame(t(mylist[[i]]))
  rownames(mylist[[i]]) <- mylist[[i]][,1]
  colnames(mylist[[i]]) <- c("KEGG", "Sample", names(mylist)[i])
}

mymerged <- merge(mylist[[1]], mylist[[2]], by=0, all=T)
rownames(mymerged) <- mymerged$Row.names
mymerged <- mymerged[, -c(1,2,3,5,6)] 

for (i in 3:length(mylist)){                  # Adding the other samples columns
  mymerged <- merge(mymerged, mylist[[i]], by=0, all=T)
  rownames(mymerged) <- mymerged$Row.names
  mymerged <- mymerged[, -c(1, (i+1), (i+2))] 
}

mymerged[is.na(mymerged)] <- 0

mymergedt <- as.data.frame(t(mymerged)) # Transpose the df
rownames(mymergedt) <- c("IC195", "IC22", "IC361", "IC362", "IC391", "IC392") # Rename


## SAVE ##

write.table(mymergedt, file = "Diversity_table_KEGG.txt",sep = "\t")  # Saving our data
