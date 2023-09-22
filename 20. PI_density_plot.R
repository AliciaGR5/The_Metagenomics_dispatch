
# Author: Alicia Garcia-Roldan

# Date: September 2023

# R v.4.1.2


# Plotting our beautiful isoelectric point with the table "Punto_isoelectrico_total.txt" obtained
# with our script "18.Isoelectric_point_table.R"


## LIBRARY ##

library(ggplot2)  # v.3.4.0


## DATASET ##

df2 = read.csv("Punto_isoelectrico_total.txt", header=T, sep="\t")


## PLOTTING TIME!! 

ggplot(df2, aes(x=PI, color=factor(Sample))) +
  geom_density(aes(y = stat(count)), size=1.5) +
  labs(colour="Samples", y="Count", x="Isoelectric point") +
  theme (panel.background = element_blank(), # White background
         axis.title.x = element_text(margin = margin(t = 15),
                                     size=15, face="bold", colour = "black"),
         axis.text.x = element_text(face="bold",size=13, colour = "black"),
         axis.ticks.x = element_blank(),
         axis.title.y = element_text(margin = margin(r = 15), # Set some margin from the coord
                                     size=15, face="bold", colour = "black"),
         axis.text.y = element_text(face="bold",size=13, colour = "black"),
         axis.line = element_line(size=1), # Draw axis lines
         axis.ticks.y = element_blank(),
         legend.title = element_text(face="bold",size=15),
         legend.position = c(0.9, 0.6),
         legend.key.size = unit(0.5, 'cm'),     # change legend key size
         legend.text = element_text(size=14),   # change legend text font size
         legend.key = element_rect(fill="white")) +
  
  scale_x_continuous(breaks= seq((as.numeric(0)),(as.numeric(14)),by=1), limits = c((as.numeric(0)),(as.numeric(14)))) +
  scale_color_manual(values = c("#B40F20", "#E58601", rep("#46ACC8",2), rep("#E2D200",2)))


## SAVE ##

ggsave("PI_density.png", width = 30, height = 25, units = "cm", bg = "transparent")
ggsave("PI_density.pdf", width = 30, height = 25, units = "cm", bg = "transparent")
