# bioinformatics-2
1. E. Coli SRR31294323: https://www.ncbi.nlm.nih.gov/sra/SRX26673257[accn]
```bash
wget -O SRR31294323.fastq https://trace.ncbi.nlm.nih.gov/Traces/sra-reads-be/fastq?acc=SRR31294323

ls -l # смотрим, что в нашей сумочке
# -rw-rw-r-- 1 artblaginin artblaginin 1740990720 Nov 10 10:22 SRR31294323.fastq
```
2. Скачал референс
```bash
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz
mv GCF_000005845.2_ASM584v2_genomic.fna.gz reference.fna.gz
gzip -d reference.fna.gz

ls -l
# -rw-rw-r-- 1 artblaginin artblaginin 1740990720 Nov 10 10:22 SRR31294323.fastq
# -rw-rw-r-- 1 artblaginin artblaginin    4199739 Nov 10 10:30 reference.fna
```
3. Установил minimap2, FastQC, samtools
   - minimap2
```bash
curl -L https://github.com/lh3/minimap2/releases/download/v2.28/minimap2-2.28_x64-linux.tar.bz2 | tar -jxvf -

sudo ln -s $(pwd)/minimap2-2.28_x64-linux/minimap2 /usr/local/bin/minimap2 # добавим в $PATH
```
4. FastQC проанализировал SRR31294323.fastq
```bash
fastqc SRR31294323.fastq
# ...
# Approx 90% complete for SRR31294323.fastq
# Approx 95% complete for SRR31294323.fastq
# Analysis complete for SRR31294323.fastq

ls -l
# total 1705256
# -rw-rw-r-- 1 artblaginin artblaginin 1740990720 Nov 10 10:22 SRR31294323.fastq
# -rw-rw-r-- 1 artblaginin artblaginin     601332 Nov 10 10:37 SRR31294323_fastqc.html
# -rw-rw-r-- 1 artblaginin artblaginin     377985 Nov 10 10:37 SRR31294323_fastqc.zip
# -rw-rw-r-- 1 artblaginin artblaginin    4199739 Nov 10 10:30 reference.fna
```
5. Индексирование референсного генома с помощью minimap2
```bash
mkdir output

minimap2 -d output/reference.mmi reference.fna

ls output
# reference.mmi
```
6. Выравнивание ридов на референсный геном
```bash
minimap2 -a output/reference.mmi SRR31294323.fastq > output/alignment.sam
samtools view -bS output/alignment.sam > output/alignment.bam
samtools flagstat output/alignment.bam > output/samtools_result.txt

echo 'grep "[0-9] mapped (" $1 | sed 's/^.*mapped/mapped/' | tr -d -c "0-9."' > parse.sh
chmod +x parse.sh
./parse.sh output/samtools_result.txt > final.txt

if (( $(echo "$(cat final.txt) < 90" | bc -l) )); then /
    echo "Not OK" /
else /
    samtools sort output/alignment.bam > alignment.sorted.bam /
    freebayes -f reference.fna -b alignment.sorted.bam > output/result.vcf /
    echo "OK" /
fi
```

### Nextflow
Установка
```bash
curl -s https://get.nextflow.io | bash
```

Hello world
```bash
nextflow run hello
```

Запуск скрипта
```bash
nextflow run ./main.nf -with-dag flowchart.png
```

Визуализация
![flowchart](https://github.com/user-attachments/assets/9c7c1f35-59eb-4342-a8f0-173c44b405f6)

