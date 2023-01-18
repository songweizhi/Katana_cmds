
# install with 
conda create -n CoverM_env -c bioconda coverm

# To activate the environment    
conda activate CoverM_env

# To deactivate the environment
conda deactivate

# run coverm 
conda activate CoverM_env
coverm genome -m relative_abundance --single
coverm genome -m relative_abundance -b  -d -x fa
coverm genome --bam-files my.bam --genome-fasta-directory genomes_directory/
