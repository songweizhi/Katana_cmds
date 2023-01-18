
################################ setup metaWRAP (python2) ################################

# download metaWRAP
cd /srv/scratch/z5039045/Softwares
git clone https://github.com/bxlab/metaWRAP.git
export PATH=/srv/scratch/z5039045/Softwares/metaWRAP/bin/:$PATH

############################# run metaWRAP (bin_refinement) ##############################

module unload python
module load python/2.7.15
module load hmmer/3.3
module load pplacer/1.1.alpha19
module load prodigal/2.6.3
module load R/3.4.2
module load pullseq/1.0.2
module load ruby/2.3.7
module load blast+/2.11.0
export PATH=/srv/scratch/z5039045/Softwares/metaWRAP/bin/:$PATH

cd /srv/scratch/z5039045/BH_ER_050417_mag_folder

# refine two bin sets
metawrap bin_refinement -o MetaWRAP_refinement_wd -t 12 -c 50 -x 5 -A MetaBAT_MAGs -B MyCC_MAGs

# refine three bin sets
metawrap bin_refinement -o MetaWRAP_refinement_wd -t 12 -c 50 -x 5 -A MetaBAT_MAGs -B MyCC_MAGs -C CONCOCT_MAGs


# if you see errors that say "OSError: Device or resource busy", please don't worry, it does not seem to affect CheckM performance.
# https://github.com/bxlab/metaWRAP/issues/48

# I also saw errors like "mv: cannot stat ...", these errors are related to the moving or deleting of files.
# seems not a big issue as metawrap reported that "BIN_REFINEMENT PIPELINE FINISHED SUCCESSFULLY", 
# and we did get refined bins in the final output folder
# https://github.com/bxlab/metaWRAP/issues/253


############################# run metaWRAP (reassemble_bins) #############################

metawrap reassemble_bins -h






############################# setup metaWRAP (python2) (test) ############################

cd /srv/scratch/zID
git clone https://github.com/bxlab/metaWRAP.git
# Carefully configure the /srv/scratch/zID/metaWRAP/bin/config-metawrap file to it points to your desired database locations
# add "PATH=/srv/scratch/zID/metaWRAP/bin/:$PATH" to file "/home/zID/.bash_profile"

module load python/2.7.15
conda create -y -n env_metaWRAP python=2.7
conda activate env_metaWRAP
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda
conda config --add channels ursky
conda install --only-deps -c ursky metawrap-mg



# to run metaWRAP:
conda activate env_metaWRAP
metawrap -h

