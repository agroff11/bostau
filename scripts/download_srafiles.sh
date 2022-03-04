#fastq-dump --gzip $(</n/rinn_data2/users/agroff/seq/EMBRYO_OTHER/BOVINE/BovineSeqAccessionList_SRP107854.txt)
#fastq-dump --gzip $(</n/rinn_data2/users/agroff/seq/EMBRYO_OTHER/BOVINE/active_download_list.txt)

#bsub -e bovine_download.err -o bovine_download.out ./download_srafiles.sh

for file in `cat BovineSeqAccessionList_SRP107854.txt`;do 
	fastq-dump --split-3 --gzip $file
done
