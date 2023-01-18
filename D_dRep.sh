
###################################### install dRep ######################################

# install drep
module load python/3.7.3
source ~/mypython3env/bin/activate
pip install drep
pip install --upgrade drep


######################################## run dRep ########################################

module load python/3.7.3
source ~/mypython3env/bin/activate
module load perl/5.28.0
module load prodigal/2.6.3
module load mash/2.1
module load gani/1
module load mummer/4.0.0.beta2 

# run the following command to see whether all dependencies correctly installed
dRep bonus output_directory --check_dependencies


# run dereplication
cd /srv/scratch/z5039045/MetaCHIP_Tara_NM
dRep dereplicate Tara_NM_dRep97_wd -g Tara_NM/*.fa -pa 0.9 -sa 0.97 --genomeInfo Tara_NM_CheckM_0.4_0.05.csv -comp 50 -p 12
dRep dereplicate Tara_NM_dRep99_wd -g Tara_NM/*.fa -pa 0.9 -sa 0.99 --genomeInfo Tara_NM_CheckM_0.4_0.05.csv -comp 50 -p 12


cd /srv/scratch/z5039045/chloroflexi_genome/drep_test
dRep dereplicate Test_dRep99_wd -g genomes/*.fna -pa 0.9 -sa 0.99 --genomeInfo quality_checkm.txt -comp 50 -p 12


cd /srv/scratch/z5039045/Adaptive_Nanopore/Chris_MAGs
dRep dereplicate All_MAGs_dRep97_wd -g all_together/*.fa -pa 0.9 -sa 0.97 --genomeInfo mag_info.txt -comp 50 -p 12
dRep dereplicate All_MAGs_dRep99_wd -g all_together/*.fa -pa 0.9 -sa 0.99 --genomeInfo mag_info.txt -comp 50 -p 12


# format of genome quality information
genome,completeness,contamination
Enterococcus_casseliflavus_EC20.fasta,98.28,0.0
Enterococcus_faecalis_T2.fna,98.28,0.0
Enterococcus_faecalis_TX0104.fa,96.55,0.0
Enterococcus_faecalis_YI6-1.fna,98.28,0.0
Escherichia_coli_Sakai.fna,100.0,0.0



