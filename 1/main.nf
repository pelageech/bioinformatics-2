process getFastq {
    output:
    path 'SRR31294323.fastq', emit: fastq
    path '*_fastqc.{zip,html}', emit: fastqc_results

    """
    wget -O SRR31294323.fastq.gz https://trace.ncbi.nlm.nih.gov/Traces/sra-reads-be/fastq?acc=SRR31294323
    gunzip SRR31294323.fastq.gz
    fastqc SRR31294323.fastq
    """
}

process getReference {
    output:
    path 'reference.fna'

    """
    wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz
    mv GCF_000005845.2_ASM584v2_genomic.fna.gz reference.fna.gz
    gunzip reference.fna.gz
    """
}

process minimapProcess {
    publishDir 'output', mode: 'copy'

    input:
    path fastq
    path reference

    output:
    path 'alignment.sam'
    path 'reference.mmi'

    """
    minimap2 -d reference.mmi $reference
    minimap2 -a reference.mmi $fastq > alignment.sam
    """
}

process samtoolsView {
    publishDir 'output', mode: 'copy'

    input:
    path sam

    output:
    path 'alignment.bam'

    """
    samtools view -bS $sam > alignment.bam
    """
}

process samtoolsFlagstat {
    publishDir 'output', mode: 'copy'

    input:
    path bam

    output:
    path 'samtools_result.txt'

    """
    samtools flagstat $bam > samtools_result.txt
    """
}

process parsePercent {
    publishDir '.', mode: 'copy'

    input:
    path stats

    output:
    path 'percent.txt'

    """
    echo 'grep "[0-9] mapped (" \$1 | sed "s/^.*mapped/mapped/" | tr -d -c "0-9."' > parse.sh
    chmod +x parse.sh
    ./parse.sh $stats > percent.txt
    """
}

process handleResults {
    publishDir 'results', mode: 'copy'

    input:
    path percentTxt
    path bam
    path reference

    output:
    path 'result.vcf' optional true

    """
    mkdir -p results
    value=\$(cat $percentTxt)
    if (( \$(echo "\$value < 90" | bc -l) )); then
        echo "Not OK"
    else
        samtools sort $bam > alignment.sorted.bam
        freebayes -f $reference -b alignment.sorted.bam > result.vcf
    fi
    """
}

workflow {
    // Получение данных
    fastq_ch = getFastq()
    reference_ch = getReference()

    // Обработка minimap2
    minimap_results = minimapProcess(fastq_ch.fastq, reference_ch)

    // Samtools обработка
    bam = samtoolsView(minimap_results[0])
    stats = samtoolsFlagstat(bam)

    // Парсинг результатов
    percent = parsePercent(stats)

    // Финальная обработка
    handleResults(percent, bam, reference_ch)
}
