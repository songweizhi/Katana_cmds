
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
rm -r Tara_NM_dRep99_wd
dRep dereplicate Tara_NM_dRep99_wd -g Tara_NM/*.fa -pa 0.9 -sa 0.99 --genomeInfo Tara_NM_CheckM_0.4_0.05.csv -comp 50 -p 12


cd /srv/scratch/z5039045/chloroflexi_genome/drep_test
dRep dereplicate Test_dRep99_wd -g genomes/*.fna -pa 0.9 -sa 0.99 --genomeInfo quality_checkm.txt -comp 50 -p 12
