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
D1160_K_1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_K_1_S2/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_K_2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_K_2_S3/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160_L_1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_L_1_S2/FIN_collapse-unique_igblast_db-pass.tsv")
D1160_L_2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160_L_2_S3/FIN_collapse-unique_igblast_db-pass.tsv")
D1160p_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1160p_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1248_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D1248_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D1248p_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1248p_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D1248p_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1248p_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2201_H_G1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_G1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_H_G2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_G2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_M1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_H_M2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_K_1_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_K_1_S1/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_K_2_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_K_2_S1/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2201_L_1_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_L_1_S1/FIN_collapse-unique_igblast_db-pass.tsv")
D2201_L_2_S1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2201_L_2_S1/FIN_collapse-unique_igblast_db-pass.tsv")
D2211_H_G1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_G1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_H_G2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_G2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_H_M1_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_M1_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_H_M2_S <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_H_M2_S/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_K_1_S3 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_K_1_S3/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_K_2_S7 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_K_2_S7/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2211_L_1_S4 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_L_1_S4/FIN_collapse-unique_igblast_db-pass.tsv")
D2211_L_2_S8 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2211_L_2_S8/FIN_collapse-unique_igblast_db-pass.tsv")
D268p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D268p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D272p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D272p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D442p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D442p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D442p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")

D946p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D946p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D946p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D1160p_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script


#Run 1

D2032_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2032_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2032_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2032_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D208_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D208_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D208_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D208_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D2136_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2136_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D442_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D442_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D442_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D442_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv")

#0972024
D198_H_G1_in <- read_rearrangement ("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D198_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D198_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv")


D198p_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198p_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D198p_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198p_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")

D2350_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2350_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2350_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2350_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")

D946_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D946_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D946_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D946_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv")


######################################################################################################################################
#19112024
D2257_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2257_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2262_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2262_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2262_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2262_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")
D268a_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_K_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_K_1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_K_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_K_2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268a_L_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_L_1_/FIN_collapse-unique_igblast_db-pass.tsv")
D268a_L_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268a_L_2_/FIN_collapse-unique_igblast_db-pass.tsv")
D268b_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_K_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_K_1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_K_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_K_2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D268b_L_1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_L_1_/FIN_collapse-unique_igblast_db-pass.tsv")
D268b_L_2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D268b_L_2_/FIN_collapse-unique_igblast_db-pass.tsv")

##################################################################################################
D2257c_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2257c_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2257c_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2257c_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv")

D198ba_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D198ba_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D198ba_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D198ba_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv")


D272aa_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272aa_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D272aa_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272aa_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv")


D272ba_H_G1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_H_G2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_H_M1_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_H_M2_ <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D272ba_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D272ba_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D272ba_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv")



#21112024

D1160p_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1160p_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1160p_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script

D093_H_G1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_G1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_H_G2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_G2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_H_M1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_M1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_H_M2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_H_M2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_K_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_K_1_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_K_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_K_2_ind/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D093_L_1_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_L_1_ind/FIN_collapse-unique_igblast_db-pass.tsv")
D093_L_2_ind <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D093_L_2_ind/FIN_collapse-unique_igblast_db-pass.tsv")

D1210_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D1210_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D1210_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D1210_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")

D2255_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2255_L_1_in<- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2255_L_2_in<- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2255_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")


D2215_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2215_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2215_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2215_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")

D2542_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2542_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2542_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2542_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")

D2539_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2539_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2539_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2539_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")

D2331_H_G1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_G1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_H_G2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_G2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_H_M1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_M1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_H_M2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_H_M2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_K_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_K_1_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_K_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_K_2_in/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2331_L_1_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_L_1_in/FIN_collapse-unique_igblast_db-pass.tsv")
D2331_L_2_in <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2331_L_2_in/FIN_collapse-unique_igblast_db-pass.tsv")

D2136c_H_G1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_G1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_H_G2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_G2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_H_M1 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_M1_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_H_M2 <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_H_M2_/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_K_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_K_1_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_K_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_K_2_i/FIN_collapse-unique_igblast_db-pass.tsv", n_max = 1)  # rerun: chain not used in this script
D2136c_L_1_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_L_1_i/FIN_collapse-unique_igblast_db-pass.tsv")
D2136c_L_2_i <- read_rearrangement("/mnt/data/B_cell_repertoire/Post/db_pass_complete/D2136c_L_2_i/FIN_collapse-unique_igblast_db-pass.tsv")


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
# L-ONLY COMBINATIONS FOR ALL SAMPLES (1–34)
###################################################################################################

#sample 1
D2032_L_1_in$aliquot <- "R1"
D2032_L_2_in$aliquot <- "R2"
D2032_L <- rbind(D2032_L_1_in, D2032_L_2_in)
D2032_L$sample <- "D2032_L"
rm(D2032_L_1_in, D2032_L_2_in)

#sample 2
D208_L_1_ind$aliquot <- "R1"
D208_L_2_ind$aliquot <- "R2"
D208_L <- rbind(D208_L_1_ind, D208_L_2_ind)
D208_L$sample <- "D208_L"
rm(D208_L_1_ind, D208_L_2_ind)

#sample 3
D2136_L_1_in$aliquot <- "R1"
D2136_L_2_in$aliquot <- "R2"
D2136_L <- rbind(D2136_L_1_in, D2136_L_2_in)
D2136_L$sample <- "D2136_L"
rm(D2136_L_1_in, D2136_L_2_in)

#sample 4
D442_L_1_ind$aliquot <- "R1"
D442_L_2_ind$aliquot <- "R2"
D442_L <- rbind(D442_L_1_ind, D442_L_2_ind)
D442_L$sample <- "D442_L"
rm(D442_L_1_ind, D442_L_2_ind)

#sample 5
D1160_L_1_S$aliquot <- "R1"
D1160_L_2_S$aliquot <- "R2"
D1160_L <- rbind(D1160_L_1_S, D1160_L_2_S)
D1160_L$sample <- "D1160_L"
rm(D1160_L_1_S, D1160_L_2_S)

#sample 6
D1248_L_1_in$aliquot <- "R1"
D1248_L_2_in$aliquot <- "R2"
D1248_L <- rbind(D1248_L_1_in, D1248_L_2_in)
D1248_L$sample <- "D1248_L"
rm(D1248_L_1_in, D1248_L_2_in)

#sample 7
D1248p_L_1_i$aliquot <- "R1"
D1248p_L_2_i$aliquot <- "R2"
D1248p_L <- rbind(D1248p_L_1_i, D1248p_L_2_i)
D1248p_L$sample <- "D1248p_L"
rm(D1248p_L_1_i, D1248p_L_2_i)

#sample 8
D2201_L_1_S1$aliquot <- "R1"
D2201_L_2_S1$aliquot <- "R2"
D2201_L <- rbind(D2201_L_1_S1, D2201_L_2_S1)
D2201_L$sample <- "D2201_L"
rm(D2201_L_1_S1, D2201_L_2_S1)

#sample 9
D2211_L_1_S4$aliquot <- "R1"
D2211_L_2_S8$aliquot <- "R2"
D2211_L <- rbind(D2211_L_1_S4, D2211_L_2_S8)
D2211_L$sample <- "D2211_L"
rm(D2211_L_1_S4, D2211_L_2_S8)

#sample 10
D268p_L_1_in$aliquot <- "R1"
D268p_L_2_in$aliquot <- "R2"
D268p_L <- rbind(D268p_L_1_in, D268p_L_2_in)
D268p_L$sample <- "D268p_L"
rm(D268p_L_1_in, D268p_L_2_in)

#sample 11
D272p_L_1_in$aliquot <- "R1"
D272p_L_2_in$aliquot <- "R2"
D272p_L <- rbind(D272p_L_1_in, D272p_L_2_in)
D272p_L$sample <- "D272p_L"
rm(D272p_L_1_in, D272p_L_2_in)

#sample 12
D442p_L_1_in$aliquot <- "R1"
D442p_L_2_in$aliquot <- "R2"
D442p_L <- rbind(D442p_L_1_in, D442p_L_2_in)
D442p_L$sample <- "D442p_L"
rm(D442p_L_1_in, D442p_L_2_in)

#sample 13
D946p_L_1_in$aliquot <- "R1"
D946p_L_2_in$aliquot <- "R2"
D946p_L <- rbind(D946p_L_1_in, D946p_L_2_in)
D946p_L$sample <- "D946p_L"
rm(D946p_L_1_in, D946p_L_2_in)

#sample 14
D1160p_L_1_i$aliquot <- "R1"
D1160p_L_2_i$aliquot <- "R2"
D1160p_L <- rbind(D1160p_L_1_i, D1160p_L_2_i)
D1160p_L$sample <- "D1160p_L"
rm(D1160p_L_1_i, D1160p_L_2_i)

#sample 15
D198_L_1_ind$aliquot <- "R1"
D198_L_2_ind$aliquot <- "R2"
D198_L <- rbind(D198_L_1_ind, D198_L_2_ind)
D198_L$sample <- "D198_L"
rm(D198_L_1_ind, D198_L_2_ind)

#sample 16
D198p_L_1_in$aliquot <- "R1"
D198p_L_2_in$aliquot <- "R2"
D198p_L <- rbind(D198p_L_1_in, D198p_L_2_in)
D198p_L$sample <- "D198p_L"
rm(D198p_L_1_in, D198p_L_2_in)

#sample 17
D2350_L_1_in$aliquot <- "R1"
D2350_L_2_in$aliquot <- "R2"
D2350_L <- rbind(D2350_L_1_in, D2350_L_2_in)
D2350_L$sample <- "D2350_L"
rm(D2350_L_1_in, D2350_L_2_in)

#sample 18
D946_L_1_ind$aliquot <- "R1"
D946_L_2_ind$aliquot <- "R2"
D946_L <- rbind(D946_L_1_ind, D946_L_2_ind)
D946_L$sample <- "D946_L"
rm(D946_L_1_ind, D946_L_2_ind)

#sample 19
D2257_L_1_in$aliquot <- "R1"
D2257_L_2_in$aliquot <- "R2"
D2257_L <- rbind(D2257_L_1_in, D2257_L_2_in)
D2257_L$sample <- "D2257_L"
rm(D2257_L_1_in, D2257_L_2_in)

#sample 20
D2262_L_1_in$aliquot <- "R1"
D2262_L_2_in$aliquot <- "R2"
D2262_L <- rbind(D2262_L_1_in, D2262_L_2_in)
D2262_L$sample <- "D2262_L"
rm(D2262_L_1_in, D2262_L_2_in)

#sample 21
D268a_L_1_$aliquot <- "R1"
D268a_L_2_$aliquot <- "R2"
D268a_L <- rbind(D268a_L_1_, D268a_L_2_)
D268a_L$sample <- "D268a_L"
rm(D268a_L_1_, D268a_L_2_)

#sample 22
D268b_L_1_$aliquot <- "R1"
D268b_L_2_$aliquot <- "R2"
D268b_L <- rbind(D268b_L_1_, D268b_L_2_)
D268b_L$sample <- "D268b_L"
rm(D268b_L_1_, D268b_L_2_)

#sample 23
D198ba_L_1_i$aliquot <- "R1"
D198ba_L_2_i$aliquot <- "R2"
D198ba_L <- rbind(D198ba_L_1_i, D198ba_L_2_i)
D198ba_L$sample <- "D198ba_L"
rm(D198ba_L_1_i, D198ba_L_2_i)

#sample 24
D2257c_L_1_i$aliquot <- "R1"
D2257c_L_2_i$aliquot <- "R2"
D2257c_L <- rbind(D2257c_L_1_i, D2257c_L_2_i)
D2257c_L$sample <- "D2257c_L"
rm(D2257c_L_1_i, D2257c_L_2_i)

#sample 25
D272aa_L_1_i$aliquot <- "R1"
D272aa_L_2_i$aliquot <- "R2"
D272aa_L <- rbind(D272aa_L_1_i, D272aa_L_2_i)
D272aa_L$sample <- "D272aa_L"
rm(D272aa_L_1_i, D272aa_L_2_i)

#sample 26
D272ba_L_1_i$aliquot <- "R1"
D272ba_L_2_i$aliquot <- "R2"
D272ba_L <- rbind(D272ba_L_1_i, D272ba_L_2_i)
D272ba_L$sample <- "D272ba_L"
rm(D272ba_L_1_i, D272ba_L_2_i)

#sample 27
D093_L_1_ind$aliquot <- "R1"
D093_L_2_ind$aliquot <- "R2"
D093_L <- rbind(D093_L_1_ind, D093_L_2_ind)
D093_L$sample <- "D093_L"
rm(D093_L_1_ind, D093_L_2_ind)

#sample 28
D1210_L_1_in$aliquot <- "R1"
D1210_L_2_in$aliquot <- "R2"
D1210_L <- rbind(D1210_L_1_in, D1210_L_2_in)
D1210_L$sample <- "D1210_L"
rm(D1210_L_1_in, D1210_L_2_in)

#sample 29
D2255_L_1_in$aliquot <- "R1"
D2255_L_2_in$aliquot <- "R2"
D2255_L <- rbind(D2255_L_1_in, D2255_L_2_in)
D2255_L$sample <- "D2255_L"
rm(D2255_L_1_in, D2255_L_2_in)

#sample 30
D2215_L_1_in$aliquot <- "R1"
D2215_L_2_in$aliquot <- "R2"
D2215_L <- rbind(D2215_L_1_in, D2215_L_2_in)
D2215_L$sample <- "D2215_L"
rm(D2215_L_1_in, D2215_L_2_in)

#sample 31
D2542_L_1_in$aliquot <- "R1"
D2542_L_2_in$aliquot <- "R2"
D2542_L <- rbind(D2542_L_1_in, D2542_L_2_in)
D2542_L$sample <- "D2542_L"
rm(D2542_L_1_in, D2542_L_2_in)

#sample 32
D2539_L_1_in$aliquot <- "R1"
D2539_L_2_in$aliquot <- "R2"
D2539_L <- rbind(D2539_L_1_in, D2539_L_2_in)
D2539_L$sample <- "D2539_L"
rm(D2539_L_1_in, D2539_L_2_in)

#sample 33
D2331_L_1_in$aliquot <- "R1"
D2331_L_2_in$aliquot <- "R2"
D2331_L <- rbind(D2331_L_1_in, D2331_L_2_in)
D2331_L$sample <- "D2331_L"
rm(D2331_L_1_in, D2331_L_2_in)

#sample 34
D2136c_L_1_i$aliquot <- "R1"
D2136c_L_2_i$aliquot <- "R2"
D2136c_L <- rbind(D2136c_L_1_i, D2136c_L_2_i)
D2136c_L$sample <- "D2136c_L"
rm(D2136c_L_1_i, D2136c_L_2_i)


#####################################################################################################################################
#Merge all the samples
week_1 <- rbind(
  D2032_L, D208_L, D2136_L, D442_L, D1160_L,
  D1248_L, D1248p_L, D2201_L, D2211_L, D268p_L,
  D272p_L, D442p_L, D946p_L, D1160p_L, D198_L,
  D198p_L, D2350_L, D946_L, D2257_L, D2262_L,
  D268a_L, D268b_L, D198ba_L, D2257c_L, D272aa_L,
  D272ba_L, D093_L, D1210_L, D2255_L, D2215_L,
  D2542_L, D2539_L, D2331_L, D2136c_L
)


#Subset to only productive genes
table(week_1$productive)
table(week_1$locus)
week_1_prod <- subset (week_1, productive == TRUE)

write.csv(week_1_prod, "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/SamplesL26122024.csv", row.names = FALSE)
#####################################################################################################################################
#NB added
week_1_prod <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/SamplesL26122024.csv")

###

week_1_prod  <- subset(week_1_prod, locus == "IGL")  # rerun: original referred to object `a` from an interactive session


#unique(Samples_LL$sample)
unique(week_1_prod$sample)
#Assigns Hiv Status column top the data
week_1_prod$Hiv_Status <- NA

#week_1_prod 
week_1_prod$Hiv_Status[week_1_prod$sample =="D2032_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2136_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2211_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2201_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D442p_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1160p_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1248p_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D946p_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D268p_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D272p_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D198p_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2350_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2215_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2542_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2539_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2331_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2255_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2262_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2257_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2136c_L"] <- "HIV_negative"
week_1_prod$Hiv_Status[week_1_prod$sample =="D2257c_L"] <- "HIV_negative"

week_1_prod$Hiv_Status[week_1_prod$sample =="D442_L"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1160_L"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1248_L"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D1210_L"] <- "PLWH_early_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D946_L"] <- "PLWH_early_treated"

week_1_prod$Hiv_Status[week_1_prod$sample =="D208_L"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D198_L"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D268a_L"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D093_L"] <- "PLWH_late_treated"
week_1_prod$Hiv_Status[week_1_prod$sample =="D272aa_L"] <- "PLWH_late_treated"

week_1_prod$Hiv_Status[week_1_prod$sample =="D268b_L"] <- "PRE_ART"
week_1_prod$Hiv_Status[week_1_prod$sample =="D272ba_L"] <- "PRE_ART"
week_1_prod$Hiv_Status[week_1_prod$sample =="D198ba_L"] <- "PRE_ART"

#################################################################################################
write.csv(week_1_prod, "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/SamplesL26122024.csv", row.names = FALSE)
#################################################################################################
#Gene family     
gene <- countGenes(week_1_prod, gene="v_call", groups="sample", mode="family")
gene1 <- countGenes(week_1_prod, gene="j_call", groups="sample", mode="family")
csvname <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/L_VL_family.csv",sep="")
csvname1 <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/L_JL_family.csv",sep="")
write.csv(gene, csvname, row.names = FALSE)
write.csv(gene1, csvname1, row.names = FALSE)
#################################################################################################
#Gene Subfamily     
gene <- countGenes(week_1_prod, gene="v_call", groups="sample", mode="gene")
gene1 <- countGenes(week_1_prod, gene="j_call", groups="sample", mode="gene")
csvname <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/L_VL_Subfamily.csv",sep="")
csvname1 <- paste("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/L_JL_Subfamily.csv",sep="")
write.csv(gene, csvname, row.names = FALSE)
write.csv(gene1, csvname1, row.names = FALSE)
################################################################################################# 
print("YAY, DONE_GO HOME")




# Define the function to add HIV Status
add_hiv_status <- function(file_paths) {
  # Define the mapping for HIV Status
  hiv_status_mapping <- list(
    HIV_negative = c("D2032_L", "D2136_L", "D2211_L", "D2201_L", "D442p_L", 
                     "D1160p_L", "D1248p_L", "D946p_L", "D268p_L", "D272p_L", 
                     "D198p_L", "D2350_L", "D2215_L", "D2542_L", "D2539_L", 
                     "D2331_L", "D2255_L", "D2262_L", "D2257_L", "D2136c_L", "D2257c_L"),
    PLWH_early_treated = c("D442_L", "D1160_L", "D1248_L", "D1210_L", "D946_L"),
    PLWH_late_treated = c("D208_L", "D198_L", "D268a_L", "D093_L", "D272aa_L"),
    PRE_ART = c("D268b_L", "D272ba_L", "D198ba_L")
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
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/L_VL_family.csv",
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/L_JL_family.csv",
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/L_VL_Subfamily.csv",
  "/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/L_JL_Subfamily.csv"
)

# Call the function
add_hiv_status(file_paths)




V_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/L_VL_family.csv", row.names = NULL, sep=',', header= TRUE)
J_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/L_JL_family.csv", row.names = NULL, sep=',', header= TRUE)
#Gene 
Vg_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/L_VL_Subfamily.csv", row.names = NULL, sep=',', header= TRUE)
Jg_call <- read.csv("/mnt/data/B_cell_repertoire/Visualization/Rerun_complete_db_20261023/Scripts/Vis2025/L/L_JL_Subfamily.csv", row.names = NULL, sep=',', header= TRUE)


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



# Specify the genes to include in the plot
#selected_genes <- selected_genes <- c("IGLV2", "IGLV1", "IGLV8", "IGLV5", "IGLV9")



# Filter the dataset to include only the selected genes
#V_call_filtered <- V_call %>%
#    filter(gene %in% selected_genes)


# Violin plot with boxplot in the middle
v <- ggplot(V_call, aes(x = reorder(gene, -seq_freq), y = seq_freq, fill = Hiv_Status)) +
  geom_violin(alpha = 0.7, scale = "width", position = position_dodge(width = 0.75)) +  # Violin plot
  geom_jitter(aes(fill = Hiv_Status),  # Fill color based on Hiv_Status
              position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), 
              size = 1, alpha = 0.9, stroke = 0.1, shape = 21, color = "black") +  # Jitter placed before boxplot
  geom_boxplot(width = 0.2, position = position_dodge(width = 0.75), 
               outlier.shape = NA, alpha = 1, color = "black", size = 0.45) + # Individual points
  labs(title = "Overall V Family Distributions",
       x = "Gene",
       y = "Frequency") +
  scale_fill_manual(values = mycolors) + # Customize violin and boxplot fill
  scale_color_manual(values = mycolors) + # Customize point colors
  #scale_y_log10() + # Apply log scale to the y-axis
  ylim(0, 0.75) + # Set y-axis limit
  theme_Publication() # Apply your preferred theme
  

print(v)

ggsave("L_VL_family.png", width = 10, height = 4, bg = "white")


# Specify the genes to include in the plot
selected_genes <- c(
  "IGLV2-14",
  "IGLV2-23",
  "IGLV8-61",
  "IGLV2-8",
  "IGLV1-44",
  "IGLV4-47",
  "IGLV2-18",
  "IGLV5-37"
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
               outlier.shape = NA, alpha = 1, color = "black", size = 0.45) + # Individual points
  labs(title = "Overall V Family Subfamily Distributions",
       x = "Gene",
       y = "Frequency") +
  scale_fill_manual(values = mycolors) + # Customize violin and boxplot fill
  scale_color_manual(values = mycolors) + # Customize point colors
  ylim(0, 0.75) + # Set y-axis limit
  theme_Publication() # Apply your preferred theme

ggsave("L_VL_Subfamily.png", width = 10, height = 4, bg = "white")


########################J

selected_genes <- selected_genes <-  c("IGLJ3", "IGLJ2", "IGLJ1")

# Filter the dataset to include only the selected genes
J_call_filtered <- J_call %>%
    filter(gene %in% selected_genes)


# Violin plot with boxplot in the middle
J <- ggplot(J_call, aes(x = reorder(gene, -seq_freq), y = seq_freq, fill = Hiv_Status)) +
  geom_violin(alpha = 0.7, scale = "width", position = position_dodge(width = 0.75)) +  # Violin plot
  geom_jitter(aes(fill = Hiv_Status),  # Fill color based on Hiv_Status
              position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.75), 
              size = 1, alpha = 0.9, stroke = 0.1, shape = 21, color = "black") +  # Jitter placed before boxplot
  geom_boxplot(width = 0.2, position = position_dodge(width = 0.75), 
               outlier.shape = NA, alpha = 1, color = "black", size = 0.45) + # Individual points
  labs(title = "Overall J Family Distributions",
       x = "Gene",
       y = "Frequency") +
  scale_fill_manual(values = mycolors) + # Customize violin and boxplot fill
  scale_color_manual(values = mycolors) + # Customize point colors
  ylim(0,0.75) + # Set y-axis limit
  theme_Publication() # Apply your preferred theme

ggsave("L_JL_family.png", width = 10, height = 4, bg = "white")


