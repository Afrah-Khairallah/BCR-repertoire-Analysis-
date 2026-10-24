# Load required packages
library(alakazam)
library(dplyr)
library(scales)
library (airr)
library(RColorBrewer)

# Load data file

D1160_H_G1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_H_G1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_H_G2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_H_G2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_H_M1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_H_M1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_H_M2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_H_M2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_K_1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_K_1_S2/FIN_collapse-unique_igblast_db-pass.tsv")
D1160_K_2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_K_2_S3/FIN_collapse-unique_igblast_db-pass.tsv")
D1160_L_1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_L_1_S2/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_L_2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_L_2_S3/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1160p_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1160p_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D1248_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D1248_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1248p_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1248p_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_H_G1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_G1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_H_G2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_G2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_M1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_M2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_K_1_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_K_1_S1/FIN_collapse-unique_igblast_db-pass.tsv")
D2201_K_2_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_K_2_S1/FIN_collapse-unique_igblast_db-pass.tsv")
D2201_L_1_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_L_1_S1/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_L_2_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_L_2_S1/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_H_G1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_G1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_H_G2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_G2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_H_M1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_M1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_H_M2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_M2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_K_1_S3 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_K_1_S3/FIN_collapse-unique_igblast_db-pass.tsv")
D2211_K_2_S7 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_K_2_S7/FIN_collapse-unique_igblast_db-pass.tsv")
D2211_L_1_S4 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_L_1_S4/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_L_2_S8 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_L_2_S8/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D268p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D268p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D272p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D272p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D442p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D442p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D442p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D946p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D946p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D946p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


#Run 1

D2032_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2032_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2032_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D208_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D208_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2136_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2136_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D442_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D442_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

#0972024
D198_H_G1_in <- read_rearrangement ("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D198_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D198_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D198_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


D198p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D198p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D198p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2350_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2350_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2350_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D946_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D946_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D946_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


######################################################################################################################################
#19112024
D2257_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2257_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2257_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2262_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2262_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_K_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_K_1_/FIN_collapse-unique_igblast_db-pass.tsv")
D268a_K_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_K_2_/FIN_collapse-unique_igblast_db-pass.tsv")
D268a_L_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_L_1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_L_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_L_2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_K_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_K_1_/FIN_collapse-unique_igblast_db-pass.tsv")
D268b_K_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_K_2_/FIN_collapse-unique_igblast_db-pass.tsv")
D268b_L_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_L_1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_L_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_L_2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

##################################################################################################
D2257c_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2257c_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2257c_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D198ba_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D198ba_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D198ba_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


D272aa_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D272aa_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D272aa_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


D272ba_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D272ba_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D272ba_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script



#21112024

D1160p_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D093_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D093_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D093_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D1210_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D1210_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D1210_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2255_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2255_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2255_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


D2215_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2215_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2215_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2542_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2542_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2542_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2539_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2539_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2539_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2331_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2331_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2331_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D2136c_H_G1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_H_G2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2136c_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv")
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
#

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
D2257_L <- rbind(D2257_L_1_in, D2257_L_2_in)
D2257_L$sample <- "D2257_L"
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
D2257c_K$sample <- "D2257c_K"
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
D272aa_K$sample <- "D272aa_K"
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

#sample 34  X 8                  
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



week_1 <- rbind(D2032_K, D208_K, D2136_K, D442_K, D1160_K,
D1248_K, D1248p_K, D2201_K, D2211_K, D268p_K,D272p_K, D442p_K,
D946p_K, D1160p_K, D198_K,D198p_K, D2350_K, D946_K, D2257_K,
D2262_K,D268a_K, D268b_K, D198ba_K, D2257c_K, D272aa_K,D272ba_K,
D093_K, D1210_K, D2255_K, D2215_K,D2542_K, D2539_K, D2331_K, D2136c_K)



#week_1 <- rbind(D2032_K, D208_K, D2136_K, D442_K, D1160_K,
#D1248_K, D1248p_K, D2201_K, D2211_K, D268p_K,D272p_K, D442p_K,
# D946p_K, D1160p_K, D198_K,D198p_K, D2350_K, D946_K, D2257_K,
# D2262_K,D268a_K, D268b_K, D198ba_K, D2257c_K, D272aa_K,D272ba_K,
#  D093_K, D1210_K, D2255_K, D2215_K,D2542_K, D2539_K, D2331_K, D2136c_K)


#Subset to only productive genes
table(week_1$productive)
table(week_1$locus)
week_1_prod <- subset (week_1, productive == TRUE)

write.csv(week_1_prod, "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/SamplesK26122024.csv", row.names = FALSE)

#################################################################################################
week_1_prod <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/SamplesK26122024.csv")

week_1_prod$Hiv_Status <- NA
unique(week_1_prod$sample)
# Assign sample Hiv status for families files
#week_1_prod 
#5 Assign sample Hiv status for families files
#week_1_prod 
week_1_prod$Hiv_Status[week_1_prod$sample =="D2032_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2136_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2211_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2201_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D442p_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1160p_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1248p_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D946p_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D268p_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D272p_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D198p_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2350_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2215_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2542_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2539_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2331_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2255_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2262_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2257_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2136c_K"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2257c_K"] <- "HIV_negative"

week_1_prod$Hiv_Status[week_1_prod$sample =="D442_K"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1160_K"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1248_K"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1210_K"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D946_K"] <- "PLWH_early_treated"

week_1_prod$Hiv_Status[week_1_prod$sample =="D208_K"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D198_K"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D268a_K"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D093_K"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D272aa_K"] <- "PLWH_late_treated"

week_1_prod$Hiv_Status[week_1_prod$sample =="D268b_K"] <- "PRE_ART"
week_1_prod$Hiv_Status[week_1_prod$sample =="D272ba_K"] <- "PRE_ART"
week_1_prod$Hiv_Status[week_1_prod$sample =="D198ba_K"] <- "PRE_ART"
#################################################################################################
write.csv(week_1_prod, "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/SamplesK26122024.csv", row.names = FALSE)
#################################################################################################
#Gene family     
gene <- countGenes(week_1_prod, gene="v_call", groups="sample", mode="family")
gene1 <- countGenes(week_1_prod, gene="j_call", groups="sample", mode="family")
csvname <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/L_VK_family.csv",sep="")
csvname1 <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/L_JK_family.csv",sep="")
write.csv(gene, csvname, row.names = FALSE)
write.csv(gene1, csvname1, row.names = FALSE)
################################################################################################
#Gene Subfamily     
gene <- countGenes(week_1_prod, gene="v_call", groups="sample", mode="gene")
gene1 <- countGenes(week_1_prod, gene="j_call", groups="sample", mode="gene")
csvname <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/L_VK_Subfamily.csv",sep="")
csvname1 <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/L_JK_Subfamily.csv",sep="")
write.csv(gene, csvname, row.names = FALSE)
write.csv(gene1, csvname1, row.names = FALSE)
##############################################################################################
print("YAY, DONE_GO HOME")
################################################################################################
# Define the function to add HIV Status
add_hiv_status <- function(file_paths) {
  # Define the mapping for HIV Status
  hiv_status_mapping <- list(
    HIV_negative = c("D2032_K", "D2136_K", "D2211_K", "D2201_K", "D442p_K", 
                     "D1160p_K", "D1248p_K", "D946p_K", "D268p_K", "D272p_K", 
                     "D198p_K", "D2350_K", "D2215_K", "D2542_K", "D2539_K", 
                     "D2331_K", "D2255_K", "D2262_K", "D2257_K", "D2136c_K", "D2257c_K"),
    PLWH_early_treated = c("D442_K", "D1160_K", "D1248_K", "D1210_K", "D946_K"),
    PLWH_late_treated = c("D208_K", "D198_K", "D268a_K", "D093_K", "D272aa_K"),
    PRE_ART = c("D268b_K", "D272ba_K", "D198ba_K")
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
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/L_VK_family.csv",
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/L_JK_family.csv",
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/L_VK_Subfamily.csv",
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/L_JK_Subfamily.csv"
)

# Call the function
add_hiv_status(file_paths)




V_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/L_VK_family.csv", row.names = NULL, sep=',', header= TRUE)
J_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/L_JK_family.csv", row.names = NULL, sep=',', header= TRUE)
#Gene 
Vg_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/L_VK_Subfamily.csv", row.names = NULL, sep=',', header= TRUE)
Jg_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/K/L_JK_Subfamily.csv", row.names = NULL, sep=',', header= TRUE)



mycolors <- c(
  "HIV_negative" = "#00b09a",
  "PLWH_early_treated" = "#d55e00",
  "PLWH_late_treated" = "#9467bd",
  "PRE_ART" = "#56b4e9"
)


# Define consistent factor levels for Hiv_Status
hiv_levels <- c("HIV_negative", "PLWH_early_treated", "PRE_ART", "PLWH_late_treated")

# Apply factor levels to all datasets
datasets <- list(V_call, J_call, Vg_call, Jg_call)

for (i in seq_along(datasets)) {
  if ("Hiv_Status" %in% colnames(datasets[[i]])) {
    datasets[[i]]$Hiv_Status <- factor(datasets[[i]]$Hiv_Status, levels = hiv_levels)
  }
}

# Assign back to original variables
V_call <- datasets[[1]]
J_call <- datasets[[2]]
Vg_call <- datasets[[3]]
Jg_call <- datasets[[4]]




theme_Publication <- function(base_size = 14, base_family = "sans") {
  library(ggplot2)
  library(grid)
  library(ggthemes)
  
  theme_foundation(base_size = base_size, base_family = base_family) +
    theme(
      plot.title       = element_text(face = "bold", size = rel(1.2), hjust = 0.5),
      text             = element_text(),
      panel.background = element_rect(fill = "white", colour = NA),  # white background
      plot.background  = element_rect(fill = "white", colour = NA),  # white background
      panel.border     = element_rect(colour = NA),
      axis.title       = element_text(face = "bold", size = rel(1)),
      axis.title.y     = element_text(angle = 90, vjust = 2),
      axis.title.x     = element_text(vjust = 0),
      axis.text.x      = element_text(angle = 45, vjust = 1, hjust = 1),
      axis.line        = element_line(colour = "black"),
      axis.ticks       = element_line(),
      panel.grid.major = element_line(colour = "#f0f0f0"),
      panel.grid.minor = element_blank(),
      legend.key       = element_rect(colour = NA),
      legend.margin    = margin(),
      legend.text      = element_text(size = rel(0.8)),
      legend.title     = element_text(face = "bold"),
      legend.position  = "right"
    )
}

pacman::p_load(dplyr, ggplot2, ggthemes, grid, rstatix, ggpubr, rlang, glue)

## Significance (commented out — uncomment to run)
#stat.test <- V_call %>%
#  group_by(gene) %>%
#  wilcox_test(seq_freq ~ Hiv_Status, ref.group = "HIV_negative")
#stat.test <- stat.test %>%
#  add_xy_position(x = "gene", dodge = 0.75)

library(pacman)
p_load(dplyr, ggplot2, ggthemes, grid, rstatix, ggpubr, rlang, glue)

# ------------------------------------------------------------------------------
# Mean vs Median — Light Chain K V Family
# ------------------------------------------------------------------------------
cat("\n--- Light Chain K V Family: Mean vs Median per gene per HIV group ---\n")
V_call %>%
  group_by(gene) %>%
  summarise(
    mean_freq   = round(mean(seq_freq,   na.rm = TRUE), 4),
    median_freq = round(median(seq_freq, na.rm = TRUE), 4),
    diff        = round(mean_freq - median_freq, 4),
    n           = n(),
    .groups     = "drop"
  ) %>%
  arrange(desc(median_freq)) %>%
  print()

# V Family violin plot — ordered by MEDIAN
v <- ggplot(V_call, aes(x = reorder(gene, -seq_freq, FUN = median), y = seq_freq, fill = Hiv_Status)) +
  geom_violin(alpha = 0.7, scale = "width", position = position_dodge(width = 0.75)) +
  geom_jitter(aes(fill = Hiv_Status),
              position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75),
              size = 1, alpha = 0.9, stroke = 0.1, shape = 21, color = "black") +
  geom_boxplot(width = 0.2, position = position_dodge(width = 0.75),
               outlier.shape = NA, alpha = 1, color = "black", size = 0.45) +
  labs(title = "Overall V Family Distributions", x = "Gene", y = "Frequency") +
  scale_fill_manual(values = mycolors) +
  scale_color_manual(values = mycolors) +
  ylim(0, 1) +
  theme_Publication()

print(v)
ggsave("L_K_family.png", width = 10, height = 4, dpi = 600, bg = "white")


# Specify the genes to include in the V subfamily plot
selected_genes <- c(
  "IGKV1-39", "IGKV3-20", "IGKV3-15", "IGKV1-33",
  "IGKV1-27", "IGKV4-1",  "IGKV1-5",  "IGKV1-6",
  "IGKV1-16", "IGKV1-12"
)

Vg_call_filtered <- Vg_call %>% filter(gene %in% selected_genes)

# ------------------------------------------------------------------------------
# Mean vs Median — Light Chain K V Subfamily
# ------------------------------------------------------------------------------
cat("\n--- Light Chain K V Subfamily: Mean vs Median per gene per HIV group ---\n")
Vg_call_filtered %>%
  group_by(gene) %>%
  summarise(
    mean_freq   = round(mean(seq_freq,   na.rm = TRUE), 4),
    median_freq = round(median(seq_freq, na.rm = TRUE), 4),
    diff        = round(mean_freq - median_freq, 4),
    n           = n(),
    .groups     = "drop"
  ) %>%
  arrange(desc(median_freq)) %>%
  print()

# V Subfamily violin plot — ordered by MEDIAN
v <- ggplot(Vg_call_filtered, aes(x = reorder(gene, -seq_freq, FUN = median), y = seq_freq, fill = Hiv_Status)) +
  geom_violin(alpha = 0.7, scale = "width", position = position_dodge(width = 0.75)) +
  geom_jitter(aes(fill = Hiv_Status),
              position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75),
              size = 1, alpha = 0.9, stroke = 0.1, shape = 21, color = "black") +
  geom_boxplot(width = 0.2, position = position_dodge(width = 0.75),
               outlier.shape = NA, alpha = 1, color = "black", size = 0.45) +
  labs(title = "Overall V Family Subfamily Distributions", x = "Gene", y = "Frequency") +
  scale_fill_manual(values = mycolors) +
  scale_color_manual(values = mycolors) +
  ylim(0, 0.75) +
  theme_Publication()

ggsave("L_K_Subfamily.png", width = 10, height = 4, dpi = 600, bg = "white")


######################## J

# ------------------------------------------------------------------------------
# Mean vs Median — Light Chain K J Family
# ------------------------------------------------------------------------------
cat("\n--- Light Chain K J Family: Mean vs Median per gene per HIV group ---\n")
J_call %>%
  group_by(gene) %>%
  summarise(
    mean_freq   = round(mean(seq_freq,   na.rm = TRUE), 4),
    median_freq = round(median(seq_freq, na.rm = TRUE), 4),
    diff        = round(mean_freq - median_freq, 4),
    n           = n(),
    .groups     = "drop"
  ) %>%
  arrange(desc(median_freq)) %>%
  print()

# J Family violin plot — ordered by MEDIAN
J <- ggplot(J_call, aes(x = reorder(gene, -seq_freq, FUN = median), y = seq_freq, fill = Hiv_Status)) +
  geom_violin(alpha = 0.7, scale = "width", position = position_dodge(width = 0.75)) +
  geom_jitter(aes(fill = Hiv_Status),
              position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75),
              size = 1, alpha = 0.9, stroke = 0.1, shape = 21, color = "black") +
  geom_boxplot(width = 0.2, position = position_dodge(width = 0.75),
               outlier.shape = NA, alpha = 1, color = "black", size = 0.45) +
  labs(title = "Overall J Family Distributions", x = "Gene", y = "Frequency") +
  scale_fill_manual(values = mycolors) +
  scale_color_manual(values = mycolors) +
  ylim(0, 0.75) +
  theme_Publication()

ggsave("L_JK_family.png", width = 10, height = 4, dpi = 600, bg = "white")
