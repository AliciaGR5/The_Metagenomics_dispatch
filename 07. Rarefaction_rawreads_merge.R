
# Author: Alicia Garcia-Roldan

# Date: June 2023

# R v.4.1.2


# This script merges the files obtained with 06. Raw_read_funx.R and creates a beautiful plot


## LIBRARY ##

library(vegan) # v.2.6.4 


## DATASET ##

alldiv <- c(IC195 ="IC195_Diversity_table_family_raw.txt", IC22="IC22_Diversity_table_family_raw.txt",
            IC361="IC361_Diversity_table_family_raw.txt", IC362="IC362_Diversity_table_family_raw.txt",
            IC391="IC391_Diversity_table_family_raw.txt", IC392="IC392_Diversity_table_family_raw.txt")



rr <- read.csv("IC195_Diversity_table_family_raw.txt", header=T, sep="\t", quote = "")

yy <- read.csv("IC22_Diversity_table_family_raw.txt", header=T, sep="\t", quote = "")

tt <- read.csv("IC361_Diversity_table_family_raw.txt", header=T, sep="\t", quote = "")

tt2 <- read.csv("IC362_Diversity_table_family_raw.txt", header=T, sep="\t", quote = "")

pp <- read.csv("IC391_Diversity_table_family_raw.txt", header=T, sep="\t", quote = "")

pp2 <- read.csv("IC392_Diversity_table_family_raw.txt", header=T, sep="\t", quote = "")


RR <- t(rr)
YY <- t(yy)
TT <- t(tt)
TT2 <- t(tt2)
PP <- t(pp)
PP2 <- t(pp2)


merged_RR_YY <- merge(RR, YY, all=T, by=0)

rownames(merged_RR_YY) <- merged_RR_YY[,1]
merged_RR_YY[,1] <- NULL

merged_TT_TT2 <- merge(TT, TT2, all=T, by=0)

rownames(merged_TT_TT2) <- merged_TT_TT2[,1]
merged_TT_TT2[,1] <- NULL

merged_PP_PP2 <- merge(PP, PP2, all=T, by=0)

rownames(merged_PP_PP2) <- merged_PP_PP2[,1]
merged_PP_PP2[,1] <- NULL


merged_RR_YY_FINAL <- merge(merged_RR_YY, merged_TT_TT2, all=T, by=0)
rownames(merged_RR_YY_FINAL) <- merged_RR_YY_FINAL[,1]
merged_RR_YY_FINAL[,1] <- NULL


merged_definitiva <- merge(merged_RR_YY_FINAL, merged_PP_PP2, all=T, by=0)

colnames(merged_definitiva) <- c("Tax","IC19,5", "IC22", "IC36_1", "IC36_2", "IC39_1", "IC39_2")


merged_definitiva[is.na(merged_definitiva)] <- 0
rownames(merged_definitiva) <- merged_definitiva[,1]
merged_definitiva[,1] <- NULL


merged_definitiva_t <- t(merged_definitiva)

S <- specnumber(merged_definitiva_t)
raremax <- min(rowSums(merged_definitiva_t))
Srare <- rarefy(merged_definitiva_t, raremax)


## PLOTTING TIME! ##

colores <- c("#B40F20", "#E58601", rep("#46ACC8",2), rep("#E2D200",2)) # Choose the colour of your samples

line <- c(rep(c("solid"),3), "dotted", "solid", "dotted") # Choose the line type you want


jpeg("Rarefaction_reads.jpg", width = 30, height = 25, units = "cm", res = 300)  # Saving our plot...


rarecurve(merged_definitiva_t, step = 20, col = colores,   # ...making the plot...
          # cex = 80,
          sample=raremax, 
          lty = line,   # Change line appearance (dot, solid...)
          lwd = 3,      # Change line width 
          #bty='n', # Delete the box around the plot
          ylab = substitute(paste(bold("Number of genera"))), 
          xlab = substitute(paste(bold("Sample size"))),
          cex.lab = 1.3,     # Size of labels
          cex.axis = 1.2,    # Size of numbers in the axis
          label = F          # Label in each line
)

legend("bottomright",
       inset = 0.005,     # Exact position of the legend
       legend = c("IC19'5", "IC22", "IC36_1", "IC36_2", "IC39_1", "IC39_2"),  # Names of the sample
       col = colores, 
       lty = line, 
       ncol = 3,          # Number of columns in which you want to separate the legend
       lwd = 3,           # Line width of your legend
       cex = 1,           # Legend size
       box.lwd = 2        # Line width of the box 
)

dev.off()


## SAVE ## 

write.table(merged_definitiva_t, file = "Diversity_raw_reads.txt",sep = "\t")
