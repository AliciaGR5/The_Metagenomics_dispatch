# The_Metagenomics_dispatch

<div align="center">
  <img width="1598" height="107" alt="image" src="https://github.com/user-attachments/assets/e5f0fe00-c5b8-4624-b8ac-b6b97932db8b" />

</div>

<br>


#### By Alicia Garcia-Roldan
<pre>
:fox_face: :wink: Scripts that may be helpful to take small steps in the inmeasurable (and entertaining) world of metagenomics :wink: :fox_face:
</pre>

===========================================================================

**IMPORTANT INFORMATION:** These scripts are for:
  + SqueezeMeta v.1.6.1post1 
  + Bash v.4.4.20
  + Python v.3.6.8
  + R v.3.6.3 (2020-02-29) and v.4.1.2 (2021-11-01)

===========================================================================

**'Altruistic' cooperation among the prokaryotic community of Atlantic salterns assessed by metagenomics.**   
García-Roldán A, de la Haba RR, Sánchez-Porro C, Ventosa A. (2024). 
Microbiol Res. 288:127869. [doi: 10.1016/j.micres.2024.127869](https://www.sciencedirect.com/science/article/pii/S0944501324002702?via%3Dihub) <br><br>

:fox_face: You can see more scripts in the second part of this adventure!! Go and visit [**Metagenomics_on_the_verge_of_a_nervous_breakdown**](https://github.com/AliciaGR5/Metagenomics_on_the_verge_of_a_nervous_breakdown) :fox_face:

===========================================================================

### [01. TrimQC_en.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/01.%20TrimQC_en.sh)
This is the first thing you should do before starting your study: check your samples quality and perform trimming to improve their quality. I recommend using [MetaWRAP](https://pubmed.ncbi.nlm.nih.gov/30219103/) because it works with modules (making it easy to use) and also performs quality analysis automatically before and after trimming (thanks, MetaWRAP!). However, you are free to use your trusted tool :)

### [02. Assembly_SPA.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/02.%20Assembly_SPA.sh)
Actually, you can skip this step because SqueezeMeta offers you both MEGAHIT and metaSPAdes assembly.

### [03. SQM_table_en.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/03.%20SQM_table_en.sh)
This tool is the crown jewel! This is just an example script, so you can figure out how this tool is used, but you should read [SqueezeMeta manual](https://github.com/fpusan/SqueezeMeta) to perform your perfect metagenome analysis.

### [04. Rmv_line.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/04.%20Rmv_line.sh)
SqueezeMeta generates a lot of tables, but if you want to work with them in R (or with any other language or tool), you should remove the first line because it is not a 'data line.' It contains information that can sometimes cause issues when working with the data.

### [05. Rmv_loop.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/05.%20Rmv_loop.sh)
It's just if you want to create a loop and make your life easier.

### [06. Diversity_table_f.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/06.%20Diversity_table_f.R)
This script counts how many contigs are related with each family in each sample.
+ It will be useful for [11. Rarefaction_family.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/11.%20Rarefaction_family.R) and [13. Alphadiversity_plot_tax.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/13.%20Alphadiversity_plot_tax.R) scripts.

### [07. Diversity_table_g.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/07.%20Diversity_table_g.R)
This script counts how many contigs are related with each genus in each sample.
+ It will be useful for [12. Rarefaction_genus.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/12.%20Rarefaction_genus.R) and [13. Alphadiversity_plot_tax.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/13.%20Alphadiversity_plot_tax.R) scripts.

### [08. Diversity_table_KEGG.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/08.%20Diversity_table_KEGG.R)
This script counts how many contigs are related with each KEGG terms in each sample.
+ It will be useful for [14. Alphadiversity_plot_KEGG.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/14.%20Alphadiversity_plot_KEGG.R) script.

### [09. Raw_read_funx.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/09.%20Raw_read_funx.R)
The first thing you should do before testing your hypotheses in your metagenomic study is to check if your samples are comparable. To do this, it is advisable to create a rarefaction curve.
We will perform it based on reads and at the family level, but you can do it at the level you prefer to work with. This is especially important when calculating alpha diversity (which we will discuss later).
With this script, you will obtain a table with the total number of reads that make up each family in each of your samples.

### [10. Rarefaction_rawreads_merge.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/10.%20Rarefaction_rawreads_merge.R)
This script merges the files obtained with [09. Raw_read_funx.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/09.%20Raw_read_funx.R) ... okay, maybe it's not the most elegant script, but it gets the job done ... Don't worry!! From here on, everything is going to be more beautiful and elegant.
![Rarefaction_reads_edit_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/1091f28c-fe4b-4888-b19c-d788509c0200)

### If reads are not for you...
If you can't work with your reads (or you don't want) here are other scripts that do the same but at contig level. You should know that sometimes this approach to the work is not accurate, it depends on the level and the accuracy you want to have in your study. It's up to you! :)

- ### [11. Rarefaction_family.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/11.%20Rarefaction_family.R)
  - This script requires the table obtained with the [06. Diversity_table_f.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/06.%20Diversity_table_f.R) script and it draws the rarefaction curve at family level.
- ### [12. Rarefaction_genus.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/12.%20Rarefaction_genus.R)
  - This script requires the table obtained with the [07. Diversity_table_g.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/07.%20Diversity_table_g.R) script and it draws the rarefaction curve at genus level.

### [13. Alphadiversity_plot_tax.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/13.%20Alphadiversity_plot_tax.R)
This script calculates alpha diversity (at taxa level) using the Shannon index and makes a beautiful lollipop plot.
+ You will need the result of [06. Diversity_table_f.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/06.%20Diversity_table_f.R) or [07. Diversity_table_g.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/07.%20Diversity_table_g.R) scripts.
![Job1_alphadiversity_f_R_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/4055d6c3-4712-4f4b-b290-0ba4dc6ea35c)

### [14. Alphadiversity_plot_KEGG.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/14.%20Alphadiversity_plot_KEGG.R)
This script calculates alpha diversity (at KEGG terms level) using the Shannon index and makes a beautiful lollipop plot.
+ You will need the result of [08. Diversity_table_KEGG.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/08.%20Diversity_table_KEGG.R) script.
![Job1_alphadiversity_KEGG_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/4c4fbc1a-9ab0-4001-b67f-fa33849b6feb)

### [15. GC_plot_count.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/15.%20GC_density_plot.R)
This script plots your GC results (many, many, maaaaany tears have been shed in this script).
![GC_density_plot](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/a214e812-a331-4950-9051-7e491702f63e)

### [16. PI_calc.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/16.%20PI_calc.sh)
This allows you to calculate the isoelectric point.

### [17. PI_calc_loop.sh](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/17.%20PI_calc_loop.sh)
It's just if you want to create a loop and make your life easier.

### [18. Isoelectric_point_table.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/18.%20Isoelectric_point_table.R)
It's a good idea to observe how the isoelectric point of your samples proteome changes, so here's a script to do it for the entire sample or separately for two groups: archaea and bacteria (because we think it's interesting to know).
+ You'll need an additional script called 'fasta2pi' which we can't upload, but please contact us, and we'll show you how to do it **(agroldan[at]us[dot]es)**.

### [19. PI_violin_plot.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/19.%20PI_violin_plot.R)
This script will create a violin plot to visualize the differences in isoelectric points between bacteria and archaea.
+ It requires the table "Isoelectric_point_ArchBact.txt" obtained with [18. Isoelectric_point_table.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/18.%20Isoelectric_point_table.R) script.
![Job1_PI_archbact_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/fd8ba073-a301-494d-93cd-ff0d9f0d5cf7)

### [20. PI_density_plot.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/20.%20PI_density_plot.R)
This script will create a plot to visualize the differences in isoelectric points between different samples.
+ It requires the table "Isoelectric_point_total.txt" obtained with [18. Isoelectric_point_table.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/18.%20Isoelectric_point_table.R) script.
![PI_density_edit_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/9ac6c6d9-c2ee-4a47-91c6-600cf5e9fe67)

### [21. countingAAS.py](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/21.%20countingAAS.py)
Have you ever dreamt about counting the amino acids of your sample? Here's the solution!

### [22. AA_count.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/22.%20AA_count.R)
It requires the results ...clean.fasta.aas.out obtained with [21. countingAAS.py](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/21.%20countingAAS.py) script.
You can choose whether you want to plot all metagenomes in a single figure or vice versa.
+ If you want to be rigorous, you have to clean your sequences first, so you'll need an additional script called 'cleaning_seqs.py' which we can't upload, but please contact us, and we'll show you how to do it **(agroldan[at]us[dot]es)**.
![AAcount_one4all_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/e412a116-fe33-4436-aa11-8fe30f6fd2a0)
![AAcount_all4one_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/6e4e376f-9ed3-4328-976e-1d5dbaeec142)

### [23. Bubbles_recruitment.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/23.%20Bubbles_recruitment.R)
Finally, you can see if the bins obtained with SqueezeMeta are in other environments...maybe your little baby is ubiquitous (or not)!! You should do recruitment.
You can plot it in a bubble plot...
![Recruitment_bubble_edit_english](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/83c2d01d-fb59-4cce-9c37-002281e18162)

### [24. Recruitment_loop_IC.R](https://github.com/AliciaGR5/The_Metagenomics_dispatch/blob/main/24.%20Recruitment_loop_IC.R)
...or in a barplot...it is up to you! :)
![Github_recruit](https://github.com/AliciaGR5/The_Metagenomics_dispatch/assets/99254799/1e9ad9eb-4b3c-40ad-b16b-7d49c92f4c0a)

