
# Author: Alicia Garcia-Roldan

# Date: April 2023

# R v.4.1.2


# We can use either Table 18 (bins) or Table 19 (contigs) depending on what we want to know

# Remember to delete the first line (Rmv_bucle.sh)


## LIBRARY ##

library(ggplot2)  # v.3.4.0


## DATASET ##

allgc <- c(IC195 = "IC19_5_SQM.bintable.paqui", IC22="IC22_SQM.bintable.paqui", IC361="IC361_SQM.bintable.paqui",
           IC362="IC362_SQM.bintable.paqui", IC391="IC391_SQM.bintable.paqui", IC392="IC392_SQM.bintable.paqui")


projs=list()

for (sample in names(allgc)) {
  projs[[sample]] = read.csv(allgc[[sample]], header=T, sep="\t", quote = "")
  projs[[sample]] <- projs[[sample]][,c("Bin.ID","GC.perc")]
  projs[[sample]] <- cbind(projs[[sample]], c(rep(sample, nrow(projs[[sample]]))))
  colnames(projs[[sample]]) <- c("Bin.ID","GC.perc", "Sample")
}
  
df <- data.frame(matrix(ncol = 3, nrow = 0))

for (sample in names(projs)){
  df <- rbind(df, projs[[sample]])
}


colnames(df) <- c("Bin.ID","GC.perc", "Sample")

df$GC.perc <- as.numeric(as.character(df$GC.perc)) # Change the column from character to numeric


## PLOTTING TIME! ##

ggplot(df, aes(x=round(GC.perc, 0), color=factor(Sample))) +
  geom_density(aes(y = stat(count)), size=1.5) +
  labs(colour="Samples", y="Count", x="GC (%mol)") +
  theme (panel.background = element_blank(), # White background
         axis.title.x = element_text(margin = margin(t = 15),
                                     size=15, face="bold"),
         axis.text.x = element_text(face="bold",size=13),
         axis.title.y = element_text(margin = margin(r = 15), # Set some margin from the coord
                                     size=15, face="bold"),
         axis.text.y = element_text(face="bold",size=13),
         axis.line = element_line(size=1), # Draw axis lines
         legend.title = element_text(face="bold",size=13),
         legend.position = c(0.9, 0.6),
         legend.key.size = unit(0.5, 'cm'),     # change legend key size
         legend.text = element_text(size=13),   # change legend text font size
         legend.key = element_rect(fill="white")) +

  scale_x_continuous(breaks= seq((as.numeric(10)),(as.numeric(90)),by=10), limits = c((as.numeric(10)),(as.numeric(90)))) +
  scale_color_manual(values = c("#B40F20", "#E58601", rep("#46ACC8",2), rep("#E2D200",2)))
  

## SAVE ##

ggsave("Job1_G+Ccount.png", width = 30, height = 25, units = "cm", bg = "transparent")
ggsave("Job1_G+Ccount.pdf", width = 30, height = 25, units = "cm", bg = "transparent")