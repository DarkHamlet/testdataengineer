#############################################
###          Base de chilenos             ###
###                                       ###
###             2020-03-08                ###
###               Hamlet                  ###
#############################################

# Base del Servel: https://www.servel.cl/padron-electoral-por-nacionalidad-y-region-elecciones-abril-2021/
# RM - A13120 - noPass.txt es un .txt de ejemplo para probar cómo limpiar los espacios.


# erase memory
rm(list=ls())

# load .txt

setwd("C:\\Trabajo\\Applies\\Capitaria\\")

# Read TAB delimited files
file1 = "C:\\Trabajo\\Applies\\Capitaria\\PADRON_DEF_2021_MUNGORE.csv"; file1

#file <- read.delim(file.choose())
read.delim2(file, header = TRUE, sep = "\t", dec = ",")

my_data <- read.delim("PADRON_DEF_2021_MUNGORE.csv")