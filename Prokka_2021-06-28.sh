#################### Prokka #################### 

module load perl/5.28.0
module load infernal/1.1.2 
module load blast+/2.9.0 
module load hmmer/3.3
module load prodigal/2.6.3
module load tbl2asn/20200706
module load parallel/20200722 
module load aragorn/1.2.38 
module load bedtools/2.27.1
module load barrnap/0.9 
module load prokka/1.14.5
cd /srv/scratch/z5039045/MetaCHIP/Demo/NS_18bins


# predict coding sequences from Bacterial MAGs
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix NorthSea_bin006 --locustag NorthSea_bin006 --strain NorthSea_bin006 --outdir NorthSea_bin006_prokka_wd NorthSea_bin006.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix NorthSea_bin026 --locustag NorthSea_bin026 --strain NorthSea_bin026 --outdir NorthSea_bin026_prokka_wd NorthSea_bin026.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix NorthSea_bin046 --locustag NorthSea_bin046 --strain NorthSea_bin046 --outdir NorthSea_bin046_prokka_wd NorthSea_bin046.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix NorthSea_bin046 --locustag NorthSea_bin046 --strain NorthSea_bin046 --outdir NorthSea_bin046_prokka_wd NorthSea_bin046.fasta
prokka --force --compliant --cpus 12 --kingdom Bacteria --prefix contig_2560 --locustag contig_2560 --strain contig_2560 --outdir contig_2560_prokka_wd contig_2560.fa


# predict coding sequences from Archaeal MAGs
prokka --force --compliant --cpus 12 --kingdom Archaea --prefix NorthSea_bin012 --locustag NorthSea_bin012 --strain NorthSea_bin012 --outdir NorthSea_bin012_prokka_wd NorthSea_bin012.fasta
prokka --force --compliant --cpus 12 --kingdom Archaea --prefix NorthSea_bin022 --locustag NorthSea_bin022 --strain NorthSea_bin022 --outdir NorthSea_bin022_prokka_wd NorthSea_bin022.fasta


cd /srv/scratch/z5039045/Adaptive_Nanopore/binning/0_get_sequencing_refs
prokka --cpus 12 --outdir to_sequence_prokka_wd to_sequence.fasta

prokka --cpus 12 --locustag bin_1 --outdir bin_1_prokka_wd bin.1.fa
prokka --cpus 12 --locustag bin_2 --outdir bin_2_prokka_wd bin.2.fa
prokka --cpus 12 --locustag bin_3 --outdir bin_3_prokka_wd bin.3.fa
prokka --cpus 12 --locustag bin_4 --outdir bin_4_prokka_wd bin.4.fa
prokka --cpus 12 --locustag bin_5 --outdir bin_5_prokka_wd bin.5.fa
prokka --cpus 12 --locustag bin_6 --outdir bin_6_prokka_wd bin.6.fa
prokka --cpus 12 --locustag bin_7 --outdir bin_7_prokka_wd bin.7.fa
prokka --cpus 12 --locustag bin_8 --outdir bin_8_prokka_wd bin.8.fa
prokka --cpus 12 --locustag bin_9 --outdir bin_9_prokka_wd bin.9.fa
prokka --cpus 12 --locustag bin_10 --outdir bin_10_prokka_wd bin.10.fa



BioSAK rename_seq -in Contigs.fa -prefix seawater


BioSAK rename_seq -in bin_1.faa -prefix bin_1
BioSAK rename_seq -in bin_2.faa -prefix bin_2
BioSAK rename_seq -in bin_3.faa -prefix bin_3
BioSAK rename_seq -in bin_4.faa -prefix bin_4
BioSAK rename_seq -in bin_5.faa -prefix bin_5
BioSAK rename_seq -in bin_6.faa -prefix bin_6
BioSAK rename_seq -in bin_7.faa -prefix bin_7
BioSAK rename_seq -in bin_8.faa -prefix bin_8
BioSAK rename_seq -in bin_9.faa -prefix bin_9
BioSAK rename_seq -in bin_10.faa -prefix bin_10



makeblastdb -in prefixed.faa -parse_seqids -dbtype prot
makeblastdb -in combined.faa -parse_seqids -dbtype prot


blastp -query ELP5.faa -db combined.faa -outfmt 6 -out a.tab

cd /srv/scratch/z5039045/Adaptive_Nanopore/binning/MetaWrap_NonEukaryota_MyCC_CONCOCT_MaxBin_20_10/metawrap_20_10_bins
prokka --cpus 12 --locustag bin_1 --outdir bin_1_prokka_wd bin.1.fa
prokka --cpus 12 --locustag bin_2 --outdir bin_2_prokka_wd bin.2.fa
prokka --cpus 12 --locustag bin_4 --outdir bin_4_prokka_wd bin.4.fa
prokka --cpus 12 --locustag bin_5 --outdir bin_5_prokka_wd bin.5.fa
prokka --cpus 12 --locustag bin_6 --outdir bin_6_prokka_wd bin.6.fa
prokka --cpus 12 --locustag bin_7 --outdir bin_7_prokka_wd bin.7.fa
prokka --cpus 12 --locustag bin_8 --outdir bin_8_prokka_wd bin.8.fa
prokka --cpus 12 --locustag bin_9 --outdir bin_9_prokka_wd bin.9.fa
prokka --cpus 12 --locustag bin_10 --outdir bin_10_prokka_wd bin.10.fa
prokka --cpus 12 --locustag bin_11 --outdir bin_11_prokka_wd bin.11.fa
prokka --cpus 12 --locustag bin_12 --outdir bin_12_prokka_wd bin.12.fa
prokka --cpus 12 --locustag bin_13 --outdir bin_13_prokka_wd bin.13.fa
prokka --cpus 12 --locustag bin_14 --outdir bin_14_prokka_wd bin.14.fa
prokka --cpus 12 --locustag bin_15 --outdir bin_15_prokka_wd bin.15.fa
prokka --cpus 12 --locustag bin_16 --outdir bin_16_prokka_wd bin.16.fa
prokka --cpus 12 --locustag bin_17 --outdir bin_17_prokka_wd bin.17.fa
prokka --cpus 12 --locustag bin_18 --outdir bin_18_prokka_wd bin.18.fa
prokka --cpus 12 --locustag bin_19 --outdir bin_19_prokka_wd bin.19.fa
prokka --cpus 12 --locustag bin_20 --outdir bin_20_prokka_wd bin.20.fa
prokka --cpus 12 --locustag bin_21 --outdir bin_21_prokka_wd bin.21.fa
prokka --cpus 12 --locustag bin_22 --outdir bin_22_prokka_wd bin.22.fa
prokka --cpus 12 --locustag bin_23 --outdir bin_23_prokka_wd bin.23.fa
prokka --cpus 12 --locustag bin_24 --outdir bin_24_prokka_wd bin.24.fa
prokka --cpus 12 --locustag bin_25 --outdir bin_25_prokka_wd bin.25.fa
prokka --cpus 12 --locustag bin_26 --outdir bin_26_prokka_wd bin.26.fa



