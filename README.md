# The_Metagenomics_dispatch
Scripts that help take small steps in the inmeasurable (and entertaining) world of metagenomics


### 1. TrimQC_en.sh
This is the first thing you should do before starting your study: check your samples quality and perform trimming to improve their quality. I recommend using MetaWRAP (https://pubmed.ncbi.nlm.nih.gov/30219103/) because it works with modules (making it easy to use) and also performs quality analysis automatically before and after trimming (thanks, MetaWRAP!). However, you are free to use your trusted tool :)

### 2. Assembly_SPA.sh
Actually, you can skip this step because SqueezeMeta offers you both MEGAHIT and metaSPAdes assembly

### 3. SQM_table_en.sh
This tool is the crown jewel! This is just an example script so you can figure out how is this tool used, but you should read https://github.com/jtamames/SqueezeMeta to perform your perfect metagenome analysis
