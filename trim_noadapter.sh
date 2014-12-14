x=${1%.*}
basename=${x##*/}
fasta=$basename.fa
fastq_trimmed=${basename}_trimmed.fastq
cat $1 | fastx_trimmer -f7 -Q33 | fastx_clipper -n -l25 -Q33 -a AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA| fastq_quality_filter -Q33 -q25 -p80  | fastx_collapser -Q33 > $fasta
fasta_to_fastq.pl $fasta > $fastq_trimmed
rm -f $fasta