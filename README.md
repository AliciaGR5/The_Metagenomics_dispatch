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
Actually, you can skip this step because SqueezeMeta offers you both MEGAHIT and metaSPAdes assembly.

### [03. SQM_table_en.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/03.%20SQM_table_en.sh)
This tool is the crown jewel! This is just an example script so you can figure out how is this tool used, but you should read [SqueezeMeta manual](https://github.com/jtamames/SqueezeMeta) to perform your perfect metagenome analysis.

### [04. Rmv_line.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/04.%20Rmv_line.sh)
SqueezeMeta generates a lot of tables, but if you want to work with them in R (or with any other language or tool), you should remove the first line because it is not a 'data line.' It contains information that can sometimes cause issues when working with the data.

### [05. Rmv_loop.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/05.%20Rmv_loop.sh)
It's just if you want to create a loop and make your life easier.

### [06. Diversity_table_f.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/06.%20Diversity_table_f.R)
This script counts how many contigs are related with each family in each sample.
+ It will be useful for [11. Rarefaction_family.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/11.%20Rarefaction_family.R), [12. Rarefaction_genus.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/12.%20Rarefaction_genus.R) and [13. Alphadiversity_plot_tax.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/13.%20Alphadiversity_plot_tax.R) scripts.

### [07. Diversity_table_g.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/07.%20Diversity_table_g.R)
This script counts how many contigs are related with each genus in each sample.
+ It will be useful for [11. Rarefaction_family.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/11.%20Rarefaction_family.R), [12. Rarefaction_genus.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/12.%20Rarefaction_genus.R) and [13. Alphadiversity_plot_tax.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/13.%20Alphadiversity_plot_tax.R) scripts.

### [08. Diversity_table_KEGG.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/08.%20Diversity_table_KEGG.R)
This script counts how many contigs are related with each KEGG terms in each sample.
+ It will be useful for [14. Alphadiversity_plot_KEGG.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/14.%20Alphadiversity_plot_KEGG.R) script.

### [09. Raw_read_funx.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/09.%20Raw_read_funx.R)
The first thing you should do before testing your hypotheses in your metagenomic study is to check if your samples are comparable. To do this, it is advisable to create a rarefaction curve.
We will perform it based on reads and at the family level, but you can do it at the level you prefer to work with. This is especially important when calculating alpha diversity (which we will discuss later).
With this script, you will obtain a table with the total number of reads that make up each family in each of your samples.

### [10. Rarefaction_rawreads_merge.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/10.%20Rarefaction_rawreads_merge.R)
This script merges the files obtained with [09. Raw_read_funx.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/09.%20Raw_read_funx.R) and creates a plot like this:
![Rarefaction_reads_edit_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/2a15fb71-6f59-43ef-b86d-675991c4c5c5)

If you can't work with your reads (or you don't want) here are other scripts that do the same but at contig level. You should know that sometimes this approach to the work is not accurate, it depends on the level and the accuracy you want to have in your study. It's up to you! :)

- ### [11. Rarefaction_family.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/11.%20Rarefaction_family.R)
  - This script requires the table obtained with the [06. Diversity_table_f.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/06.%20Diversity_table_f.R) script and draw the rarefaction curve at family level.
- ### [12. Rarefaction_genus.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/12.%20Rarefaction_genus.R)
  - This script requires the table obtained with the [07. Diversity_table_g.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/07.%20Diversity_table_g.R) script and draw the rarefaction curve at genus level.

### [13. Alphadiversity_plot_tax.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/13.%20Alphadiversity_plot_tax.R)
This script calculates alpha diversity (at taxa level) using the Shannon index and makes a beautiful lollipop plot.
+ You will need the result of [06. Diversity_table_f.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/06.%20Diversity_table_f.R) or [07. Diversity_table_g.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/07.%20Diversity_table_g.R) scripts.
![Job1_alphadiversity_f_R_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/016c685a-5d4c-4815-ae53-fdd9f8767eb1)

### [14. Alphadiversity_plot_KEGG.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/14.%20Alphadiversity_plot_KEGG.R)
This script calculates alpha diversity (at KEGG terms level) using the Shannon index and makes a beautiful lollipop plot.
+ You will need the result of [08. Diversity_table_KEGG.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/08.%20Diversity_table_KEGG.R) script.
![Job1_alphadiversity_KEGG_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/cba6fa91-7cc2-4cee-9e8a-24f7c9572a85)

### [15. GC_plot_count.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/15.%20GC_plot_count.R)
This script plot your GC results.
![Job1_G+Ccount_bin_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/80189dad-8b6a-4c07-be37-24ac875d557d)

### [16. PI_calc.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/16.%20PI_calc.sh)
This allows you to calculate the isoelectric point.

### [17. PI_calc_loop.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/17.%20PI_calc_loop.sh)
It's just if you want to create a loop and make your life easier.

### [18. Isoelectric_point_table.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/18.%20Isoelectric_point_table.R)
It's a good idea to observe how the isoelectric point of your sample's proteome changes, so here's a script to do it for the entire sample or separately for two groups: archaea and bacteria (because we think it's interesting to know).
+ You'll need an additional script called 'fasta2pi' which we can't upload, but please contact us, and we'll show you how to do it **(agroldan@us.es)**.

### [19. PI_violin_plot.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/19.%20PI_violin_plot.R)
This script will create a violin plot to visualize the differences in isoelectric points between bacteria and archaea.
+ It requires the table "Punto_isoelectrico_ArchBact.txt" obtained with [18. Isoelectric_point_table.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/18.%20Isoelectric_point_table.R) script.
![Job1_PI_archbact_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/13db65fc-7908-4ff6-b32a-c3e1ded79031)

### [20. PI_density_plot.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/20.%20PI_density_plot.R)
This script will create a plot to visualize the differences in isoelectric points between different samples.
+ It requires the table "Punto_isoelectrico_total.txt" obtained with [18. Isoelectric_point_table.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/18.%20Isoelectric_point_table.R) script.
![PI_density_edit_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/3d8b5075-1c45-4cab-b71a-ff4aefb523a1)

### [21. countingAAS.py](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/21.%20countingAAS.py)
Have you ever dream about counting the amino acids of your sample? Here's is the solution!

### [22. AA_count.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/22.%20AA_count.R)
It requires the results ...clean.fasta.aas.out obtained with [21. countingAAS.py](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/21.%20countingAAS.py) script.
You can choose whether you want to plot all metagenomes in a single figure or vice versa.
+ If you want to be rigorous, you have to clean your sequences first, so you'll need an additional script called 'cleaning_seqs.py' which we can't upload, but please contact us, and we'll show you how to do it **(agroldan@us.es)**.
![AAcount_one4all_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/56620990-cd79-4c08-b535-02d90e1016a7)
![AAcount_all4one](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/04bfdf00-dcdc-4aad-b62c-a0732d8f8ab7)

### [23. Bubbles_recruitment.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/23.%20Bubbles_recruitment.R)
Finally, you can see if the bins obtained with SqueezeMeta are in other environments...maybe your little baby is ubiquitous (or not)!! You should do recruitment.
You can plot it in a bubble plot...
![Recruitment_bubble_edit_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/059ba593-51ad-4163-ba82-0be053ab88bb)

### [24. Recruitment_loop_IC.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/24.%20Recruitment_loop_IC.R)
...or in a barplot...it is up to you! :)
![Github_recruit](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/dac8fbed-2df3-46b0-9753-0e1fd5952555)



