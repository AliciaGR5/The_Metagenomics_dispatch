# The_Metagenomics_dispatch
Scripts that help take small steps in the inmeasurable (and entertaining) world of metagenomics :wink:


===========================================================================

**IMPORTANT INFORMATION:** These scripts are for:
  + SqueezeMeta v.1.6.1post1 
  + Bash v.4.4.20
  + Python v.3.6.8
  + R v.3.6.3 (2020-02-29) and v.4.1.2 (2021-11-01)

===========================================================================


### [01. TrimQC_en.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/01.%20TrimQC_en.sh)
This is the first thing you should do before starting your study: check your samples quality and perform trimming to improve their quality. I recommend using [MetaWRAP](https://pubmed.ncbi.nlm.nih.gov/30219103/) because it works with modules (making it easy to use) and also performs quality analysis automatically before and after trimming (thanks, MetaWRAP!). However, you are free to use your trusted tool :)

### [02. Assembly_SPA.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/02.%20Assembly_SPA.sh)
Actually, you can skip this step because SqueezeMeta offers you both MEGAHIT and metaSPAdes assembly

### [03. SQM_table_en.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/03.%20SQM_table_en.sh)
This tool is the crown jewel! This is just an example script so you can figure out how is this tool used, but you should read [SqueezeMeta manual](https://github.com/jtamames/SqueezeMeta) to perform your perfect metagenome analysis

### [04. Rmv_line.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/04.%20Rmv_line.sh)
SqueezeMeta generates a lot of tables, but if you want to work with them in R (or with any other language or tool), you should remove the first line because it is not a 'data line.' It contains information that can sometimes cause issues when working with the data

### [05. Rmv_loop.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/05.%20Rmv_loop.sh)
It's just if you want to create a loop and make your life easier

### [06. Diversity_table_f.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/06.%20Diversity_table_f.R)
This script counts how many contigs are related with each family in each sample.
+ It will be useful for [11. Rarefaction_family.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/11.%20Rarefaction_family.R), [12. Rarefaction_genus.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/12.%20Rarefaction_genus.R) and [13. Alphadiversity_plot_tax.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/13.%20Alphadiversity_plot_tax.R) scripts

### [07. Diversity_table_g.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/07.%20Diversity_table_g.R)
This script counts how many contigs are related with each genus in each sample.
+ It will be useful for [11. Rarefaction_family.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/11.%20Rarefaction_family.R), [12. Rarefaction_genus.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/12.%20Rarefaction_genus.R) and [13. Alphadiversity_plot_tax.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/13.%20Alphadiversity_plot_tax.R) scripts

### [08. Diversity_table_KEGG.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/08.%20Diversity_table_KEGG.R)
This script counts how many contigs are related with each KEGG terms in each sample.
+ It will be useful for [14. Alphadiversity_plot_KEGG.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/14.%20Alphadiversity_plot_KEGG.R) script

### [09. Raw_read_funx.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/09.%20Raw_read_funx.R)
The first thing you should do before testing your hypotheses in your metagenomic study is to check if your samples are comparable. To do this, it is advisable to create a rarefaction curve.
We will perform it based on reads and at the family level, but you can do it at the level you prefer to work with. This is especially important when calculating alpha diversity (which we will discuss later).
With this script, you will obtain a table with the total number of reads that make up each family in each of your samples

### [10. Rarefaction_rawreads_merge.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/10.%20Rarefaction_rawreads_merge.R)
This script merges the files obtained with [06. Raw_read_funx.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/06.%20Raw_read_funx.R) and creates a plot like this
![Rarefaction_reads_edit_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/2a15fb71-6f59-43ef-b86d-675991c4c5c5)

If you can't work with your reads (or you don't want) here are other scripts that do the same but at contig level. You should know that sometimes this approach to the work is not accurate, it depends on the level and the accuracy you want to have in your study. It's up to you! :)

- ### [11. Rarefaction_family.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/11.%20Rarefaction_family.R)
  - This script requires the table obtained with the [08. Diversity_table_f_AGR.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/08.%20Diversity_table_f_AGR.R) script and draw the rarefaction curve at family level
- ### [12. Rarefaction_genus.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/12.%20Rarefaction_genus.R)
  - This script requires the table obtained with the [09. Diversity_table_g_AGR.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/09.%20Diversity_table_g_AGR.R) script and draw the rarefaction curve at genus level

### [13. Alphadiversity_plot_tax.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/13.%20Alphadiversity_plot_tax.R)
This script calculates alpha diversity (at taxa level) using the Shannon index and makes a beautiful lollipop plot
![Job1_alphadiversity_f_R_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/016c685a-5d4c-4815-ae53-fdd9f8767eb1)

### [14. Alphadiversity_plot_KEGG.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/14.%20Alphadiversity_plot_KEGG.R)
This script calculates alpha diversity (at KEGG terms level) using the Shannon index and makes a beautiful lollipop plot
![Job1_alphadiversity_KEGG_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/cba6fa91-7cc2-4cee-9e8a-24f7c9572a85)

### [15. GC_plot_count.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/15.%20GC_plot_count.R)
This script plot your GC results
![Job1_G+Ccount_bin_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/80189dad-8b6a-4c07-be37-24ac875d557d)


