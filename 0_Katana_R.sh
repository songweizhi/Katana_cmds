
# install R packages on Katana


mkdir ~/src


# you need to be on Katana head node
module load R/3.6.1
R
install.packages("BiocManager")  # you need to type a few "yes" during the installation.


# install downloaded R package
cd ~/src
wget https://cran.r-project.org/src/contrib/seqinr_4.2-8.tar.gz
module load R/3.5.3
R
install.packages("seqinr_4.2-8.tar.gz")  # you need to type a few "yes" during the installation.
