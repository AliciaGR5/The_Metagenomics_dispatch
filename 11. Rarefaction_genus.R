
# Author: Alicia Garcia-Roldan

# Date: May 2023

# R v.4.1.2


# Preparing data ("Diversity_table_genus.txt") obtained with the script "Diversity_table_g_AGR.R"


## LIBRARY ##

library(vegan) # v.2.6.4
library(paletteer)


## DATASET ##

f = read.csv("Diversity_table_genus.txt", header=T, sep="\t", quote = "")


# Calculating rarefaction curve...

S <- specnumber(f)
raremax <- min(rowSums(f))
Srare <- rarefy(f, raremax)


## PLOTTING TIME! ##

colores <- c("#B40F20", "#E58601", rep("#46ACC8",2), rep("#E2D200",2)) # Choose the colour of your samples

line <- c(rep(c("solid"),3), "dotted", "solid", "dotted") # Choose the line type you want


jpeg("Rarefaction_genus.jpg", width = 30, height = 25, units = "cm", res = 300)  # Saving our plot...


rarecurve(f, step = 20, col = colores,   # ...making the plot...
          sample=raremax, 
          lty = line,   # Change line appearance (dot, solid...)
          lwd = 3,      # Change line width 
          ylab = substitute(paste(bold("Number of genera"))), 
          xlab = substitute(paste(bold("Sample size"))),
          cex.lab = 1.3,     # Size of labels
          cex.axis = 1.2,    # Size of numbers in the axis
          label = F          # Label in each line
)

legend("bottomright",
       inset = 0.005,     # Exact position of the legend
       legend = c("IC19'5", "IC22", "IC36 1", "IC36 2", "IC39 1", "IC39 2"),  # Names of the sample
       col = colores, 
       lty = line, 
       ncol = 3,          # Number of columns in which you want to separate the legend
       lwd = 3,           # Line width of your legend
       cex = 1,           # Legend size
       box.lwd = 2        # Line width of the box 
)


dev.off()
