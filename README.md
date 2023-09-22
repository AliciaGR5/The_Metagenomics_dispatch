# The_Metagenomics_dispatch
Scripts that help take small steps in the inmeasurable (and entertaining) world of metagenomics

===========================================================================

** IMPORTANT INFORMATION: These scripts are for:
   + SqueezeMeta v.1.6.1post1 
   + Bash v.4.4.20
   + Python v.3.6.8
   + R v.3.6.3 (2020-02-29) and v.4.1.2 (2021-11-01)

===========================================================================

### 1. TrimQC_en.sh
This is the first thing you should do before starting your study: check your samples quality and perform trimming to improve their quality. I recommend using MetaWRAP (https://pubmed.ncbi.nlm.nih.gov/30219103/) because it works with modules (making it easy to use) and also performs quality analysis automatically before and after trimming (thanks, MetaWRAP!). However, you are free to use your trusted tool :)

### 2. Assembly_SPA.sh
Actually, you can skip this step because SqueezeMeta offers you both MEGAHIT and metaSPAdes assembly

### 3. SQM_table_en.sh
This tool is the crown jewel! This is just an example script so you can figure out how is this tool used, but you should read https://github.com/jtamames/SqueezeMeta to perform your perfect metagenome analysis

### 4. Rmv_line.sh
SqueezeMeta generates a lot of tables, but if you want to work with them in R (or with any other language or tool), you should remove the first line because it is not a 'data line.' It contains information that can sometimes cause issues when working with the data

### 5. Rmv_loop.sh
It's just if you want to create a loop and make your life easier
