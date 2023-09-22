
# Author: Alicia Garcia-Roldan

# Date: June 2023

# R v.4.1.2


# Plotting our beautiful isoelectric point with the table "Punto_isoelectrico_ArchBact.txt" obtained
# with our script "18.Isoelectric_point_table.R"


## LIBRARY ##

library(ggplot2)  # v.3.4.0


## DATASET ##

df = read.csv("Punto_isoelectrico_ArchBact.txt", header=T, sep="\t")


## PLOTTING TIME! ##

# Tchaikovsky violin concerto op.35 allegro moderato moderato assai

ggplot(df) +
  geom_violin (aes(y=PI, x=Domain, fill=Domain), linewidth=0.8) + 
  scale_y_continuous(breaks = seq(2,14, by = 2)) + 
  ylab("Isoelectric point") + 
  theme(
    legend.position ="none", 
    plot.margin = margin(t = 20,  # Top margin
                         r = 20,  # Right margin
                         b = 20,  # Bottom margin
                         l = 20), # Left margin
    axis.title = element_text(colour="black", margin = margin(r = 10, t=10), 
                              size = 17, face ="bold"),
    axis.text.x = element_text(colour="black", margin = margin(r = 5, t=5), 
                               size= 15, face = "bold.italic"), 
    axis.text.y = element_text(colour="black", margin = margin(r = 5, t=5),  size= 15, face = "bold"),
    panel.background = element_blank(), # White background
    axis.line = element_line(size=1) # Draw axis lines
  ) + 
  scale_fill_manual(values=c("#FF4373", "#FFDE8B"))  # Now I'm moving to vaporwave art


## SAVE ##

ggsave("Job1_PI_archbact.png", width = 30, height = 25, units = "cm", bg = "transparent")
ggsave("Job1_PI_archbact.pdf", width = 30, height = 25, units = "cm", bg = "transparent")
