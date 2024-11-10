# bioinformatics-2
1. E. Coli SRR31294323: https://www.ncbi.nlm.nih.gov/sra/SRX26673257[accn]
```bash
wget -O SRR31294323.fastq https://trace.ncbi.nlm.nih.gov/Traces/sra-reads-be/fastq?acc=SRR31294323
```
3. Скачал референс
```bash
curl "https://api.ncbi.nlm.nih.gov/datasets/v2/genome/accession/GCF_000005845.2/download?include_annotation_type=GENOME_FASTA&include_annotation_type=GENOME_GFF&include_annotation_type=RNA_FASTA&include_annotation_type=CDS_FASTA&include_annotation_type=PROT_FASTA&include_annotation_type=SEQUENCE_REPORT&hydrated=FULLY_HYDRATED" --output reference
```
4. Установил bwa, FastQC, samtools
