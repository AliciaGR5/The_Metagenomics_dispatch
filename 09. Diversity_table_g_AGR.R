
# Author: Alicia Garcia-Roldan

# Date: May 2023

# R v.4.1.2


# Preparing data obtained with SqueezeMeta (table 19 - contigs) for Shannon test (alpha diversity)

### Remember to delete the first line (Rmv_bucle.sh)


## DATASET ##

# Reading the files of interest
files <- unlist(list.files(pattern = "paqui"))      # Files must be .paqui (easy, just delete .txt and write.paqui)
                                                    # or just change in the script the file extension you use and
                                                    # it will work correctly :)

# Get info into a list: 
mylist <- list()
for (newfile in files) {
  
  # Read table: 
  f <- read.table(newfile, header = T, sep = "\t")
  
  # Extract taxonomic rank: 
  genus_v <- rep(NA, nrow(f)) # Vector where the selected rank will be save. 
  l <- (strsplit(as.character(f$Tax), ";")) 
  lp <- grep ("g_", l)  # Positions for genus annotation
  t <- unlist(strsplit(as.character(f$Tax), ";"))  # All
  tp <- grep ("g_", t) # Positions for "all" that includes "genus".
                       # They will correspond with the rows with the position "p". 
  genus_v[lp] <- t[tp] # Replace NA with taxo
  f <- cbind(f, genus_v) # Add as a new column
  
  # Get the diversity: 
  mym <- t(table(f$genus_v))  #  Columns are the taxo names ...
  rownames(mym) <- newfile    # ... and row is the sample. 
  mylist[[newfile]] <- mym    # Save the matrix.
  
}

for (i in 1:length(mylist)){
  mylist[[i]] <- as.data.frame(t(mylist[[i]]))
  rownames(mylist[[i]]) <- mylist[[i]][,1]
  colnames(mylist[[i]]) <- c("tax", "del", names(mylist)[i])
}

mymerged <- merge(mylist[[1]], mylist[[2]], by=0, all=T)
rownames(mymerged) <- mymerged$Row.names
head(mymerged)
mymerged <- mymerged[, -c(1,2,3,5,6)]

for (i in 3:length(mylist)){    # Adding other samples columns
  mymerged <- merge(mymerged, mylist[[i]], by=0, all=T)
  rownames(mymerged) <- mymerged$Row.names
  mymerged <- mymerged[, -c(1, (i+1), (i+2))]
}

mymerged[is.na(mymerged)] <- 0
head(mymerged)

# Finally we have matrix with the diversity of each sample. 
# Samples should be in the rows. 

mymergedt <- as.data.frame(t(mymerged))
head(mymergedt)
dim(mymergedt)
rownames(mymergedt) <- c("IC195", "IC22", "IC361", "IC362", "IC391", "IC392")


## SAVE ##

write.table(mymergedt, file = "Diversity_table_genus.txt",sep = "\t")
