# rsem quant
#     rsem-calculate-expression [options] --paired-end upstream_read_file(s) downstream_read_file(s) reference_name sample_name
# for each embryo
# GTF=/n/rinn_data2/data/annotation/human/gencode.v19.transcripts.filtered.gtf


OUTROOT=/lab/solexa_page/agroff/EMBRYO_OTHER/bostau/rsem
GTF=/lab/solexa_page/agroff/EMBRYO_OTHER/bostau/annotation/rsem_BTau_4.6.1/rsem_updatedY_Btau4.6.1_ERCC

NAME=$1
OUTDIR=$OUTROOT/$NAME
mkdir $OUTDIR
R1=$2

# ALIGN/QUANT w RSEM using BOWTIE2 
# use --single-cell-prior

#sbatch -J $NAME -t $TIME --mem=$MEM -n $THREADS -N 1 -p general --mail-type=FAIL --wrap="rsem-calculate-expression \
#--bowtie2 --append-names --single-cell-prior -p $THREADS $R1 $GTF $OUTDIR"

THREADS=2

#bsub -e $NAME.err rsem-calculate-expression --bowtie2 --append-names --single-cell-prior -p $THREADS $R1 $GTF $OUTDIR
rsem-calculate-expression --bowtie2 --append-names --single-cell-prior -p $THREADS $R1 $GTF $OUTDIR

