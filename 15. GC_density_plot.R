
# Author: Alicia Garcia-Roldan & Fernando Puente-Sanchez

						                     # I'll light a little candle for you, miarma #

# Date: September 2023

# R v.3.6.3 


# This script makes a plot of the distribution of GC content calculated from the reads (you might want to cry
# but don't worry, here´s the solution).


## DATASET ##

allgc = c(IC195 = 'IC19_5_GC_original.out', IC22='IC22_GC_original.out',
          IC361='IC361_GC_original.out', IC362='IC362_GC_original.out',
          IC391='IC391_GC_original.out', IC392='IC392_GC_original.out')

maxys = c()

smoothies = list()

for(sample in names(allgc)) {
	print(sample)  # Just to know everything is alright
	df = read.csv(allgc[[sample]], header=F, sep=';')
	df = df[- 1, ]
        df = cbind(df, c(rep(sample, nrow(df))))
	colnames(df) = c('Seq', 'NA', 'GC.perc', 'Sample') # Renaming my table :)
	df$GC.perc = 100 * df$GC.perc
	res = rep(0,100)
	present = table(df$GC.perc)
	present = 100*present / sum(present)
	maxys = c(maxys, max(present))
	res[as.numeric(names(present))] = present
	smoothies[[sample]] = smooth.spline(res)
	}


## PLOTTING TIME!! ##

png("GC_density_plot_hola.png", width = 30, height = 25, units = "cm", res = 300)


par(mar = c(4.5, 5, 3.7, 3.7)) # Margins

maxy = max(maxys)

cols = c('#B40F20', '#E58601', '#46ACC8', '#82C7DA', '#E2D200', '#EDE466')  

plot(x = 1:100,
     type = 'n',
     ylim = c(0,maxy),
     xlim = c(0,100),
     xlab = substitute(paste(bold('GC content (%)'))),
     ylab = substitute(paste(bold('Percentage of reads'))),
     cex.lab = 1.3,
     cex.axis = 1.2 )

for(i in 1:length(allgc)) {
	sample = names(allgc)[i]
	lines(smoothies[[sample]],
	      col = cols[i],
	      lwd = 4)   # Change line width
}

legend('topright',
       legend=names(allgc),
       col = cols,
       cex = 1.3,    # Legend size
       lwd = 4,      # Line width of your legend
       box.lwd = 2)  # Line width of the box 


dev.off()
