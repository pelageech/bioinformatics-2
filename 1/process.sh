#!/bin/sh

# предполагается, что все зависимости загружены

wget -O SRR31294323.fastq.gz https://trace.ncbi.nlm.nih.gov/Traces/sra-reads-be/fastq?acc=SRR31294323
gzip -d SRR31294323.fastq.gz

wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz
mv GCF_000005845.2_ASM584v2_genomic.fna.gz reference.fna.gz
gzip -d reference.fna.gz

fastqc SRR31294323.fastq

mkdir output
minimap2 -d output/reference.mmi reference.fna
minimap2 -a output/reference.mmi SRR31294323.fastq > output/alignment.sam

samtools view -bS output/alignment.sam > output/alignment.bam

samtools flagstat output/alignment.bam > output/samtools_result.txt

echo 'grep "[0-9] mapped (" $1 | sed 's/^.*mapped/mapped/' | tr -d -c "0-9."' > parse.sh
chmod +x parse.sh
./parse.sh output/samtools_result.txt > final.txt

if (( $(echo "$(cat final.txt) < 90" | bc -l) )); then
    echo "Not OK"
else
    samtools sort output/alignment.bam > alignment.sorted.bam
    freebayes -f reference.fna -b alignment.sorted.bam > output/result.vcf
    echo "OK"
fi
