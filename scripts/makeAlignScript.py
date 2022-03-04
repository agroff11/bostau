#from RNASeq.misc import pp

# Setup
project_root = "/lab/solexa_page/agroff/EMBRYO_OTHER/bostau/"

########################
# Alignment
########################

#Fastq info
fastq_file_handle = open(project_root+"scripts/"+"fastq_files.txt",'r')

headerVals = fastq_file_handle.readline().rstrip().split("\t")

samples = {}

#Samples
for line in fastq_file_handle:
	line = dict(zip(headerVals,line.rstrip().split("\t")))
	#remove .fastq.gz from "sample_id"
	new_sampleID=line['sample_id'].split(".")[0]
	line['sample_id']=new_sampleID
	samples.setdefault(line['sample_id'],{}).setdefault(line['read_id'],[]).append(line['filename'])
	#samples[line['sample_id']]['aligned'] = False
	#print line['aligned']
	#if not all((line['aligned']=='True',samples[line['sample_id']].setdefault('aligned',True))):
	#	samples[line['sample_id']]['aligned'] = False


#print(samples)

#Write alignment script
outHandle = open(project_root+"scripts/rsem_alignScript.sh",'w')
sampleNames = [x for x in samples.keys()]
sampleNames.sort()
for sample in sampleNames:
	print >>outHandle, "#%s" % sample
	print >>outHandle, "./rsem_align.sh %s %s\n" % (sample,",".join(samples[sample]['R1']))
