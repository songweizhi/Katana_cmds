
################################## install OMA on Katana #################################

cd /srv/scratch/z5039045/Softwares
wget -O oma.tgz https://omabrowser.org/standalone/OMA.2.5.0.tgz
# on MacOS you can also use curl: 
# curl https://omabrowser.org/standalone/OMA.2.5.0.tgz -o oma.tgz
tar xvzf oma.tgz
cd OMA.2.5.0
./install.sh /home/z5039045/software

# add "export PATH=$PATH:/home/z5039045/software/OMA/bin" to /home/z5039045/.bash_profile

######################################### run OMA ########################################

# get help info
OMA -h

# generate default parameter file
cd /srv/scratch/z5039045/Sponge_hologenome/OMA_wd
OMA -p
# then adjust parameters in the generated parameters.drw

# copy genomes to DB folder, The fasta files need to have a ".fa " extension.
mkdir /srv/scratch/z5039045/Sponge_hologenome/OMA_wd/DB
cd /srv/scratch/z5039045/Sponge_hologenome/OMA_wd/DB

# run OMA
OMA -n 12

# input files: 
# DB/
# parameters.drw

# output Files (https://omabrowser.org/standalone/)
# OrthologousGroups.txt		The groups of orthologs are given as one per row, starting with a unique group identifier, followed by all group members, all separated by tabs.
# OrthologousMatrix.txt		More compact version of OrthologousGroups.txt


##########################################################################################

# create working directory
mkdir myWorkingDir
cd myWorkingDir
# create DB directory in working directory
mkdir DB
# copy FASTA files into DB directory
cp /home/you/fasta/yourFirstGenomeFile.fa DB/
cp /home/you/fasta/yourSecondGenomeFile.fa DB/
cp /home/you/fasta/yourContigFile.contig.fa DB/
# generate default parameter file
OMA -p
# adjust parameters
vim parameters.drw
# run OMA
OMA -n 12

cd /srv/scratch/z5039045/Sponge_hologenome/2_Archaeal_tree_50_5/Nitrosopumilaceae_OMA_wd
OMA -n 12

cd /srv/scratch/z5039045/Sponge_hologenome/OMA_wd/test
OMA -n 12



