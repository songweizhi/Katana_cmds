
##########################################################################################
################################# install BLCA on Katana #################################
##########################################################################################

module load python/3.7.3
mkdir ~/mypython3env
python3 -m venv --system-site-packages ~/mypython3env
source ~/mypython3env/bin/activate
pip3 install --upgrade BioSAK

# Download BLCA scripts to Katana (change zID to yours)
cd /srv/scratch/z5039045/Softwares
git clone https://github.com/qunfengdong/BLCA.git




##########################################################################################
############################# prepare GTDB SSU database (r95) ############################
##########################################################################################

###################### on Katana ######################

# download GTDB SSU sequences
cd /srv/scratch/z5039045/Softwares/BLCA/db_GTDB_SSU
wget https://data.gtdb.ecogenomic.org/releases/release95/95.0/genomic_files_all/ssu_all_r95.tar.gz
tar xvzf ssu_all_r95.tar.gz

# format downloaded sequences with BioSAK
module load python/3.7.3
source ~/mypython3env/bin/activate
BioSAK GTDB_for_BLCA -GTDB_ssu ssu_all_r95.fna
# output files:
# ssu_all_r95_BLCAparsed.fasta
# ssu_all_r95_BLCAparsed.taxonomy

# make blast db with formatted sequences
module load blast+/2.9.0
makeblastdb -in ssu_all_r95_BLCAparsed.fasta -dbtype nucl -parse_seqids -out ssu_all_r95_BLCAparsed.fasta


###################### on MAC ######################

cd 00_DataNeeded/BLCA/db_GTDB_SSU

# download ssu_all_r95.tar.gz with wget
wget https://data.gtdb.ecogenomic.org/releases/release95/95.0/genomic_files_all/ssu_all_r95.tar.gz
# Note: if you don't have wget, you can manually download ssu_all_r95.tar.gz and move it to the db_GTDB_SSU folder. 
# https://data.gtdb.ecogenomic.org/releases/release95/95.0/genomic_files_all/ssu_all_r95.tar.gz

# decompress ssu_all_r95.tar.gz
tar xvzf ssu_all_r95.tar.gz

# make the format of ssu_all_r95.fna compatible with BLCA using BioSAK
# Note: you can install BioSAK with "pip3 install BioSAK"
BioSAK GTDB_for_BLCA -GTDB_ssu ssu_all_r95.fna
# output files:
# ssu_all_r95_BLCAparsed.fasta
# ssu_all_r95_BLCAparsed.taxonomy

# make blast db
makeblastdb -in ssu_all_r95_BLCAparsed.fasta -dbtype nucl -parse_seqids -out ssu_all_r95_BLCAparsed.fasta


##########################################################################################
########################### run BLCA against GTDB SSU database ##########################
##########################################################################################

###################### on Katana ######################

module load python/3.7.3
source ~/mypython3env_BLCA/bin/activate
module load blast+/2.9.0
module load muscle/3.8.31
module load clustalo/1.2.4
cd /srv/scratch/z5039045/MarkerMAG_wd/Kelp/BH_ER_050417_Matam16S_wd
python3 /srv/scratch/z5039045/Softwares/BLCA/2.blca_main.py -r /srv/scratch/z5039045/Softwares/BLCA/db_GTDB_SSU/ssu_all_r95_BLCAparsed.taxonomy -q /srv/scratch/z5039045/Softwares/BLCA/db_GTDB_SSU/ssu_all_r95_BLCAparsed.fasta -i BH_ER_050417_assembled_16S_uclust_0.999.fasta


###################### on MAC ######################

python3 00_DataNeeded/BLCA/2.blca_main.py -r 00_DataNeeded/BLCA/db_GTDB_SSU/ssu_all_r95_BLCAparsed.taxonomy -q 00_DataNeeded/BLCA/db_GTDB_SSU/ssu_all_r95_BLCAparsed.fasta -i 10_UchimeReferenceGTDB/zOTU_nc.fasta -o 12_TaxAssignmentGTDB_BLCA/AllSamples_unoise_BLCA_out.1.txt

