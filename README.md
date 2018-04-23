# RNASEQ_pipeline
This folder contains the pipelines needed for de novo assembly (Trinity), gene quantification and differential analysis (STAR/CUFFLINK, STAR/featureCounts/DESeq2)

Input files should be paired-end RNA-Seq data

#de novo assembly with Trinity

#For the sra files downloaded from European Sequence Archive, use the following command to convert to fastq

fastq-dump --defline-seq '@$sn[_$rn]/$ri' --split-files file.sra

#Run the following trinity commands:

./run_trinity


1) Gene quantification

Edit and run star_index to generate index for alignment

Edit and run star_mapping to generate mapping results

Edit and run run_map in Trinity output directory to extract IgG and TCR results


2) CUFFLINK quantification/differential analysis

Edit and run run_cuffquant for gene quantification

Edit and run run_cuffdiff for differential analysis

Edit and run run_fpkm in cuffdiff output directory to generate FPKM matrix

Edit group_DEG.txt and run DEG2.R to genearate cuffdiff result files


3) FeatureCounts quantification & DESeq2 differential analysis

Edit and run run_ftcounts for gene count quantification

Edit and run DESeq2.R for differential analysis

Edit and run run_ftseq_combine to generate count matrix


4) KALLISTO & SLEUTH quantification & differential analysis
Edit and run run_kallisto_index to generate kallisto index

Edit and run run_kallisto for transcript quantification

Edit and run run_sleuth for differential analysis

