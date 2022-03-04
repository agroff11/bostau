collected files from download directory and used python script to generate an alignment script

add to fastq_files: 
filename	basename	sample_id	read_id

added so that rsem will run: 
source new-modules.sh
centos6/0.0.1-fasrc01
module load rsem/1.2.29-fasrc02

updated rsem_align.sh for this analysis (inlcuding single cell prior) 

testing one alignment, if this works will submit the rest


