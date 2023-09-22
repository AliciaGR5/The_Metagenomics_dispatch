
# Author: Cristina Galisteo & Alicia Garcia Roldan

# Date: May 2023

# R v.4.1.2


## Your file must have done with cleaning_seqs.py and then countingAAS.py ##

### Don't forget to delete the first line in your file (...clean.fasta.aas.out) ###


## LIBRARY ##

library(fmsb) # Spider plot v.0.7.3


## DATASET ##

allAAS<- c(IC195="IC19_5_clean.fasta.aas.out", IC22="IC22_clean.fasta.aas.out", IC361="IC361_clean.fasta.aas.out", 
           IC362="IC362_clean.fasta.aas.out", IC391="IC391_clean.fasta.aas.out", IC392="IC392_clean.fasta.aas.out")


# Create dataframe with the first column

myAAS <- c("A", "C", "D", "E", "F", "G", "H", "I", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "Y")
df <- data.frame(myAAS)


projs=list()

for (sample in names(allAAS)){
  projs[[sample]] = read.csv(allAAS[[sample]], header=T, sep="\t", quote = "")
  
  df <- cbind(df, projs[[sample]][order(projs[[sample]]$aas),][,3]) # Join both df
}


colnames(df) <- c("aas", names(allAAS))
df_t <- t(df[-1])
colnames(df_t) <- myAAS

## First and second line must be maximum and minimum, respectively

df_maxmin <- data.frame(matrix(ncol = ncol(df_t), nrow = 2))
colnames(df_maxmin) <- myAAS
row.names(df_maxmin) <- c("max", "min") 
df_maxmin[1,] <- 12   # Select the same value so our plot are comparables
df_maxmin[2,] <- 0

## Join the maximum and minimum values df with the dataset df 
df_final <-rbind(df_maxmin, df_t)


## PLOTTING TIME!! ##

# SAME PLOT: One plot, all metagenomes...

colores <- c("#B40F20", "#E58601","#46ACC8", "#82C7DA","#E2D200","#EDE466")


png("AAcount_one4all.png", width = 30, height = 25, units = "cm", res = 300)


par(mar = c(1, 2, 2, 1)) # Margins

radarchart(df_final,
           axistype = 1, 
           cglcol = "grey", cglty = 3, cglwd = 0.8,
           axislabcol = "black",
           title = "Frecuencia de uso de aminoácidos",
           vlcex=0.8,
           caxislabels = c(0, NA, 6, NA, 12), # Show max, min and middle value 
           calcex = 0.8, # Max and min size
           pty = 32, # No point
           plwd = 3, # Line width
           plty = 1, 
           pcol= colores # Line colours
)  

legend(
  x = "topright", 
  legend = rownames(df_final[-c(1,2),]), horiz = F,
  xjust= -5,
  bty = "n", pch = 20,
  col = colores,
  text.col = "black", cex = 1, pt.cex = 1.5
)

dev.off()


# DIFFERENT PLOTS: Lots of plots, all metagenomes...

# Add 0 ant the beginning because the loop will count from the third element

colores2 <- c(0, 0, "#B40F20", "#E58601","#46ACC8", "#82C7DA","#E2D200","#EDE466") 


png("AAcount_all4one.png", width = 30, height = 25, units = "cm", res = 300)


par(mar = rep(2,4)) # Margins

par(mfrow = c(2,3)) # Plot distribution 

orden = c(3,4,5,6,7,8)

for (i in orden) {
  radarchart(
    df_final[c(1:2, i), ],   # Select first to lines (max, min) and the sample line
    axistype = 1,
    cglcol = "grey", cglty = 3, cglwd = 0.8,
    axislabcol = "black",
    pcol= colores2[i], 
    vlcex=0.8,
    caxislabels = c(0, NA, 6, NA, 12), 
    calcex = 0.8, # Max and min size
    pty = 32, # No point
    plty = 1, 
    plwd = 2,
    title = row.names(df_final)[i]
  )
}

dev.off()
