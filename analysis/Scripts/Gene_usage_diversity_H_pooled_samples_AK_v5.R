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

D1160_H_G1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_H_G1_S/FIN_collapse-unique_igblast_db-pass.tsv")
D1160_H_G2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_H_G2_S/FIN_collapse-unique_igblast_db-pass.tsv")
D1160_H_M1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_H_M1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_H_M2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_H_M2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_K_1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_K_1_S2/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_K_2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_K_2_S3/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_L_1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_L_1_S2/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_L_2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_L_2_S3/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1248_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1248_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv")
D1248p_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv")
D1248p_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_H_G1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_G1_S/FIN_collapse-unique_igblast_db-pass.tsv")
D2201_H_G2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_G2_S/FIN_collapse-unique_igblast_db-pass.tsv")
D2201_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_M1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_M2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_K_1_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_K_1_S1/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_K_2_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_K_2_S1/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_L_1_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_L_1_S1/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_L_2_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_L_2_S1/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_H_G1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_G1_S/FIN_collapse-unique_igblast_db-pass.tsv")
D2211_H_G2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_G2_S/FIN_collapse-unique_igblast_db-pass.tsv")
D2211_H_M1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_M1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_H_M2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_M2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_K_1_S3 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_K_1_S3/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_K_2_S7 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_K_2_S7/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_L_1_S4 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_L_1_S4/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_L_2_S8 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_L_2_S8/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D268p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D268p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D272p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D272p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D442p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D442p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D442p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D946p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D946p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D946p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv")
D1160p_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv")


#Run 1

D2032_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2032_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2032_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D208_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D208_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2136_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2136_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D442_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D442_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

#0972024
D198_H_G1_in <- read_rearrangement ("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D198_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D198_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


D198p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D198p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D198p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2350_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2350_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2350_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D946_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D946_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D946_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


######################################################################################################################################
#19112024
D2257_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2257_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2257_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2262_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2262_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D268a_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D268a_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_K_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_K_1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_K_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_K_2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_L_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_L_1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_L_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_L_2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D268b_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D268b_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_K_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_K_1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_K_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_K_2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_L_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_L_1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_L_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_L_2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

##################################################################################################
D2257c_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv")
D2257c_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv")
D2257c_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D198ba_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv")
D198ba_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv")
D198ba_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


D272aa_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv")
D272aa_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv")
D272aa_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


D272ba_H_G1_<- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv")
D272ba_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv")
D272ba_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script



#21112024

D1160p_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D093_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D093_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D093_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D1210_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1210_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1210_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2255_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2255_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2255_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


D2215_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2215_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2215_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2542_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2542_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2542_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2539_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2539_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2539_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2331_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2331_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2331_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


D2331_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2331_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2331_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


############################################################

D2136c_H_G1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv")
D2136c_H_G2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv")
D2136c_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script






###################################################################################################
# Define the base directory
#base_dir <- "/mnt/data/B_cell_repertoire/Post"

# List all folder names in the base directory
#folders <- list.dirs(base_dir, full.names = TRUE, recursive = FALSE)

# Define the target file name in each folder
#file_name <- "FIN_collapse-unique_igblast_db-pass.tsv"

# Create a function to read the files
#read_files <- function(folder) {
#  file_path <- file.path(folder, file_name) # Construct the full file path
#  if (file.exists(file_path)) {            # Check if the file exists
#    read_rearrangement(file_path)          # Read the file
#  } else {
#    warning(paste("File not found in folder:", folder)) # Handle missing files
#    return(NULL)
#  }
#}



# Function to sanitize folder names
#sanitize_name <- function(name) {
#  gsub("[-.]", "_", name) # Replace hyphens and dots with underscores
#}

# Read files and assign them directly as variables
#for (folder in folders) {
#  folder_name <- basename(folder)         # Extract the folder name
#  sanitized_name <- sanitize_name(folder_name) # Sanitize the name
#  data <- read_files(folder)              # Read the file
#  if (!is.null(data)) {
#    assign(sanitized_name, data)          # Assign the data frame to a variable
#  }
#}

###################################################################################################
#Combine 
###################################################################################################
#Combine 
#sample 1                    
D2032_H_G1_i$aliquot<-"R1"                     
D2032_H_G2_i$aliquot<-"R2"                   
D2032_H_G <- rbind(D2032_H_G1_i,D2032_H_G2_i)
D2032_H_G$sample <-"D2032_H_G"
rm(D2032_H_G1_i,D2032_H_G2_i)

D2032_H_M1_i$aliquot<-"R1"                     
D2032_H_M2_i$aliquot<-"R2"
D2032_H_M <- rbind(D2032_H_M1_i,D2032_H_M2_i)
D2032_H_M$sample <-"D2032_H_M"
rm(D2032_H_M1_i,D2032_H_M2_i)

D2032_K_1_in$aliquot<-"R1"                     
D2032_K_2_in$aliquot<-"R2"										
D2032_K <- rbind(D2032_K_1_in,D2032_K_2_in)
D2032_K$sample <-"D2032_K"
rm(D2032_K_1_in,D2032_K_2_in)

D2032_L_1_in$aliquot<-"R1"                     
D2032_L_2_in$aliquot<-"R2"
D2032_L <- rbind(D2032_L_1_in,D2032_L_2_in)
D2032_L$sample <-"D2032_L"
rm(D2032_L_1_in,D2032_L_2_in)

#sample 2                    
D208_H_G1_in$aliquot<-"R1"                     
D208_H_G2_in$aliquot<-"R2"
D208_H_G <- rbind(D208_H_G1_in,D208_H_G2_in)
D208_H_G$sample <-"D208_H_G"
rm(D208_H_G1_in,D208_H_G2_in)

D208_H_M1_in$aliquot<-"R1"                     
D208_H_M2_in$aliquot<-"R2"                     
D208_H_M <- rbind(D208_H_M1_in,D208_H_M2_in)
D208_H_M$sample <-"D208_H_M"
rm(D208_H_M1_in,D208_H_M2_in)

D208_K_1_ind$aliquot<-"R1"                     
D208_K_2_ind$aliquot<-"R2"
D208_K <- rbind(D208_K_1_ind,D208_K_2_ind)
D208_K$sample <-"D208_K"
rm(D208_K_1_ind,D208_K_2_ind)
                  
D208_L_1_ind$aliquot<-"R1"                     
D208_L_2_ind$aliquot<-"R2"
D208_L <- rbind(D208_L_1_ind,D208_L_2_ind)
D208_L$sample <-"D208_L"
rm(D208_L_1_ind,D208_L_2_ind)

#sample 3                  
D2136_H_G1_i$aliquot<-"R1"                     
D2136_H_G2_i$aliquot<-"R2"                     
D2136_H_G <- rbind(D2136_H_G1_i,D2136_H_G2_i)
D2136_H_G$sample <-"D2136_H_G"
rm(D2136_H_G1_i,D2136_H_G2_i)

D2136_H_M1_i$aliquot<-"R1"                     
D2136_H_M2_i$aliquot<-"R2"
D2136_H_M <- rbind(D2136_H_M1_i,D2136_H_M2_i)
D2136_H_M$sample <-"D2136_H_M"
rm(D2136_H_M1_i,D2136_H_M2_i)

D2136_K_1_in$aliquot<-"R1"                     
D2136_K_2_in$aliquot<-"R2"
D2136_K <- rbind(D2136_K_1_in,D2136_K_2_in)
D2136_K$sample <-"D2136_K"
rm(D2136_K_1_in,D2136_K_2_in)

D2136_L_1_in$aliquot<-"R1"                     
D2136_L_2_in$aliquot<-"R2"
D2136_L <- rbind(D2136_L_1_in,D2136_L_2_in)
D2136_L$sample <-"D2136_L"
rm(D2136_L_1_in,D2136_L_2_in)

#sample 4                   
D442_H_G1_in$aliquot<-"R1"                     
D442_H_G2_in$aliquot<-"R2"
D442_H_G <- rbind(D442_H_G1_in,D442_H_G2_in)
D442_H_G$sample <-"D442_H_G"
rm(D442_H_G1_in,D442_H_G2_in)

D442_H_M1_in$aliquot<-"R1"                     
D442_H_M2_in$aliquot<-"R2"
D442_H_M <- rbind(D442_H_M1_in,D442_H_M2_in)
D442_H_M$sample <-"D442_H_M"
rm(D442_H_M1_in,D442_H_M2_in)

D442_K_1_ind$aliquot<-"R1"                     
D442_K_2_ind$aliquot<-"R2"
D442_K <- rbind(D442_K_1_ind,D442_K_2_ind)
D442_K$sample <-"D442_K"
rm(D442_K_1_ind,D442_K_2_ind)

D442_L_1_ind$aliquot<-"R1"                     
D442_L_2_ind$aliquot<-"R2"
D442_L <- rbind(D442_L_1_ind,D442_L_2_ind)
D442_L$sample <-"D442_L"
rm(D442_L_1_ind,D442_L_2_ind)

#sample 5                    
D1160_H_G1_S$aliquot<-"R1"                     
D1160_H_G2_S$aliquot<-"R2"                     
D1160_H_G <- rbind(D1160_H_G1_S,D1160_H_G2_S)
D1160_H_G$sample <-"D1160_H_G"
rm(D1160_H_G1_S,D1160_H_G2_S)

D1160_H_M1_S$aliquot<-"R1"                     
D1160_H_M2_S$aliquot<-"R2"                     
D1160_H_M <- rbind(D1160_H_M1_S,D1160_H_M2_S)
D1160_H_M$sample <-"D1160_H_M"
rm(D1160_H_M1_S,D1160_H_M2_S)

D1160_K_1_S$aliquot<-"R1"                     
D1160_K_2_S$aliquot<-"R2"                     
D1160_K <- rbind(D1160_K_1_S,D1160_K_2_S)
D1160_K$sample <-"D1160_K"
rm(D1160_K_1_S,D1160_K_2_S)

D1160_L_1_S$aliquot<-"R1"                     
D1160_L_2_S$aliquot<-"R2"                     
D1160_L <- rbind(D1160_L_1_S,D1160_L_2_S)
D1160_L$sample <-"D1160_L"
rm(D1160_L_1_S,D1160_L_2_S)

#sample 6                     
D1248_H_G1_i$aliquot<-"R1"
D1248_H_G2_i$aliquot<-"R2"
D1248_H_G <- rbind(D1248_H_G1_i,D1248_H_G2_i)
D1248_H_G$sample <-"D1248_H_G"
rm(D1248_H_G1_i,D1248_H_G2_i)

D1248_H_M1_i$aliquot<-"R1"
D1248_H_M2_i$aliquot<-"R2"
D1248_H_M <- rbind(D1248_H_M1_i, D1248_H_M2_i)
D1248_H_M$sample <- "D1248_H_M"
rm(D1248_H_M1_i, D1248_H_M2_i)


D1248_K_1_in$aliquot<-"R1"
D1248_K_2_in$aliquot<-"R2"
D1248_K <- rbind(D1248_K_1_in, D1248_K_2_in)
D1248_K$sample <- "D1248_K"
rm(D1248_K_1_in, D1248_K_2_in)

D1248_L_1_in$aliquot<-"R1"
D1248_L_2_in$aliquot<-"R2"
D1248_L <- rbind(D1248_L_1_in, D1248_L_2_in)
D1248_L$sample <- "D1248_L"
rm(D1248_L_1_in, D1248_L_2_in)


#sample 7                    
D1248p_H_G1_$aliquot<-"R1"
D1248p_H_G2_$aliquot<-"R2"
D1248p_H_G <- rbind(D1248p_H_G1_,D1248p_H_G2_)
D1248p_H_G$sample <-"D1248p_H_G"
rm(D1248p_H_G1_,D1248p_H_G2_)

D1248p_H_M1$aliquot<-"R1"
D1248p_H_M2$aliquot<-"R2"
D1248p_H_M <- rbind(D1248p_H_M1, D1248p_H_M2)
D1248p_H_M$sample <- "D1248p_H_M"
rm(D1248p_H_M1, D1248p_H_M2)

D1248p_K_1_i$aliquot<-"R1"
D1248p_K_2_i$aliquot<-"R2"
D1248p_K <- rbind(D1248p_K_1_i, D1248p_K_2_i)
D1248p_K$sample <- "D1248p_K"
rm(D1248p_K_1_i, D1248p_K_2_i)

D1248p_L_1_i$aliquot<-"R1"
D1248p_L_2_i$aliquot<-"R2"
D1248p_L <- rbind(D1248p_L_1_i, D1248p_L_2_i)
D1248p_L$sample <- "D1248p_L"
rm(D1248p_L_1_i, D1248p_L_2_i)

#sample 8                  
D2201_H_G1_S$aliquot<-"R1"                     
D2201_H_G2_S$aliquot<-"R2"
D2201_H_G <- rbind(D2201_H_G1_S,D2201_H_G2_S)
D2201_H_G$sample <-"D2201_H_G"
rm(D2201_H_G1_S,D2201_H_G2_S)

D2201_H_M1$aliquot<-"R1"
D2201_H_M2$aliquot<-"R2"
D2201_H_M <- rbind(D2201_H_M1, D2201_H_M2)
D2201_H_M$sample <- "D2201_H_M"
rm(D2201_H_M1, D2201_H_M2)

D2201_K_1_S1$aliquot<-"R1"
D2201_K_2_S1$aliquot<-"R2"
D2201_K <- rbind(D2201_K_1_S1, D2201_K_2_S1)
D2201_K$sample <- "D2201_K"
rm(D2201_K_1_S1, D2201_K_2_S1)

D2201_L_1_S1$aliquot<-"R1"
D2201_L_2_S1$aliquot<-"R2"
D2201_L <- rbind(D2201_L_1_S1, D2201_L_2_S1)
D2201_L$sample <- "D2201_L"
rm(D2201_L_1_S1, D2201_L_2_S1)

#sample 9                   
D2211_H_G1_S$aliquot<-"R1"
D2211_H_G2_S$aliquot<-"R2"  	              
D2211_H_G <- rbind(D2211_H_G1_S,D2211_H_G2_S)
D2211_H_G$sample <-"D2211_H_G"
rm(D2211_H_G1_S,D2211_H_G2_S)

D2211_H_M1_S$aliquot<-"R1"
D2211_H_M2_S$aliquot<-"R2"  	              
D2211_H_M <- rbind(D2211_H_M1_S,D2211_H_M2_S)
D2211_H_M$sample <-"D2211_H_M"
rm(D2211_H_M1_S,D2211_H_M2_S)

D2211_K_1_S3$aliquot<-"R1"
D2211_K_2_S7$aliquot<-"R2"
D2211_K <- rbind(D2211_K_1_S3, D2211_K_2_S7)
D2211_K$sample <- "D2211_K"
rm(D2211_K_1_S3, D2211_K_2_S7)

D2211_L_1_S4$aliquot<-"R1"
D2211_L_2_S8$aliquot<-"R2"
D2211_L <- rbind(D2211_L_1_S4, D2211_L_2_S8)
D2211_L$sample <- "D2211_L"
rm(D2211_L_1_S4, D2211_L_2_S8)


#sample 10                 
D268p_H_G1_i$aliquot<-"R1"
D268p_H_G2_i$aliquot<-"R2"  	              
D268p_H_G <- rbind(D268p_H_G1_i,D268p_H_G2_i)
D268p_H_G$sample <-"D268p_H_G"
rm(D268p_H_G1_i,D268p_H_G2_i)

D268p_H_M1_i$aliquot<-"R1"
D268p_H_M2_i$aliquot<-"R2"
D268p_H_M <- rbind(D268p_H_M1_i, D268p_H_M2_i)
D268p_H_M$sample <- "D268p_H_M"
rm(D268p_H_M1_i, D268p_H_M2_i)

D268p_K_1_in$aliquot<-"R1"
D268p_K_2_in$aliquot<-"R2"					
D268p_K <- rbind(D268p_K_1_in, D268p_K_2_in)
D268p_K$sample <- "D268p_K"
rm(D268p_K_1_in, D268p_K_2_in)

D268p_L_1_in$aliquot<-"R1"
D268p_L_2_in$aliquot<-"R2"
D268p_L <- rbind(D268p_L_1_in, D268p_L_2_in)
D268p_L$sample <- "D268p_L"
rm(D268p_L_1_in, D268p_L_2_in)


#sample 11             
D272p_H_G1_i$aliquot<-"R1"
D272p_H_G2_i$aliquot<-"R2"
D272p_H_G <- rbind(D272p_H_G1_i,D272p_H_G2_i)
D272p_H_G$sample <-"D272p_H_G"
rm(D272p_H_G1_i,D272p_H_G2_i)

D272p_H_M1_i$aliquot<-"R1"
D272p_H_M2_i$aliquot<-"R2"
D272p_H_M <- rbind(D272p_H_M1_i,D272p_H_M2_i)
D272p_H_M$sample <-"D272p_H_M"
rm(D272p_H_M1_i,D272p_H_M2_i)

D272p_K_1_in$aliquot<-"R1"
D272p_K_2_in$aliquot<-"R2"
D272p_K <- rbind(D272p_K_1_in, D272p_K_2_in)
D272p_K$sample <- "D272p_K"
rm(D272p_K_1_in, D272p_K_2_in)

D272p_L_1_in$aliquot<-"R1"
D272p_L_2_in$aliquot<-"R2"
D272p_L <- rbind(D272p_L_1_in, D272p_L_2_in)
D272p_L$sample <- "D272p_L"
rm(D272p_L_1_in, D272p_L_2_in)


#sample 12                        
D442p_H_G1_i$aliquot<-"R1"
D442p_H_G2_i$aliquot<-"R2"
D442p_H_G <- rbind(D442p_H_G1_i,D442p_H_G2_i)
D442p_H_G$sample <-"D442p_H_G"
rm(D442p_H_G1_i,D442p_H_G2_i)

D442p_H_M1_i$aliquot<-"R1"
D442p_H_M2_i$aliquot<-"R2"
D442p_H_M <- rbind(D442p_H_M1_i,D442p_H_M2_i)
D442p_H_M$sample <-"D442p_H_M"
rm(D442p_H_M1_i,D442p_H_M2_i)

D442p_K_1_in$aliquot<-"R1"
D442p_K_2_in$aliquot<-"R2"
D442p_K <- rbind(D442p_K_1_in, D442p_K_2_in)
D442p_K$sample <- "D442p_K"
rm(D442p_K_1_in, D442p_K_2_in)

D442p_L_1_in$aliquot<-"R1"
D442p_L_2_in$aliquot<-"R2"
D442p_L <- rbind(D442p_L_1_in, D442p_L_2_in)
D442p_L$sample <- "D442p_L"
rm(D442p_L_1_in, D442p_L_2_in)


#sample 13              
D946p_H_G1_i$aliquot<-"R1"
D946p_H_G2_i$aliquot<-"R2"
D946p_H_G <- rbind(D946p_H_G1_i,D946p_H_G2_i)
D946p_H_G$sample <-"D946p_H_G"
rm(D946p_H_G1_i,D946p_H_G2_i)

D946p_H_M1_i$aliquot<-"R1"
D946p_H_M2_i$aliquot<-"R2"
D946p_H_M <- rbind(D946p_H_M1_i,D946p_H_M2_i)
D946p_H_M$sample <-"D946p_H_M"
rm(D946p_H_M1_i,D946p_H_M2_i)

D946p_K_1_in$aliquot<-"R1"
D946p_K_2_in$aliquot<-"R2"
D946p_K <- rbind(D946p_K_1_in, D946p_K_2_in)
D946p_K$sample <- "D946p_K"
rm(D946p_K_1_in, D946p_K_2_in)

D946p_L_1_in$aliquot<-"R1"
D946p_L_2_in$aliquot<-"R2"
D946p_L <- rbind(D946p_L_1_in, D946p_L_2_in)
D946p_L$sample <- "D946p_L"
rm(D946p_L_1_in, D946p_L_2_in)

#sample 14   
D1160p_H_G1_$aliquot<-"R1"
D1160p_H_G2_$aliquot<-"R2"
D1160p_H_G <- rbind(D1160p_H_G1_,D1160p_H_G2_)
D1160p_H_G$sample <-"D1160p_H_G"
rm(D1160p_H_G1_,D1160p_H_G2_)



D1160p_H_M1$aliquot<-"R1"
D1160p_H_M2$aliquot<-"R2"
D1160p_H_M <- rbind(D1160p_H_M1,D1160p_H_M2)
D1160p_H_M$sample <-"D1160p_H_M"
rm(D1160p_H_M1,D1160p_H_M2)


D1160p_K_1_i$aliquot<-"R1"
D1160p_K_2_i$aliquot<-"R2"
D1160p_K <- rbind(D1160p_K_1_i, D1160p_K_2_i)
D1160p_K$sample <- "D1160p_K"
rm(D1160p_K_1_i, D1160p_K_2_i)


D1160p_L_1_i$aliquot<-"R1"
D1160p_L_2_i$aliquot<-"R2"
D1160p_L <- rbind(D1160p_L_1_i, D1160p_L_2_i)
D1160p_L$sample <- "D1160p_L"
rm(D1160p_L_1_i, D1160p_L_2_i)

#sample 15          
#09072024
D198_H_G1_in$aliquot<-"R1"
D198_H_G2_in$aliquot<-"R2"
D198_H_G <- rbind(D198_H_G1_in, D198_H_G2_in)
D198_H_G$sample <- "D198_H_G"
rm(D198_H_G1_in, D198_H_G2_in)

D198_H_M1_in$aliquot<-"R1"
D198_H_M2_in$aliquot<-"R2"
D198_H_M <- rbind(D198_H_M1_in, D198_H_M2_in)
D198_H_M$sample <- "D198_H_M"
rm(D198_H_M1_in, D198_H_M2_in)

D198_K_1_ind$aliquot<-"R1"
D198_K_2_ind$aliquot<-"R2"
D198_K <- rbind(D198_K_1_ind, D198_K_2_ind)
D198_K$sample <- "D198_K"
rm(D198_K_1_ind, D198_K_2_ind)

D198_L_1_ind$aliquot<-"R1"
D198_L_2_ind$aliquot<-"R2"
D198_L <- rbind(D198_L_1_ind, D198_L_2_ind)
D198_L$sample <- "D198_L"
rm(D198_L_1_ind, D198_L_2_ind)


#sample 16
D198p_H_G1_i$aliquot<-"R1"
D198p_H_G2_i$aliquot<-"R2"
D198p_H_G <- rbind(D198p_H_G1_i, D198p_H_G2_i)
D198p_H_G$sample <- "D198p_H_G"
rm(D198p_H_G1_i, D198p_H_G2_i)

D198p_H_M1_i$aliquot<-"R1"
D198p_H_M2_i$aliquot<-"R2"
D198p_H_M <- rbind(D198p_H_M1_i, D198p_H_M2_i)
D198p_H_M$sample <- "D198p_H_M"
rm(D198p_H_M1_i, D198p_H_M2_i)


D198p_K_1_in$aliquot<-"R1"
D198p_K_2_in$aliquot<-"R2"
D198p_K <- rbind(D198p_K_1_in, D198p_K_2_in)
D198p_K$sample <- "D198p_K"
rm(D198p_K_1_in, D198p_K_2_in)


D198p_L_1_in$aliquot<-"R1"
D198p_L_2_in$aliquot<-"R2"
D198p_L <- rbind(D198p_L_1_in, D198p_L_2_in)
D198p_L$sample <- "D198p_L"
rm(D198p_L_1_in, D198p_L_2_in)



#sample 17
D2350_H_G1_i$aliquot<-"R1"
D2350_H_G2_i$aliquot<-"R2"
D2350_H_G <- rbind(D2350_H_G1_i, D2350_H_G2_i)
D2350_H_G$sample <- "D2350_H_G"
rm(D2350_H_G1_i, D2350_H_G2_i)

D2350_H_M1_i$aliquot<-"R1"
D2350_H_M2_i$aliquot<-"R2"
D2350_H_M <- rbind(D2350_H_M1_i, D2350_H_M2_i)
D2350_H_M$sample <- "D2350_H_M"
rm(D2350_H_M1_i, D2350_H_M2_i)

D2350_K_1_in$aliquot<-"R1"
D2350_K_2_in$aliquot<-"R2"
D2350_K <- rbind(D2350_K_1_in, D2350_K_2_in)
D2350_K$sample <- "D2350_K"
rm(D2350_K_1_in, D2350_K_2_in)


D2350_L_1_in$aliquot<-"R1"
D2350_L_2_in$aliquot<-"R2"
D2350_L <- rbind(D2350_L_1_in, D2350_L_2_in)
D2350_L$sample <- "D2350_L"
rm(D2350_L_1_in, D2350_L_2_in)

#sample 18
D946_H_G1_in$aliquot<-"R1"
D946_H_G2_in$aliquot<-"R2"
D946_H_G <- rbind(D946_H_G1_in, D946_H_G2_in)
D946_H_G$sample <- "D946_H_G"
rm(D946_H_G1_in, D946_H_G2_in)

D946_H_M1_in$aliquot<-"R1"
D946_H_M2_in$aliquot<-"R2"
D946_H_M <- rbind(D946_H_M1_in, D946_H_M2_in)
D946_H_M$sample <- "D946_H_M"
rm(D946_H_M1_in, D946_H_M2_in)

D946_K_1_ind$aliquot<-"R1"
D946_K_2_ind$aliquot<-"R2"
D946_K <- rbind(D946_K_1_ind, D946_K_2_ind)
D946_K$sample <- "D946_K"
rm(D946_K_1_ind, D946_K_2_ind)

D946_L_1_ind$aliquot<- "R1"
D946_L_2_ind$aliquot<-"R2"
D946_L <- rbind(D946_L_1_ind, D946_L_2_ind)
D946_L$sample <- "D946_L"
rm(D946_L_1_ind, D946_L_2_ind)

#sample 19
#19112024
D2257_H_G1_i$aliquot<-"R1"
D2257_H_G2_i$aliquot<-"R2"
D2257_H_G <- rbind(D2257_H_G1_i, D2257_H_G2_i)
D2257_H_G$sample <- "D2257_H_G"
rm(D2257_H_G1_i, D2257_H_G2_i) 

D2257_H_M1_i$aliquot<-"R1"
D2257_H_M2_i$aliquot<-"R2"
D2257_H_M <- rbind(D2257_H_M1_i, D2257_H_M2_i)        
D2257_H_M$sample <- "D2257_H_M"
rm(D2257_H_M1_i, D2257_H_M2_i) 

D2257_K_1_in$aliquot<-"R1"
D2257_K_2_in$aliquot<-"R2"
D2257_K <- rbind(D2257_K_1_in, D2257_K_2_in)
D2257_K$sample <- "D2257_K"
rm(D2257_K_1_in, D2257_K_2_in)

D2257_L_1_in$aliquot<-"R1"
D2257_L_2_in$aliquot<-"R2"
D2257_L_2 <- rbind(D2257_L_1_in, D2257_L_2_in)
D2257_L_2$sample <- "D2257_L_2"
rm(D2257_L_1_in, D2257_L_2_in) 

#sample 20

D2262_H_G1_i$aliquot<-"R1"
D2262_H_G2_i$aliquot<-"R2"
D2262_H_G <- rbind(D2262_H_G1_i, D2262_H_G2_i)
D2262_H_G$sample <- "D2262_H_G"
rm(D2262_H_G1_i, D2262_H_G2_i) 

D2262_H_M1_i$aliquot<-"R1"
D2262_H_M2_i$aliquot<-"R2"
D2262_H_M <- rbind(D2262_H_M1_i, D2262_H_M2_i)
D2262_H_M$sample <- "D2262_H_M"
rm(D2262_H_M1_i, D2262_H_M2_i) 

D2262_K_1_in$aliquot<-"R1"
D2262_K_2_in$aliquot<-"R2"
D2262_K <- rbind(D2262_K_1_in, D2262_K_2_in)
D2262_K$sample <- "D2262_K"
rm(D2262_K_1_in, D2262_K_2_in) 

D2262_L_1_in$aliquot<-"R1"
D2262_L_2_in$aliquot<-"R2"
D2262_L<- rbind(D2262_L_1_in, D2262_L_2_in)
D2262_L$sample <- "D2262_L"
rm(D2262_L_1_in, D2262_L_2_in) 

#sample 21                             					 
D268a_H_G1_i$aliquot<-"R1"
D268a_H_G2_i$aliquot<-"R2"
D268a_H_G <- rbind(D268a_H_G1_i, D268a_H_G2_i)
D268a_H_G$sample <- "D268a_H_G"
rm(D268a_H_G1_i, D268a_H_G2_i) 

D268a_H_M1_i$aliquot<-"R1"
D268a_H_M2_i$aliquot<-"R2"
D268a_H_M <- rbind(D268a_H_M1_i, D268a_H_M2_i)
D268a_H_M$sample <- "D268a_H_M"
rm(D268a_H_M1_i, D268a_H_M2_i) 

D268a_K_1_$aliquot<-"R1"
D268a_K_2_$aliquot<-"R2"
D268a_K <- rbind(D268a_K_1_, D268a_K_2_)
D268a_K$sample <- "D268a_K"
rm(D268a_K_1_, D268a_K_2_) 

D268a_L_1_$aliquot<-"R1"
D268a_L_2_$aliquot<-"R2"
D268a_L<- rbind(D268a_L_1_, D268a_L_2_)
D268a_L$sample <- "D268a_L"
rm(D268a_L_1_, D268a_L_2_) 

#sample 22

D268b_H_G1_i$aliquot<-"R1"
D268b_H_G2_i$aliquot<-"R2"
D268b_H_G <- rbind(D268b_H_G1_i, D268b_H_G2_i)					
D268b_H_G$sample <- "D268b_H_G"
rm(D268b_H_G1_i, D268b_H_G2_i) 

D268b_H_M1_i$aliquot<-"R1"
D268b_H_M2_i$aliquot<-"R2"
D268b_H_M <- rbind(D268b_H_M1_i, D268b_H_M2_i)
D268b_H_M$sample <- "D268b_H_M"
rm(D268b_H_M1_i, D268b_H_M2_i) 

D268b_K_1_$aliquot<-"R1"
D268b_K_2_$aliquot<-"R2"
D268b_K <- rbind(D268b_K_1_, D268b_K_2_)
D268b_K$sample <- "D268b_K"
rm(D268b_K_1_, D268b_K_2_) 

D268b_L_1_$aliquot<-"R1"
D268b_L_2_$aliquot<-"R2"
D268b_L <- rbind(D268b_L_1_, D268b_L_2_)
D268b_L$sample <- "D268b_L"
rm(D268b_L_1_, D268b_L_2_)

#sample 23
#19112024

D198ba_H_G1_$aliquot<-"R1"
D198ba_H_G2_$aliquot<-"R2"
D198ba_H_G <- rbind(D198ba_H_G1_, D198ba_H_G2_)
D198ba_H_G$sample <- "D198ba_H_G"
rm(D198ba_H_G1_, D198ba_H_G2_) 

D198ba_H_M1_$aliquot<-"R1"
D198ba_H_M2_$aliquot<-"R2"
D198ba_H_M <- rbind(D198ba_H_M1_, D198ba_H_M2_)
D198ba_H_M$sample <- "D198ba_H_M"
rm(D198ba_H_M1_, D198ba_H_M2_) 

D198ba_K_1_i$aliquot<-"R1"
D198ba_K_2_i$aliquot<-"R2"
D198ba_K <- rbind(D198ba_K_1_i, D198ba_K_2_i)					
D198ba_K$sample <- "D198ba_K"
rm(D198ba_K_1_i, D198ba_K_2_i) 

D198ba_L_1_i$aliquot<-"R1"
D198ba_L_2_i$aliquot<-"R2"
D198ba_L <- rbind(D198ba_L_1_i, D198ba_L_2_i)
D198ba_L$sample <- "D198ba_L"
rm(D198ba_L_1_i, D198ba_L_2_i) 

#sample 24

D2257c_H_G1_$aliquot<-"R1"
D2257c_H_G2_$aliquot<-"R2"
D2257c_H_G <- rbind(D2257c_H_G1_, D2257c_H_G2_)
D2257c_H_G$sample <- "D2257c_H_G"
rm(D2257c_H_G1_, D2257c_H_G2_) 

D2257c_H_M1_$aliquot<-"R1"
D2257c_H_M2_$aliquot<-"R2"
D2257c_H_M <- rbind(D2257c_H_M1_, D2257c_H_M2_)
D2257c_H_M$sample <- "D2257c_H_M"
rm(D2257c_H_M1_, D2257c_H_M2_) 

D2257c_K_1_i$aliquot<-"R1"
D2257c_K_2_i$aliquot<-"R2"
D2257c_K <- rbind(D2257c_K_1_i, D2257c_K_2_i)
D2257c_K$sample <- "D198ba_L"
rm(D2257c_K_1_i, D2257c_K_2_i) 

D2257c_L_1_i$aliquot<-"R1"
D2257c_L_2_i$aliquot<-"R2"
D2257c_L <- rbind(D2257c_L_1_i, D2257c_L_2_i)
D2257c_L$sample <- "D2257c_L"
rm(D2257c_L_1_i, D2257c_L_2_i) 

#sample 25

D272aa_H_G1_$aliquot<-"R1"
D272aa_H_G2_$aliquot<-"R2"
D272aa_H_G <- rbind(D272aa_H_G1_, D272aa_H_G2_)
D272aa_H_G$sample <- "D272aa_H_G"
rm(D272aa_H_G1_, D272aa_H_G2_) 

D272aa_H_M1_$aliquot<-"R1"
D272aa_H_M2_$aliquot<-"R2"
D272aa_H_M <- rbind(D272aa_H_M1_, D272aa_H_M2_)
D272aa_H_M$sample <- "D272aa_H_M"
rm(D272aa_H_M1_, D272aa_H_M2_) 

D272aa_K_1_i$aliquot<-"R1"
D272aa_K_2_i$aliquot<-"R2"
D272aa_K <- rbind(D272aa_K_1_i, D272aa_K_2_i)
D272aa_K$sample <- "D272aa_H_G"
rm(D272aa_K_1_i, D272aa_K_2_i) 

D272aa_L_1_i$aliquot<-"R1"
D272aa_L_2_i$aliquot<-"R2"
D272aa_L<- rbind(D272aa_L_1_i, D272aa_L_2_i)
D272aa_L$sample <- "D272aa_L"
rm(D272aa_L_1_i, D272aa_L_2_i) 

#sample 26

D272ba_H_G1_$aliquot<-"R1"
D272ba_H_G2_$aliquot<-"R2"
D272ba_H_G <- rbind(D272ba_H_G1_, D272ba_H_G2_)			
D272ba_H_G$sample <- "D272ba_H_G"
rm(D272ba_H_G1_, D272ba_H_G2_) 

D272ba_H_M1_$aliquot<-"R1"
D272ba_H_M2_$aliquot<-"R2"
D272ba_H_M <- rbind(D272ba_H_M1_, D272ba_H_M2_)
D272ba_H_M$sample <- "D272ba_H_M"
rm(D272ba_H_M1_, D272ba_H_M2_) 

D272ba_K_1_i$aliquot<-"R1"
D272ba_K_2_i$aliquot<-"R2"
D272ba_K <- rbind(D272ba_K_1_i, D272ba_K_2_i)
D272ba_K$sample <- "D272ba_K"
rm(D272ba_K_1_i, D272ba_K_2_i) 

D272ba_L_1_i$aliquot<-"R1"
D272ba_L_2_i$aliquot<-"R2"
D272ba_L <- rbind(D272ba_L_1_i, D272ba_L_2_i)
D272ba_L$sample <- "D272aa_L"
rm(D272ba_L_1_i, D272ba_L_2_i) 


#sample 27                    
D093_H_G1_in$aliquot<-"R1"                     
D093_H_G2_in$aliquot<-"R2"                   
D093_H_G <- rbind(D093_H_G1_in,D093_H_G2_in)
D093_H_G$sample <-"D093_H_G"
rm(D093_H_G1_in,D093_H_G2_in)

D093_H_M1_in$aliquot<-"R1"                     
D093_H_M2_in$aliquot<-"R2"
D093_H_M <- rbind(D093_H_M1_in,D093_H_M2_in)
D093_H_M$sample <-"D093_H_M"
rm(D093_H_M1_in,D093_H_M2_in)

D093_K_1_ind$aliquot<-"R1"                     
D093_K_2_ind$aliquot<-"R2"
D093_K <- rbind(D093_K_1_ind,D093_K_2_ind)
D093_K$sample <-"D093_K"
rm(D093_K_1_ind,D093_K_2_ind)

D093_L_1_ind$aliquot<-"R1"                     
D093_L_2_ind$aliquot<-"R2"
D093_L <- rbind(D093_L_1_ind,D093_L_2_ind)
D093_L$sample <-"D093_L"
rm(D093_L_1_ind,D093_L_2_ind)

#sample 28                   
D1210_H_G1_i$aliquot<-"R1"                     
D1210_H_G2_i$aliquot<-"R2"                   
D1210_H_G <- rbind(D1210_H_G1_i,D1210_H_G2_i)
D1210_H_G$sample <-"D1210_H_G"
rm(D1210_H_G1_i,D1210_H_G2_i)

D1210_H_M1_i$aliquot<-"R1"                     
D1210_H_M2_i$aliquot<-"R2"
D1210_H_M <- rbind(D1210_H_M1_i,D1210_H_M2_i)
D1210_H_M$sample <-"D1210_H_M"
rm(D1210_H_M1_i,D1210_H_M2_i)

D1210_K_1_in$aliquot<-"R1"                     
D1210_K_2_in$aliquot<-"R2"
D1210_K <- rbind(D1210_K_1_in,D1210_K_2_in)
D1210_K$sample <-"D1210_K"
rm(D1210_K_1_in,D1210_K_2_in)

D1210_L_1_in$aliquot<-"R1"                     
D1210_L_2_in$aliquot<-"R2"
D1210_L <- rbind(D1210_L_1_in,D1210_L_2_in)
D1210_L$sample <-"D1210_L"
rm(D1210_L_1_in,D1210_L_2_in)

#sample 29                   
D2255_H_G1_i$aliquot<-"R1"                     
D2255_H_G2_i$aliquot<-"R2"                   
D2255_H_G <- rbind(D2255_H_G1_i,D2255_H_G2_i)
D2255_H_G$sample <-"D2255_H_G"
rm(D2255_H_G1_i,D2255_H_G2_i)

D2255_H_M1_i$aliquot<-"R1"                     
D2255_H_M2_i$aliquot<-"R2"
D2255_H_M <- rbind(D2255_H_M1_i,D2255_H_M2_i)
D2255_H_M$sample <-"D2255_H_M"
rm(D2255_H_M1_i,D2255_H_M2_i)

D2255_K_1_in$aliquot<-"R1"                     
D2255_K_2_in$aliquot<-"R2"
D2255_K <- rbind(D2255_K_1_in,D2255_K_2_in)
D2255_K$sample <-"D2255_K"
rm(D2255_K_1_in,D2255_K_2_in)

D2255_L_1_in$aliquot<-"R1"                     
D2255_L_2_in$aliquot<-"R2"
D2255_L <- rbind(D2255_L_1_in,D2255_L_2_in)
D2255_L$sample <-"D2255_L"
rm(D2255_L_1_in,D2255_L_2_in)

#sample 30                  
D2215_H_G1_i$aliquot<-"R1"                     
D2215_H_G2_i$aliquot<-"R2"                   
D2215_H_G <- rbind(D2215_H_G1_i,D2215_H_G2_i)
D2215_H_G$sample <-"D2215_H_G"
rm(D2215_H_G1_i,D2215_H_G2_i)

D2215_H_M1_i$aliquot<-"R1"                     
D2215_H_M2_i$aliquot<-"R2"
D2215_H_M <- rbind(D2215_H_M1_i,D2215_H_M2_i)
D2215_H_M$sample <-"D2215_H_M"
rm(D2215_H_M1_i,D2215_H_M2_i)

D2215_K_1_in$aliquot<-"R1"                     
D2215_K_2_in$aliquot<-"R2"
D2215_K <- rbind(D2215_K_1_in,D2215_K_2_in)
D2215_K$sample <-"D2215_K"
rm(D2215_K_1_in,D2215_K_2_in)

D2215_L_1_in$aliquot<-"R1"                     
D2215_L_2_in$aliquot<-"R2"
D2215_L <- rbind(D2215_L_1_in,D2215_L_2_in)
D2215_L$sample <-"D2215_L"
rm(D2215_L_1_in,D2215_L_2_in)

#sample 31                
D2542_H_G1_i$aliquot<-"R1"                     
D2542_H_G2_i$aliquot<-"R2"                   
D2542_H_G <- rbind(D2542_H_G1_i,D2542_H_G2_i)
D2542_H_G$sample <-"D2542_H_G"
rm(D2542_H_G1_i,D2542_H_G2_i)

D2542_H_M1_i$aliquot<-"R1"                     
D2542_H_M2_i$aliquot<-"R2"
D2542_H_M <- rbind(D2542_H_M1_i,D2542_H_M2_i)
D2542_H_M$sample <-"D2542_H_M"
rm(D2542_H_M1_i,D2542_H_M2_i)

D2542_K_1_in$aliquot<-"R1"                     
D2542_K_2_in$aliquot<-"R2"
D2542_K <- rbind(D2542_K_1_in,D2542_K_2_in)
D2542_K$sample <-"D2542_K"
rm(D2542_K_1_in,D2542_K_2_in)

D2542_L_1_in$aliquot<-"R1"                     
D2542_L_2_in$aliquot<-"R2"
D2542_L <- rbind(D2542_L_1_in,D2542_L_2_in)
D2542_L$sample <-"D2542_L"
rm(D2542_L_1_in,D2542_L_2_in)


#sample 32                   
D2539_H_G1_i$aliquot<-"R1"                     
D2539_H_G2_i$aliquot<-"R2"                   
D2539_H_G <- rbind(D2539_H_G1_i,D2539_H_G2_i)
D2539_H_G$sample <-"D2539_H_G"
rm(D2539_H_G1_i,D2539_H_G2_i)

D2539_H_M1_i$aliquot<-"R1"                     
D2539_H_M2_i$aliquot<-"R2"
D2539_H_M <- rbind(D2539_H_M1_i,D2539_H_M2_i)
D2539_H_M$sample <-"D2539_H_M"
rm(D2539_H_M1_i,D2539_H_M2_i)

D2539_K_1_in$aliquot<-"R1"                     
D2539_K_2_in$aliquot<-"R2"
D2539_K <- rbind(D2539_K_1_in,D2539_K_2_in)
D2539_K$sample <-"D2539_K"
rm(D2539_K_1_in,D2539_K_2_in)

D2539_L_1_in$aliquot<-"R1"                     
D2539_L_2_in$aliquot<-"R2"
D2539_L <- rbind(D2539_L_1_in,D2539_L_2_in)
D2539_L$sample <-"D2539_L"
rm(D2539_L_1_in,D2539_L_2_in)


#sample 33                  
D2331_H_G1_i$aliquot<-"R1"                     
D2331_H_G2_i$aliquot<-"R2"                   
D2331_H_G <- rbind(D2331_H_G1_i,D2331_H_G2_i)
D2331_H_G$sample <-"D2331_H_G"
rm(D2331_H_G1_i,D2331_H_G2_i)

D2331_H_M1_i$aliquot<-"R1"                     
D2331_H_M2_i$aliquot<-"R2"
D2331_H_M <- rbind(D2331_H_M1_i,D2331_H_M2_i)
D2331_H_M$sample <-"D2331_H_M"
rm(D2331_H_M1_i,D2331_H_M2_i)

D2331_K_1_in$aliquot<-"R1"                     
D2331_K_2_in$aliquot<-"R2"
D2331_K <- rbind(D2331_K_1_in,D2331_K_2_in)
D2331_K$sample <-"D2331_K"
rm(D2331_K_1_in,D2331_K_2_in)

D2331_L_1_in$aliquot<-"R1"                     
D2331_L_2_in$aliquot<-"R2"
D2331_L <- rbind(D2331_L_1_in,D2331_L_2_in)
D2331_L$sample <-"D2331_L"
rm(D2331_L_1_in,D2331_L_2_in)

#sample 34  X 8   X 4             
D2136c_H_G1$aliquot<-"R1"                     
D2136c_H_G2$aliquot<-"R2"                   
D2136c_H_G <- rbind(D2136c_H_G1,D2136c_H_G2)
D2136c_H_G$sample <-"D2136c_H_G"
rm(D2136c_H_G1,D2136c_H_G2)

D2136c_H_M1$aliquot<-"R1"                     
D2136c_H_M2$aliquot<-"R2"
D2136c_H_M <- rbind(D2136c_H_M1,D2136c_H_M2)
D2136c_H_M$sample <-"D2136c_H_M"
rm(D2136c_H_M1,D2136c_H_M2)

D2136c_K_1_i$aliquot<-"R1"                     
D2136c_K_2_i$aliquot<-"R2"
D2136c_K <- rbind(D2136c_K_1_i,D2136c_K_2_i)
D2136c_K$sample <-"D2136c_K"
rm(D2136c_K_1_i,D2136c_K_2_i)

D2136c_L_1_i$aliquot<-"R1"                     
D2136c_L_2_i$aliquot<-"R2"
D2136c_L <- rbind(D2136c_L_1_i,D2136c_L_2_i)
D2136c_L$sample <-"D2136c_L"
rm(D2136c_L_1_i,D2136c_L_2_i)





week_1 <- rbind(D2032_H_G,D208_H_G,D2136_H_G, D442_H_G,D1160_H_G, 
D1248_H_G,D1248p_H_G, D2201_H_G,D2211_H_G,D268p_H_G, 
D272p_H_G,D442p_H_G,D946p_H_G,D1160p_H_G, D198_H_G,
D946_H_G, D2257_H_G,D2262_H_G,D268a_H_G,D268b_H_G, 
D198ba_H_G, D2257c_H_G, D272aa_H_G, D272ba_H_G, D093_H_G,
D1210_H_G,D2255_H_G,D2542_H_G,D2539_H_G,D2331_H_G, 
D2136c_H_G,D198p_H_G,D2350_H_G,D2215_H_G
)


				
				
#write.csv(week_1, "Samples.csv", row.names = FALSE)


#Subset to only productive genes
table(week_1$productive)
table(week_1$locus)
week_1_prod <- subset (week_1, productive == TRUE)

write.csv(week_1_prod, "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Output/Final/H/SamplesH2612024.csv", row.names = FALSE)

#NB added

week_1_prod <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Output/Final/H/SamplesH2612024.csv")

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
week_1_prod$Hiv_Status[week_1_prod$sample =="D2032_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2136_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2211_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2201_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D442p_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1160p_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1248p_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D946p_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D268p_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D272p_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D198p_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2350_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2215_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2542_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2539_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2331_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2255_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2262_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2257_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2136c_H_G"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2257c_H_G"] <- "HIV_negative"

week_1_prod$Hiv_Status[week_1_prod$sample =="D442_H_G"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1160_H_G"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1248_H_G"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1210_H_G"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D946_H_G"] <- "PLWH_early_treated"

week_1_prod$Hiv_Status[week_1_prod$sample =="D208_H_G"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D198_H_G"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D268a_H_G"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D093_H_G"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D272aa_H_G"] <- "PLWH_late_treated"

week_1_prod$Hiv_Status[week_1_prod$sample =="D268b_H_G"] <- "PRE_ART"
week_1_prod$Hiv_Status[week_1_prod$sample =="D272ba_H_G"] <- "PRE_ART"
week_1_prod$Hiv_Status[week_1_prod$sample =="D198ba_H_G"] <- "PRE_ART"


#################################################################################################
write.csv(week_1_prod, "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Output/Final/H/SamplesH2612024.csv", row.names = FALSE)
################################################################################################
#Gene family     
gene <- countGenes(week_1_prod, gene="v_call", groups="sample", mode="family")
gene1 <- countGenes(week_1_prod, gene="j_call", groups="sample", mode="family")
gene2 <- countGenes(week_1_prod, gene="d_call", groups="sample", mode="family")
################################################################################################
csvname <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Output/Final/H/H_V_family_f.csv",sep="")
csvname1 <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Output/Final/H/H_J_family_f.csv",sep="")
csvname2 <-  paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Output/Final/H/H_D_family_f.csv",sep="")
write.csv(gene, csvname, row.names = FALSE)
write.csv(gene1, csvname1, row.names = FALSE)
write.csv(gene2, csvname2, row.names = FALSE)
################################################################################################
#Gene Subfamily     
gene <- countGenes(week_1_prod, gene="v_call", groups="sample", mode="gene")
gene1 <- countGenes(week_1_prod, gene="j_call", groups="sample", mode="gene")
gene2 <- countGenes(week_1_prod, gene="d_call", groups="sample", mode="gene")
csvname <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Output/Final/H/H_V_Subfamily_f.csv",sep="")
csvname1 <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Output/Final/H/H_J_Subfamily_f.csv",sep="")
csvname2 <-  paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Output/Final/H/H_D_Subfamil_f.csv",sep="")
write.csv(gene, csvname, row.names = FALSE)
write.csv(gene1, csvname1, row.names = FALSE)
write.csv(gene2, csvname2, row.names = FALSE)
###################################################################################################


#week_1_prod <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Output/Final/H/H_V_family_f1.csv")
###################################################################################################
# Define the base directory
#base_dir <- "/mnt/data/B_cell_repertoire/Run_5_Repeat_24042024/Output/"

# List all folder names in the base directory
#folders <- list.dirs(base_dir, full.names = TRUE, recursive = FALSE)

# Define the target file name in each folder
#file_name <- "FIN_collapse-unique_igblast_db-pass.tsv"

# Create a function to read the files
#read_files <- function(folder) {
#  file_path <- file.path(folder, file_name) # Construct the full file path
#  if (file.exists(file_path)) {            # Check if the file exists
#    read_rearrangement(file_path)          # Read the file
#  } else {
#    warning(paste("File not found in folder:", folder)) # Handle missing files
#    return(NULL)
#  }
#}

# Function to sanitize folder names
#sanitize_name <- function(name) {
#  gsub("[-.]", "_", name) # Replace hyphens and dots with underscores
#}

# Read files and assign them directly as variables
#for (folder in folders) {
#  folder_name <- basename(folder)         # Extract the folder name
#  sanitized_name <- sanitize_name(folder_name) # Sanitize the name
#  data <- read_files(folder)              # Read the file
#  if (!is.null(data)) {
#    assign(sanitized_name, data)          # Assign the data frame to a variable
#  }
#}
###################################################################################################








