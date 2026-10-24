# Load required packages
#install.packages("BiocManager")
#BiocManager::install("Biostrings")

#sudo apt-get update
#sudo apt-get install build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev
#install.packages("Rcpp")
#update.packages(ask = FALSE)
#Sys.setenv("CXXFLAGS"="-Wno-format-security")
#BiocManager::install("alakazam")


library(alakazam)
library(dplyr)
library(scales)
library (airr)
library(RColorBrewer)

# Load data file

D1160_H_G1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_H_G1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_H_G2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_H_G2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_H_M1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_H_M1_S/FIN_collapse-unique_igblast_db-pass.tsv")
D1160_H_M2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_H_M2_S/FIN_collapse-unique_igblast_db-pass.tsv")
D1160_K_1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_K_1_S2/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_K_2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_K_2_S3/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_L_1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_L_1_S2/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_L_2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_L_2_S3/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1248_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1248_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv")
D1248p_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv")
D1248p_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_H_G1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_G1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_H_G2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_G2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_M1_S/FIN_collapse-unique_igblast_db-pass.tsv")
D2201_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_M2_S/FIN_collapse-unique_igblast_db-pass.tsv")
D2201_K_1_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_K_1_S1/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_K_2_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_K_2_S1/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_L_1_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_L_1_S1/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_L_2_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_L_2_S1/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_H_G1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_G1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_H_G2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_G2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_H_M1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_M1_S/FIN_collapse-unique_igblast_db-pass.tsv")
D2211_H_M2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_M2_S/FIN_collapse-unique_igblast_db-pass.tsv")
D2211_K_1_S3 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_K_1_S3/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_K_2_S7 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_K_2_S7/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_L_1_S4 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_L_1_S4/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_L_2_S8 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_L_2_S8/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D268p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D268p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D272p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D272p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D442p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")

D442p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D946p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D946p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D946p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


#Run 1

D2032_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2032_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2032_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D208_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D208_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2136_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2136_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D442_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D442_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

#0972024
D198_H_G1_in <- read_rearrangement ("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D198_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D198_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D198_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


D198p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D198p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D198p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2350_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2350_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2350_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D946_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D946_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D946_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


######################################################################################################################################
#19112024
D2257_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2257_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2257_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2262_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2262_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D268a_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D268a_K_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_K_1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_K_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_K_2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_L_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_L_1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_L_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_L_2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D268b_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D268b_K_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_K_1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_K_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_K_2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_L_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_L_1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_L_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_L_2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

##################################################################################################
D2257c_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv")
D2257c_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv")
D2257c_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D198ba_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv")
D198ba_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv")
D198ba_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


D272aa_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv")
D272aa_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv")
D272aa_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


D272ba_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv")
D272ba_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv")
D272ba_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script



#21112024

D1160p_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv")
D1160p_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv")

D093_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D093_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D093_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D1210_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_H_M1_i<- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1210_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1210_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2255_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2255_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2255_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


D2215_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2215_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2215_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2542_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2542_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2542_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2539_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2539_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2539_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2331_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2331_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2331_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2136c_H_G1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_H_G2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv")
D2136c_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv")
D2136c_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


###################################################################################################
# Define the base directory
base_dir <- "/mnt/data/B_cell_repertoire/Post"

# List all folder names in the base directory
folders <- character(0)  # rerun: disabled, would re-read old partial tables from Post/

# Define the target file name in each folder
file_name <- "FIN_collapse-unique_igblast_db-pass.tsv"

# Create a function to read the files
read_files <- function(folder) {
  file_path <- file.path(folder, file_name) # Construct the full file path
  if (file.exists(file_path)) {            # Check if the file exists
    read_rearrangement(file_path)          # Read the file
  } else {
    warning(paste("File not found in folder:", folder)) # Handle missing files
    return(NULL)
  }
}



# Function to sanitize folder names
sanitize_name <- function(name) {
  gsub("[-.]", "_", name) # Replace hyphens and dots with underscores
}

# Read files and assign them directly as variables
for (folder in folders) {
  folder_name <- basename(folder)         # Extract the folder name
  sanitized_name <- sanitize_name(folder_name) # Sanitize the name
  data <- read_files(folder)              # Read the file
  if (!is.null(data)) {
    assign(sanitized_name, data)          # Assign the data frame to a variable
  }
}


###################################################################################################
#Combine 
###################################################################################################
# sample 1
D2032_H_M1_i$aliquot <- "R1"
D2032_H_M2_i$aliquot <- "R2"
D2032_H_M <- rbind(D2032_H_M1_i, D2032_H_M2_i)
D2032_H_M$sample <- "D2032_H_M"
rm(D2032_H_M1_i, D2032_H_M2_i)

# sample 2
D208_H_M1_in$aliquot <- "R1"
D208_H_M2_in$aliquot <- "R2"
D208_H_M <- rbind(D208_H_M1_in, D208_H_M2_in)
D208_H_M$sample <- "D208_H_M"
rm(D208_H_M1_in, D208_H_M2_in)

# sample 3
D2136_H_M1_i$aliquot <- "R1"
D2136_H_M2_i$aliquot <- "R2"
D2136_H_M <- rbind(D2136_H_M1_i, D2136_H_M2_i)
D2136_H_M$sample <- "D2136_H_M"
rm(D2136_H_M1_i, D2136_H_M2_i)

# sample 4
D442_H_M1_in$aliquot <- "R1"
D442_H_M2_in$aliquot <- "R2"
D442_H_M <- rbind(D442_H_M1_in, D442_H_M2_in)
D442_H_M$sample <- "D442_H_M"
rm(D442_H_M1_in, D442_H_M2_in)

# sample 5
D1160_H_M1_S$aliquot <- "R1"
D1160_H_M2_S$aliquot <- "R2"
D1160_H_M <- rbind(D1160_H_M1_S, D1160_H_M2_S)
D1160_H_M$sample <- "D1160_H_M"
rm(D1160_H_M1_S, D1160_H_M2_S)

# sample 6
D1248_H_M1_i$aliquot <- "R1"
D1248_H_M2_i$aliquot <- "R2"
D1248_H_M <- rbind(D1248_H_M1_i, D1248_H_M2_i)
D1248_H_M$sample <- "D1248_H_M"
rm(D1248_H_M1_i, D1248_H_M2_i)

# sample 7
D1248p_H_M1$aliquot <- "R1"
D1248p_H_M2$aliquot <- "R2"
D1248p_H_M <- rbind(D1248p_H_M1, D1248p_H_M2)
D1248p_H_M$sample <- "D1248p_H_M"
rm(D1248p_H_M1, D1248p_H_M2)

# sample 8
D2201_H_M1$aliquot <- "R1"
D2201_H_M2$aliquot <- "R2"
D2201_H_M <- rbind(D2201_H_M1, D2201_H_M2)
D2201_H_M$sample <- "D2201_H_M"
rm(D2201_H_M1, D2201_H_M2)

# sample 9
D2211_H_M1_S$aliquot <- "R1"
D2211_H_M2_S$aliquot <- "R2"
D2211_H_M <- rbind(D2211_H_M1_S, D2211_H_M2_S)
D2211_H_M$sample <- "D2211_H_M"
rm(D2211_H_M1_S, D2211_H_M2_S)

# sample 10
D268p_H_M1_i$aliquot <- "R1"
D268p_H_M2_i$aliquot <- "R2"
D268p_H_M <- rbind(D268p_H_M1_i, D268p_H_M2_i)
D268p_H_M$sample <- "D268p_H_M"
rm(D268p_H_M1_i, D268p_H_M2_i)

# sample 11
D272p_H_M1_i$aliquot <- "R1"
D272p_H_M2_i$aliquot <- "R2"
D272p_H_M <- rbind(D272p_H_M1_i, D272p_H_M2_i)
D272p_H_M$sample <- "D272p_H_M"
rm(D272p_H_M1_i, D272p_H_M2_i)

# sample 12
D442p_H_M1_i$aliquot <- "R1"
D442p_H_M2_i$aliquot <- "R2"
D442p_H_M <- rbind(D442p_H_M1_i, D442p_H_M2_i)
D442p_H_M$sample <- "D442p_H_M"
rm(D442p_H_M1_i, D442p_H_M2_i)

# sample 13
D946p_H_M1_i$aliquot <- "R1"
D946p_H_M2_i$aliquot <- "R2"
D946p_H_M <- rbind(D946p_H_M1_i, D946p_H_M2_i)
D946p_H_M$sample <- "D946p_H_M"
rm(D946p_H_M1_i, D946p_H_M2_i)

# sample 14
D1160p_H_M1$aliquot <- "R1"
D1160p_H_M2$aliquot <- "R2"
D1160p_H_M <- rbind(D1160p_H_M1, D1160p_H_M2)
D1160p_H_M$sample <- "D1160p_H_M"
rm(D1160p_H_M1, D1160p_H_M2)

# sample 15
D198_H_M1_in$aliquot <- "R1"
D198_H_M2_in$aliquot <- "R2"
D198_H_M <- rbind(D198_H_M1_in, D198_H_M2_in)
D198_H_M$sample <- "D198_H_M"
rm(D198_H_M1_in, D198_H_M2_in)

# sample 16
D198p_H_M1_i$aliquot <- "R1"
D198p_H_M2_i$aliquot <- "R2"
D198p_H_M <- rbind(D198p_H_M1_i, D198p_H_M2_i)
D198p_H_M$sample <- "D198p_H_M"
rm(D198p_H_M1_i, D198p_H_M2_i)

# sample 17
D2350_H_M1_i$aliquot <- "R1"
D2350_H_M2_i$aliquot <- "R2"
D2350_H_M <- rbind(D2350_H_M1_i, D2350_H_M2_i)
D2350_H_M$sample <- "D2350_H_M"
rm(D2350_H_M1_i, D2350_H_M2_i)

# sample 18
D946_H_M1_in$aliquot <- "R1"
D946_H_M2_in$aliquot <- "R2"
D946_H_M <- rbind(D946_H_M1_in, D946_H_M2_in)
D946_H_M$sample <- "D946_H_M"
rm(D946_H_M1_in, D946_H_M2_in)

# sample 19
D2257_H_M1_i$aliquot <- "R1"
D2257_H_M2_i$aliquot <- "R2"
D2257_H_M <- rbind(D2257_H_M1_i, D2257_H_M2_i)
D2257_H_M$sample <- "D2257_H_M"
rm(D2257_H_M1_i, D2257_H_M2_i)

# sample 20
D2262_H_M1_i$aliquot <- "R1"
D2262_H_M2_i$aliquot <- "R2"
D2262_H_M <- rbind(D2262_H_M1_i, D2262_H_M2_i)
D2262_H_M$sample <- "D2262_H_M"
rm(D2262_H_M1_i, D2262_H_M2_i)

# sample 21
D268a_H_M1_i$aliquot <- "R1"
D268a_H_M2_i$aliquot <- "R2"
D268a_H_M <- rbind(D268a_H_M1_i, D268a_H_M2_i)
D268a_H_M$sample <- "D268a_H_M"
rm(D268a_H_M1_i, D268a_H_M2_i)

# sample 22
D268b_H_M1_i$aliquot <- "R1"
D268b_H_M2_i$aliquot <- "R2"
D268b_H_M <- rbind(D268b_H_M1_i, D268b_H_M2_i)
D268b_H_M$sample <- "D268b_H_M"
rm(D268b_H_M1_i, D268b_H_M2_i)

# sample 23
D198ba_H_M1_$aliquot <- "R1"
D198ba_H_M2_$aliquot <- "R2"
D198ba_H_M <- rbind(D198ba_H_M1_, D198ba_H_M2_)
D198ba_H_M$sample <- "D198ba_H_M"
rm(D198ba_H_M1_, D198ba_H_M2_)

# sample 24
D2257c_H_M1_$aliquot <- "R1"
D2257c_H_M2_$aliquot <- "R2"
D2257c_H_M <- rbind(D2257c_H_M1_, D2257c_H_M2_)
D2257c_H_M$sample <- "D2257c_H_M"
rm(D2257c_H_M1_, D2257c_H_M2_)

# sample 25
D272aa_H_M1_$aliquot <- "R1"
D272aa_H_M2_$aliquot <- "R2"
D272aa_H_M <- rbind(D272aa_H_M1_, D272aa_H_M2_)
D272aa_H_M$sample <- "D272aa_H_M"
rm(D272aa_H_M1_, D272aa_H_M2_)

# sample 26
D272ba_H_M1_$aliquot <- "R1"
D272ba_H_M2_$aliquot <- "R2"
D272ba_H_M <- rbind(D272ba_H_M1_, D272ba_H_M2_)
D272ba_H_M$sample <- "D272ba_H_M"
rm(D272ba_H_M1_, D272ba_H_M2_)

# sample 27
D093_H_M1_in$aliquot <- "R1"
D093_H_M2_in$aliquot <- "R2"
D093_H_M <- rbind(D093_H_M1_in, D093_H_M2_in)
D093_H_M$sample <- "D093_H_M"
rm(D093_H_M1_in, D093_H_M2_in)

# sample 28
D1210_H_M1_i$aliquot <- "R1"
D1210_H_M2_i$aliquot <- "R2"
D1210_H_M <- rbind(D1210_H_M1_i, D1210_H_M2_i)
D1210_H_M$sample <- "D1210_H_M"
rm(D1210_H_M1_i, D1210_H_M2_i)

# sample 29
D2255_H_M1_i$aliquot <- "R1"
D2255_H_M2_i$aliquot <- "R2"
D2255_H_M <- rbind(D2255_H_M1_i, D2255_H_M2_i)
D2255_H_M$sample <- "D2255_H_M"
rm(D2255_H_M1_i, D2255_H_M2_i)

# sample 30
D2215_H_M1_i$aliquot <- "R1"
D2215_H_M2_i$aliquot <- "R2"
D2215_H_M <- rbind(D2215_H_M1_i, D2215_H_M2_i)
D2215_H_M$sample <- "D2215_H_M"
rm(D2215_H_M1_i, D2215_H_M2_i)

# sample 31
D2542_H_M1_i$aliquot <- "R1"
D2542_H_M2_i$aliquot <- "R2"
D2542_H_M <- rbind(D2542_H_M1_i, D2542_H_M2_i)
D2542_H_M$sample <- "D2542_H_M"
rm(D2542_H_M1_i, D2542_H_M2_i)

# sample 32
D2539_H_M1_i$aliquot <- "R1"
D2539_H_M2_i$aliquot <- "R2"
D2539_H_M <- rbind(D2539_H_M1_i, D2539_H_M2_i)
D2539_H_M$sample <- "D2539_H_M"
rm(D2539_H_M1_i, D2539_H_M2_i)

# sample 33
D2331_H_M1_i$aliquot <- "R1"
D2331_H_M2_i$aliquot <- "R2"
D2331_H_M <- rbind(D2331_H_M1_i, D2331_H_M2_i)
D2331_H_M$sample <- "D2331_H_M"
rm(D2331_H_M1_i, D2331_H_M2_i)

# sample 34
D2136c_H_M1$aliquot <- "R1"
D2136c_H_M2$aliquot <- "R2"
D2136c_H_M <- rbind(D2136c_H_M1, D2136c_H_M2)
D2136c_H_M$sample <- "D2136c_H_M"
rm(D2136c_H_M1, D2136c_H_M2)




week_1 <- rbind(D2032_H_M,D208_H_M,D2136_H_M,D442_H_M,D1160_H_M,
				D1248_H_M,D1248p_H_M,D2201_H_M,D2211_H_M,D268p_H_M,
				D272p_H_M,D442p_H_M,D946p_H_M,D1160p_H_M,D198_H_M,
				D198p_H_M,D2350_H_M,D946_H_M,D2257_H_M,D2262_H_M,
				D268a_H_M,D268b_H_M,D198ba_H_M,D2257c_H_M,D272aa_H_M,
				D272ba_H_M,D093_H_M,D1210_H_M,D2255_H_M,D2215_H_M,
				D2542_H_M,D2539_H_M,D2331_H_M,D2136c_H_M)
				

#write.csv(week_1, "Samples.csv", row.names = FALSE)


#Subset to only productive genes
table(week_1$productive)
table(week_1$locus)
week_1_prod <- subset (week_1, productive == TRUE)

write.csv(week_1_prod, "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/SamplesHM26112024.csv", row.names = FALSE)

#NB added

week_1_prod <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/SamplesHM26112024.csv")
table(week_1_prod$locus)
week_1_prod  <- subset(week_1_prod, locus == "IGH")  # rerun: original referred to object `a` from an interactive session

#1 Load the required libraries
library(ggplot2)
library(dplyr)
library(RColorBrewer)
library(cowplot)

#2 Read the data from the CSV file/family
#week_1_prod <- read.csv("week_1_prod_160224.csv", row.names = NULL, sep=',', header= TRUE)
#Samples_LK <- read.csv("Samples_16022024LK_.csv", row.names = NULL, sep=',', header= TRUE)
#Samples_LL <- read.csv("Samples_LL_160224.csv", row.names = NULL, sep=',', header= TRUE)

#3 Assigns Hiv Status column top the data

week_1_prod$Hiv_Status <- NA

#Samples_LL$Hiv_Status <- NA


unique(week_1_prod$sample)

#unique(Samples_LL$sample)

#5 Assign sample Hiv status for families files
#week_1_prod 
week_1_prod$Hiv_Status[week_1_prod$sample =="D2032_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2136_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2211_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2201_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D442p_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1160p_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1248p_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D946p_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D268p_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D272p_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D198p_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2350_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2215_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2542_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2539_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2331_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2255_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2262_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2257_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2136c_H_M"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2257c_H_M"] <- "HIV_negative"

week_1_prod$Hiv_Status[week_1_prod$sample =="D442_H_M"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1160_H_M"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1248_H_M"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1210_H_M"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D946_H_M"] <- "PLWH_early_treated"

week_1_prod$Hiv_Status[week_1_prod$sample =="D208_H_M"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D198_H_M"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D268a_H_M"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D093_H_M"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D272aa_H_M"] <- "PLWH_late_treated"

week_1_prod$Hiv_Status[week_1_prod$sample =="D268b_H_M"] <- "PRE_ART"
week_1_prod$Hiv_Status[week_1_prod$sample =="D272ba_H_M"] <- "PRE_ART"
week_1_prod$Hiv_Status[week_1_prod$sample =="D198ba_H_M"] <- "PRE_ART"


#################################################################################################
write.csv(week_1_prod, "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/SamplesHM26112024.csv", row.names = FALSE)
################################################################################################
#Gene family     
gene <- countGenes(week_1_prod, gene="v_call", groups="sample", mode="family")
gene1 <- countGenes(week_1_prod, gene="j_call", groups="sample", mode="family")
gene2 <- countGenes(week_1_prod, gene="d_call", groups="sample", mode="family")
################################################################################################
csvname <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/HM_V_family_f.csv",sep="")
csvname1 <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/HM_J_family_f.csv",sep="")
csvname2 <-  paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/HM_D_family_f.csv",sep="")
write.csv(gene, csvname, row.names = FALSE)
write.csv(gene1, csvname1, row.names = FALSE)
write.csv(gene2, csvname2, row.names = FALSE)
################################################################################################
#Gene Subfamily     
gene <- countGenes(week_1_prod, gene="v_call", groups="sample", mode="gene")
gene1 <- countGenes(week_1_prod, gene="j_call", groups="sample", mode="gene")
gene2 <- countGenes(week_1_prod, gene="d_call", groups="sample", mode="gene")
csvname <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/HM_V_Subfamily_f.csv",sep="")
csvname1 <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/HM_J_Subfamily_f.csv",sep="")
csvname2 <-  paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/HM_D_Subfamil_f.csv",sep="")
write.csv(gene, csvname, row.names = FALSE)
write.csv(gene1, csvname1, row.names = FALSE)
write.csv(gene2, csvname2, row.names = FALSE)
###################################################################################################
#Heavy Chain  VDJ
##############################################################################################################################################################
#2 Read the data from the CSV file/family

# Define the function to add HIV Status
add_hiv_status <- function(file_paths) {
  # Define the mapping for HIV Status
  hiv_status_mapping <- list(
    HIV_negative = c("D2032_H_M", "D2136_H_M", "D2211_H_M", "D2201_H_M", "D442p_H_M", 
                     "D1160p_H_M", "D1248p_H_M", "D946p_H_M", "D268p_H_M", "D272p_H_M", 
                     "D198p_H_M", "D2350_H_M", "D2215_H_M", "D2542_H_M", "D2539_H_M", 
                     "D2331_H_M", "D2255_H_M", "D2262_H_M", "D2257_H_M", "D2136c_H_M", "D2257c_H_M"),
    PLWH_early_treated = c("D442_H_M", "D1160_H_M", "D1248_H_M", "D1210_H_M", "D946_H_M"),
    PLWH_late_treated = c("D208_H_M", "D198_H_M", "D268a_H_M", "D093_H_M", "D272aa_H_M"),
    PRE_ART = c("D268b_H_M", "D272ba_H_M", "D198ba_H_M")
  )
  
  # Loop through each file path
  for (file_path in file_paths) {
    # Read the CSV file
    data <- read.csv(file_path, sep = ",", header = TRUE)
    
    # Check if the 'sample' column exists
    if (!"sample" %in% colnames(data)) {
      stop(paste("The 'sample' column is missing in", file_path))
    }
    
    # Add a new column for HIV Status
    data$Hiv_Status <- NA  # Initialize with NA
    
    # Assign HIV Status based on the mapping
    for (status in names(hiv_status_mapping)) {
      samples <- hiv_status_mapping[[status]]
      data$Hiv_Status[data$sample %in% samples] <- status
    }
    
    # Save the updated data back to the same file
    write.csv(data, file = file_path, row.names = FALSE)
  }
}

# List of file paths
file_paths <- c(
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M//HM_V_family_f.csv",
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M//HM_D_family_f.csv",
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M//HM_J_family_f.csv",
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M//HM_V_Subfamily_f.csv",
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M//HM_D_Subfamil_f.csv",
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M//HM_J_Subfamily_f.csv"
)

# Call the function
add_hiv_status(file_paths)




V_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/HM_V_family_f.csv", row.names = NULL, sep=',', header= TRUE)
D_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/HM_D_family_f.csv", row.names = NULL, sep=',', header= TRUE)
J_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/HM_J_family_f.csv", row.names = NULL, sep=',', header= TRUE)

#Gene 
Vg_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/HM_V_Subfamily_f.csv", row.names = NULL, sep=',', header= TRUE)
Dg_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/HM_D_Subfamil_f.csv", row.names = NULL, sep=',', header= TRUE)
Jg_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/HM_J_Subfamily_f.csv", row.names = NULL, sep=',', header= TRUE)



mycolors <- c(
  "HIV_negative" = "#00b09a",
  "PLWH_early_treated" = "#d55e00",
  "PLWH_late_treated" = "#9467bd",
  "PRE_ART" = "#56b4e9"
)



theme_Publication <- function(base_size = 14, base_family = "sans") {
  library(ggplot2)
  library(grid)
  library(ggthemes)
  
  theme_foundation(base_size = base_size, base_family = base_family) +
    theme(
      plot.title = element_text(face = "bold", size = rel(1.2), hjust = 0.5),
      text = element_text(),
      panel.background = element_rect(colour = NA),
      plot.background = element_rect(colour = NA),
      panel.border = element_rect(colour = NA),
      axis.title = element_text(face = "bold", size = rel(1)),
      axis.title.y = element_text(angle = 90, vjust = 2),
      axis.title.x = element_text(vjust = 0),
      axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),  # Align x-axis text with ticks
      axis.line = element_line(colour = "black"),
      axis.ticks = element_line(),
      panel.grid.major = element_line(colour = "#f0f0f0"),
      panel.grid.minor = element_blank(),
      legend.key = element_rect(colour = NA),
      legend.margin = margin(),
      legend.text = element_text(size = rel(0.8)),
      legend.title = element_text(face = "bold"),
      legend.position = "right"
    )
}


pacman::p_load(dplyr, ggplot2, ggthemes, grid, rstatix, ggpubr, rlang, glue)

## Significance
### Conduct statistical test and store in table
#stat.test <- V_call %>%
#  group_by(gene) %>%
#  wilcox_test(seq_freq ~ Hiv_Status, ref.group = "HIV_negative")
  
### Add positioning
#stat.test <- stat.test %>%
#  add_xy_position(x = "gene", dodge = 0.75)


# Load necessary libraries
library(pacman)
p_load(dplyr, ggplot2, ggthemes, grid, rstatix, ggpubr, rlang, glue)

# Violin plot with boxplot in the middle
v <- ggplot(V_call, aes(x = reorder(gene, -seq_freq), y = seq_freq, fill = Hiv_Status)) +
  geom_violin(alpha = 0.7, scale = "width", position = position_dodge(width = 0.75)) +  # Violin plot
  geom_jitter(aes(fill = Hiv_Status),  # Fill color based on Hiv_Status
              position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), 
              size = 1, alpha = 0.9, stroke = 0.1, shape = 21, color = "black") +  # Jitter placed before boxplot
  geom_boxplot(width = 0.2, position = position_dodge(width = 0.75), 
               outlier.shape = NA, alpha = 1, color = "black", size = 0.45) +  # Boxplot on top
  labs(title = "Overall V Family Distributions",
       x = "Gene",
       y = "Frequency") +
  scale_fill_manual(values = mycolors) + # Customize violin and boxplot fill
  scale_color_manual(values = mycolors) + # Customize point colors
  ylim(0, 1) + # Set y-axis limit
  theme_Publication() # Apply your preferred theme
  

print(v)

ggsave("HM_V_family_plot.png", width = 10, height = 4, bg = "white")


selected_genes <- c(
  "IGHV3-30",
  "IGHV4-59",
  "IGHV4-39",
  "IGHV1-69",
  "IGHV1-46",
  "IGHV3-11",
  "IGHV3-23",
  "IGHV4-34",
  "IGHV3-7",
  "IGHV3-21",
  "IGHV3-48",
  "IGHV3-30-3"
)

# Filter the dataset to include only the selected genes
Vg_call_filtered <- Vg_call %>%
    filter(gene %in% selected_genes)


# Violin plot with boxplot and individual points
v <- ggplot(Vg_call_filtered, aes(x = reorder(gene, -seq_freq), y = seq_freq, fill = Hiv_Status)) +
  geom_violin(alpha = 0.7, scale = "width", position = position_dodge(width = 0.75)) +  # Violin plot
  geom_jitter(aes(fill = Hiv_Status),  # Fill color based on Hiv_Status
              position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), 
              size = 1, alpha = 0.9, stroke = 0.1, shape = 21, color = "black") +  # Jitter placed before boxplot
  geom_boxplot(width = 0.2, position = position_dodge(width = 0.75), 
               outlier.shape = NA, alpha = 1, color = "black", size = 0.45) +  # Boxplot on top
  labs(title = "Overall V Family Distributions",
       x = "Gene",
       y = "Frequency") +
  scale_fill_manual(values = mycolors) + # Customize violin and boxplot fill
  scale_color_manual(values = mycolors) + # Customize point colors
  ylim(0, 0.75) + # Set y-axis limit
  theme_Publication() # Apply your preferred theme

ggsave("HM_V_Subfamily_plot.png", width = 10, height = 4, bg = "white")

###############################################################################################################################
###############################################################################################################################
#NB!!
#https://rpubs.com/Koundy/71792   

# Violin plot with boxplot in the middle
d <- ggplot(D_call, aes(x = reorder(gene, -seq_freq), y = seq_freq, fill = Hiv_Status)) +
  geom_violin(alpha = 0.7, scale = "width", position = position_dodge(width = 0.75)) +  # Violin plot
  geom_jitter(aes(fill = Hiv_Status),  # Fill color based on Hiv_Status
              position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), 
              size = 1, alpha = 0.9, stroke = 0.1, shape = 21, color = "black") +  # Jitter placed before boxplot
  geom_boxplot(width = 0.2, position = position_dodge(width = 0.75), 
               outlier.shape = NA, alpha = 1, color = "black", size = 0.45) +  # Boxplot on top
  labs(title = "Overall D Family Distributions",
       x = "Gene",
       y = "Frequency") +
  scale_fill_manual(values = mycolors) + # Customize violin and boxplot fill
  scale_color_manual(values = mycolors) + # Customize point colors
  ylim(0, 0.5) + # Set y-axis limit
  theme_Publication() # Apply your preferred theme

print(d)

ggsave("HM_D_family_plot.png", width = 10, height = 4, bg = "white")


# Specify the genes to include in the plot
selected_genes <- c(
  "IGHD3-10",
  "IGHD3-22",
  "IGHD6-13",
  "IGHD6-19",
  "IGHD1-26",
  "IGHD2-2",
  "IGHD3-3",
  "IGHD4-17",
  "IGHD2-15",
  "IGHD5-18",
  "IGHD3-16",
  "IGHD5-12"
)

# Filter the dataset to include only the selected genes
Dg_call_filtered <- Dg_call %>%
    filter(gene %in% selected_genes)

# Violin plot with boxplot and individual points
Dg <- ggplot(Dg_call_filtered, aes(x = reorder(gene, -seq_freq), y = seq_freq, fill = Hiv_Status)) +
  geom_violin(alpha = 0.7, scale = "width", position = position_dodge(width = 0.75)) +  # Violin plot
  geom_jitter(aes(fill = Hiv_Status),  # Fill color based on Hiv_Status
              position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), 
              size = 1, alpha = 0.9, stroke = 0.1, shape = 21, color = "black") +  # Jitter placed before boxplot
  geom_boxplot(width = 0.2, position = position_dodge(width = 0.75), 
               outlier.shape = NA, alpha = 1, color = "black", size = 0.45) +  # Boxplot on top
  labs(title = "Overall D Family Distributions",
       x = "Gene",
       y = "Frequency") +
  scale_fill_manual(values = mycolors) + # Customize violin and boxplot fill
  scale_color_manual(values = mycolors) + # Customize point colors
  ylim(0, 0.3) + # Set y-axis limit
  theme_Publication() # Apply your preferred theme

ggsave("HM_D_Subfamily_plot.png", width = 11, height = 5, bg = "white")
##################################################################################################################


# Violin plot with boxplot in the middle
J <- ggplot(J_call, aes(x = reorder(gene, -seq_freq), y = seq_freq, fill = Hiv_Status)) +
  geom_violin(alpha = 0.7, scale = "width", position = position_dodge(width = 0.75)) +  # Violin plot
  geom_jitter(aes(fill = Hiv_Status),  # Fill color based on Hiv_Status
              position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), 
              size = 1, alpha = 0.9, stroke = 0.1, shape = 21, color = "black") +  # Jitter placed before boxplot
  geom_boxplot(width = 0.2, position = position_dodge(width = 0.75), 
               outlier.shape = NA, alpha = 1, color = "black", size = 0.45) +  # Boxplot on top
  labs(title = "Overall J Family Distributions",
       x = "Gene",
       y = "Frequency") +
  scale_fill_manual(values = mycolors) + # Customize violin and boxplot fill
  scale_color_manual(values = mycolors) + # Customize point colors
  ylim(0,0.75) + # Set y-axis limit
  theme_Publication() # Apply your preferred theme

ggsave("J_family_bar_plot_f5.png", width = 10, height = 4, bg = "white")


# Specify the genes to include in the plot
selected_genes <- c("IGHD3-10", "IGHD3-22", "IGHD6-19", "IGHD1-26", 
  "IGHD3-16", "IGHD6-13", "IGHD3-3", "IGHD2-21", 
  "IGHD2-15", "IGHD4-17", "IGHD5-24", "IGHD1-1")


# Filter the dataset to include only the selected genes
Dg_call_filtered <- Dg_call %>%
    filter(gene %in% selected_genes)

# Violin plot with boxplot and individual points
Jg <- ggplot(Jg_call, aes(x = reorder(gene, -seq_freq), y = seq_freq, fill = Hiv_Status)) +
  geom_violin(alpha = 0.7, scale = "width", position = position_dodge(width = 0.75)) +  # Violin plot
  geom_jitter(aes(fill = Hiv_Status),  # Fill color based on Hiv_Status
              position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), 
              size = 1, alpha = 0.9, stroke = 0.1, shape = 21, color = "black") +  # Jitter placed before boxplot
  geom_boxplot(width = 0.2, position = position_dodge(width = 0.75), 
               outlier.shape = NA, alpha = 1, color = "black", size = 0.45) +  # Boxplot on top
  labs(title = "Overall J Family Distributions",
       x = "Gene",
       y = "Frequency") +
  scale_fill_manual(values = mycolors) + # Customize violin and boxplot fill
  scale_color_manual(values = mycolors) + # Customize point colors
  ylim(0, 1) + # Set y-axis limit
  theme_Publication() # Apply your preferred theme

ggsave("J_Subfamily_bar_plot_f514.png", width = 10, height = 4, bg = "white")


###################################################################################################
#Load required packages
library(alakazam)
library(dplyr)

#Read the data csv file IgG 
db <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/M/SamplesHM26112024.csv")

#Pass the selected smaples 
#db <- data[data$sample %in% #c("D2032_H_G","D208_H_G","D2136_H_G","D442_H_G","D1160_H_G","D1248_H_G","D1248p_H_G","D2201_H_G","D2211_H_G","D268_H_G","D268p_H_G","D272_H_G","D272p_H_G","D442p_H_G","D946p_H_G"), ]

db_props <- aminoAcidProperties(db, seq="junction", trim=TRUE, 
                                label="cdr3")

# The full set of properties are calculated by default
dplyr::select(db_props[1:3, ], starts_with("cdr3"))

# Define a ggplot theme for all plots
tmp_theme <- theme_light() + theme(legend.position="bottom")

library(ggplot2)

# Calculate median outside of ggplot
medians <- db_props %>%
  group_by(Hiv_Status) %>%
  summarise(median_length = median(cdr3_aa_length))

# Your ggplot code
g1 <- ggplot(db_props, aes(x = cdr3_aa_length, fill = Hiv_Status)) + 
  tmp_theme + 
  ggtitle("IgG CDR3 length") +
  xlab("Length") + ylab("Count") +
  geom_density(binwidth = 0, position = "identity") +  #or Geom_histogram
  facet_wrap(~ Hiv_Status, scales = "free_y") +
  scale_fill_brewer(palette = "Dark2") +
  theme(
    strip.text.x = element_text(size = 12, color = "black", face = "bold")
  ) + 
  geom_vline(data = medians, aes(xintercept = median_length),
             linetype = "dashed", color = "black", size = 1) +
  facet_wrap(~ Hiv_Status, scales = "free_y") +
  scale_x_continuous(breaks = seq(min(0), max(60), by = 5)) +
  theme(
    strip.text.x = element_text(size = 12, color = "black", face = "bold")
  )

ggsave("cdr3_3_scaled_line_IgM_19022024.png", plot = g1, width = 14, height = 4, bg = "white")


g1 <- ggplot(db_props, aes(x = cdr3_aa_length, fill = Hiv_Status)) + 
  tmp_theme + 
  ggtitle("IgG CDR3 length") +
  xlab("Length") + ylab("Count") +
  geom_density(aes(y = ..density..), position = "identity") +  # Adjusted for density
  facet_wrap(~ Hiv_Status, scales = "free_y") +
  scale_fill_brewer(palette = "Dark2") +
  theme(
    strip.text.x = element_text(size = 12, color = "black", face = "bold")
  ) + 
  geom_vline(data = medians, aes(xintercept = median_length),
             linetype = "dashed", color = "black", size = 1) +
  scale_x_continuous(breaks = seq(min(0), max(60), by = 5)) +
  scale_y_continuous(limits = c(0, 1)) +  # Scale y-axis from 0 to 1
  theme(
    strip.text.x = element_text(size = 12, color = "black", face = "bold")
  )

ggsave("cdr3_3_scaled_line_IgG_19022024.png", plot = g1, width = 14, height = 4, bg = "white")
###################################################################################################



