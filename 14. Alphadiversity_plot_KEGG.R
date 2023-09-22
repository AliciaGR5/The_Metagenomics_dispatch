
# Author: Alicia Garcia-Roldan

# Date: May 2023

# R v.4.1.2


# Drawing a beautiful lollipop plot to show the alpha diversity of our samples
# We can use the table generated with "08.Diversity_table_KEGG.R" script


## LIBRARY ##

library(vegan)  # v.2.6.4
library(ggplot2)  # v.3.4.0
library(forcats)  # v.1.0.0


## DATASET ##

readfile <- read.csv("Diversity_table_KEGG.txt",header=T,row.names=1,sep="\t") # Reading "diversity_table" file


## ALPHA DIVERSITY CALCULATION ##

df2 <- as.data.frame(diversity(readfile, index = "shannon"))

my_df <- data.frame(  # Making a new df with all our interesting results the way as we want :)
  "Samples" = as.character(c("IC19'5", "IC22", "IC36 1", "IC36 2", "IC39 1", "IC39 2")),
  "AD_Shannon" = df2$`diversity(readfile, index = "shannon")`
)

write.table(my_df, file = "Shannon_table_KEGG.txt",sep = "\t")


## PLOTTING TIME! ##   Remember that when you flip the plot, everything flips.
                     # If you want to change x axis, you have to play with y axis ;)


# Sucking too hard on your lollipop or love's gonna get you dooooown...

ggplot(my_df, aes(x=Samples, y=AD_Shannon)) +
  geom_segment(aes(x=Samples, xend=Samples, y=0, yend=AD_Shannon, color=Samples), # Make lines
               size=2) +
  geom_point(aes(color=Samples), size=4) + # Make dots
  theme_light() + # White background
  coord_flip() +  # Flip everything and draw the plot in horizontal way
  scale_x_discrete(limits = rev) + #y axis is reordered as I want ;)
  scale_color_manual(values = c("#B40F20", "#E58601", rep("#46ACC8",2), rep("#E2D200",2))) +   # Never stop believing in Wes Anderson
  geom_text(aes(label=round(AD_Shannon, 2)), size=5, color="black", vjust = -0.9) + # Put the number above the dots
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.major.x = element_line(size = 0.5, linetype =2, # Longest lines that go through the plot
                                      colour = "grey90"),
    panel.border = element_blank(), # No borders around the plot
    axis.text.x = element_text(colour="black", size=15, face = "bold",
                               margin = margin(t = 0.2, # Top margin
                                               r = 0.2, # Right margin
                                               b = 0.2, # Bottom margin
                                               l = 0.2, # Left margin
                                               unit = "cm")),
    axis.ticks.x = element_blank(), # Delete the little lines marking the values
    axis.title.x = element_text(face = 'bold', size =17,
                                margin = margin(t = 0.5, r = 0.5, b = 0.5, l = 0.5, unit = "cm")),
    axis.text.y = element_text(colour="black", size=15, face = "bold",
                               margin = margin(t = -0.9, r = -0.9, b = -0.9, l = -0.9, unit = "cm")),
    
    axis.ticks.y = element_blank(),
    axis.title.y = element_text(face = 'bold', size = 17,
                                margin = margin(t = 0.5, r = 1.5, b = 0.5, l = 0.5, unit = "cm")),
    legend.position = c(0.89, 0.3),        # Change legend position
    legend.key.size = unit(0.5, 'cm'),     # Change legend key size
    legend.text = element_text(size=13),   # Change legend text font size
    legend.title = element_text(size=13.5, face="bold"),
    legend.background = element_rect(fill="white", colour=1)  # Change legend background
  ) +
  
  scale_y_continuous(breaks= seq((as.numeric(0)),(as.numeric(10)),by=2), limits = c((as.numeric(0)),(as.numeric(10)))) +
  
  ylab("Alpha diversity (Shannon test)") +  # Renaming y axis
  xlab("Samples (KEGG ID)")                 # Renaming x axis


## SAVE ## 

ggsave("Job1_alphadiversity_KEGG.png", width = 30, height = 25, units = "cm", bg = "transparent")
ggsave("Job1_alphadiversity_KEGG.pdf", width = 30, height = 25, units = "cm", bg = "transparent")
