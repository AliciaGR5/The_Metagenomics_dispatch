
# Author: Alicia Garcia-Roldan

# Date: July 2023

# R v.4.1.2


## LIBRARY ##

library(ggplot2)  # v.3.4.0
library(ggpubr)  # v.0.6.0


## DATASET ##

allrec <- c(IC195 = "Reclutamientos_IC19_5.txt", IC22="Reclutamientos_IC22.txt",
            IC361="Reclutamientos_IC361.txt", IC362="Reclutamientos_IC362.txt",
            IC391="Reclutamientos_IC391.txt", IC392="Reclutamientos_IC392.txt")

projs=list()

plot=list()

for (sample in names(allrec)) {
  projs[[sample]] = read.csv(allrec[[sample]], header=T, sep="\t", quote = "")
  projs[[sample]] <- cbind(projs[[sample]], c(rep(sample, nrow(projs[[sample]])))) # Add sample column, easier
                                                                                   # to identify
  colnames(projs[[sample]]) <- c("Genome", "Reads", "Genoma (bp)", "Genoma (Kb)",
                                 "Metagenoma (bp)", "Metagenoma (Kb)", "RPKG", "Sample") # Renaming my table :)
  
  orden <- c("c157", "c78", "c65", "c104",
             "Spiribacter_salinus_M1940", "Haloquadratum_walsbyi_C23") # Barplot changes your order
                                                                       # so you have to force it :(
  
  ## PLOTTING TIME! ##
  
  colores <- c("#7ecdb0", "#eeadb0","#fce1ac", "#a2d7a9", "#dcbada", "#d1a055") # Thanks, Wes Anderson, again
  
  plot[[sample]] <- ggplot(data=projs[[sample]], aes(x=Genome, y=RPKG, fill = Genome)) +
    geom_bar(stat="identity", width=0.8) + 
    xlab(projs[[sample]]$Sample) +
    theme(
      legend.position = c(0.8, 0.8),         # Change legend position
      legend.key.size = unit(0.5, 'cm'),     # Change legend key size
      legend.text = element_text(size=11),   # Change legend text font size
      legend.title = element_text(size=13.5, face="bold"),
      axis.ticks.x = element_blank(),        #Delete the little lines marking the values
      axis.text.x = element_blank(),
      axis.title.x = element_text(face = 'bold', size = 11),
      panel.background = element_blank(), # White background
      axis.line = element_line(size = 0.8, colour = "black"),  # Draw axis lines 
      axis.text.y = element_text(size = 12, colour = "black"),
      axis.title.y = element_text(face = 'bold', size = 11,
                                  margin = margin(t = 0.2, # Top margin
                                                  r = 0.2, # Right margin
                                                  b = 0.2, # Bottom margin
                                                  l = 0.2, # Left margin
                                                  unit = "cm"))) +
    scale_x_discrete(limits = orden) + 
    scale_y_continuous(limits = c(0,307), breaks = seq((as.numeric(0)),(as.numeric(307)),by=25)) +
    scale_fill_manual(values=colores)
}


myplot <- ggarrange(plotlist = plot,  # You have to give it a list
                    ncol=3, nrow = 2,
                    font.label = list(size = 10, color = "black", face = "bold", family = NULL),
                    widths = 2,
                    common.legend = TRUE, legend="bottom")


## SAVE ##

ggsave("Recruitment_IC_bucle.png", width = 30, height = 25, units = "cm", bg = "transparent")
ggsave("Recruitment_IC_bucle.pdf", width = 30, height = 25, units = "cm", bg = "transparent")
