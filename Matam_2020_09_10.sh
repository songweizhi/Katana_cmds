
############################### prepare SILVA SSU database ###############################

cd /srv/scratch/z5039045/DB/SILVA
wget https://www.arb-silva.de/fileadmin/silva_databases/release_138_1/Exports/README.txt

# wget https://www.arb-silva.de/fileadmin/silva_databases/release_138_1/Exports/SILVA_138.1_SSURef_tax_silva.fasta.gz
# gunzip SILVA_138.1_SSURef_tax_silva.fasta.gz

wget https://www.arb-silva.de/fileadmin/silva_databases/release_138_1/Exports/SILVA_138.1_SSURef_NR99_tax_silva.fasta.gz
gunzip SILVA_138.1_SSURef_NR99_tax_silva.fasta.gz


module load python/3.6.5
module load java/7u51
module load gcc/8.4.0
module load sparsehash/2.0.3
module load matam/1.5.3
module load samtools/1.9
export PATH=/home/z5039045/anaconda3/bin:$PATH
cd /srv/scratch/z5039045/DB/SILVA
# matam_db_preprocessing.py --clustering_id_threshold 0.99 --max_memory 30000 --cpu 12 -v -i SILVA_138.1_SSURef_tax_silva.fasta -d SILVA_138_1_SSURef_99 --out_db_name SILVA_138_1_SSURef_99
matam_db_preprocessing.py --clustering_id_threshold 0.99 --max_memory 30000 --cpu 12 -v -i SILVA_138.1_SSURef_NR99_tax_silva.fasta -d SILVA_138_1_SSURef_NR99_99 --out_db_name SILVA_138_1_SSURef_NR99_99

-d /srv/scratch/z5039045/DB/SILVA/SILVA_138_1_SSURef_NR99_99


######################################## run Matam #######################################

module load python/3.6.5
module load java/7u51
module load gcc/8.4.0
module load sparsehash/2.0.3
module load matam/1.5.3
module load samtools/1.9
export PATH=/home/z5039045/anaconda3/bin:$PATH
cd /srv/scratch/z5039045/MarkerMAG_wd/MBARC26/MBARC26_Matam16S_wd/test_Matam

# with SILVA_128_SSURef_NR95
matam_assembly.py -i MBARC26_subsample_10.fasta -o MBARC26_128_NR95 --cpu 12 --max_memory 100000 -v --filter_only -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95

# with SILVA_138.1_SSURef_NR99
matam_assembly.py -i MBARC26_subsample_10.fasta -o MBARC26_138_NR99 --cpu 12 --max_memory 100000 -v --filter_only -d /srv/scratch/z5039045/DB/SILVA/SILVA_138_1_SSURef_NR99_99/SILVA_138.1_SSURef_NR99_tax_silva_NR99




##########################################################################################



module load python/3.6.5
module load java/7u51
module load gcc/8.4.0
module load sparsehash/2.0.3
module load matam/1.5.3
module load samtools/1.9
export PATH=/home/z5039045/anaconda3/bin:$PATH


# index the database:
python3 /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/bin/index_default_ssu_rrna_db.py -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95


# Running de-novo assembly
cd /srv/scratch/z5039045/link_16S_MAG/test_matam/16sp_simulated_dataset
python3 /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/bin/matam_assembly.py -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95 -i 16sp.art_HS25_pe_100bp_50x.fq --cpu 6 --max_memory 100000 -v -o Test_matam


cd /srv/scratch/z5039045/test_matam
/srv/scratch/z5039045/Softwares/seqtk/seqtk mergepe CB_ER_141216_R1.fasta CB_ER_141216_R2.fasta > CB_ER_141216_R12.fasta
python3 /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/bin/matam_assembly.py -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95 -i CB_ER_141216_R12.fasta --cpu 6 --max_memory 100000 -v -o Test_matam


cd /srv/scratch/z5039045/test_matam
/srv/scratch/z5039045/Softwares/seqtk/seqtk mergepe MBARC26_R1_0.05.fasta MBARC26_R2_0.05.fasta > MBARC26_R12_0.05.fasta
python3 /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/bin/matam_assembly.py -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95 -i MBARC26_R12_0.05.fasta --cpu 12 --max_memory 100000 -v -o MBARC26_default


matam_assembly.py -i MBARC26_R12_0.05.fasta -o MBARC26_default --cpu 12 --max_memory 100000 -v -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95
matam_assembly.py -i MBARC26_R12_0.05.fasta -o MBARC26_filter_only --cpu 12 --max_memory 100000 -v --filter_only -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95




##########################################################################################

module load python/3.6.5
module load java/7u51
module load gcc/8.4.0
module load sparsehash/2.0.3
module load matam/1.5.3
module load samtools/1.9
export PATH=/home/z5039045/anaconda3/bin:$PATH
cd /srv/scratch/z5039045/MarkerMAG_wd/MBARC26/MBARC26_Matam16S_wd/test_Matam

# with SILVA_128_SSURef_NR95
matam_assembly.py -i MBARC26_subsample_10.fasta -o MBARC26_filter_only --cpu 12 --max_memory 100000 -v --filter_only -d /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95








cd /srv/scratch/z5039045/DB/SILVA
wget https://www.arb-silva.de/fileadmin/silva_databases/release_138_1/Exports/README.txt
wget https://www.arb-silva.de/fileadmin/silva_databases/release_138_1/Exports/SILVA_138.1_SSURef_tax_silva.fasta.gz
wget https://www.arb-silva.de/fileadmin/silva_databases/release_138_1/Exports/SILVA_138.1_SSURef_NR99_tax_silva.fasta.gz
gunzip SILVA_138.1_SSURef_tax_silva.fasta.gz
gunzip SILVA_138.1_SSURef_NR99_tax_silva.fasta.gz


matam_db_preprocessing.py -i ref_db.fasta -d $DBDIR --cpu 4 --max_memory 10000 -v



