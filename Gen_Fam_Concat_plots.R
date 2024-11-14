# set directory----------------------------------------------------------------
setwd("C:/R_BIOL_701/")

# read in the .csv ------------------------------------------------------------
Bunkers_Birds <- read.csv("resurvey_data.csv")
# visualize to ensure data has been read in correctly--------------------------
View(Bunkers_Birds)

# load up tidyverse for ggplot use---------------------------------------------
library(tidyverse)

# convert subsetted data to table format---------------------------------------
species_counts <- table(Bunkers_Birds$genusspeciesconcat)
species_counts

# convert to data frame in order to plot---------------------------------------
species_counts.df <- as.data.frame(species_counts)
# name columns for easier recall-----------------------------------------------
colnames(species_counts.df) <- c("genussppconcat","count")
species_counts.df

species_counts.df$color <- rep(c("blue", "red"), length.out = nrow(species_counts.df))

# load ggplot2 ----------------------------------------------------------------
library(ggplot2)

# ggplot-----------------------------------------------------------------------
ggplot(species_counts.df, aes(genussppconcat,count)) + # data, aes(colnames)
  geom_bar(stat = "identity", fill = species_counts.df$color) +
theme(axis.text.x = element_text(angle = 69, hjust = 1)) # angle change nice

# graphing by family-----------------------------------------------------------

div_fam <- table(Bunkers_Birds$family)
div_fam

div_fam.df <- as.data.frame(div_fam)
colnames(div_fam.df) <- c("Family","count")
div_fam.df

div_fam.df$color <- rep(c("#4B9CD3", "#D478A8"), length.out = nrow(div_fam.df))

library(ggplot2)

ggplot(div_fam.df, aes(Family,count)) +
  geom_bar(stat = "identity", fill = div_fam.df$color) +
  theme(axis.text.x = element_text(angle = 69, hjust = 1))+
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.background = element_rect(fill = "lightgray"), 
    plot.background = element_rect(fill = "white"),      
    panel.grid.major = element_line(color = "black"),    
    panel.grid.minor = element_line(color = "black")     
  )

# graphing by Genus------------------------------------------------------------

div_gen <- table(Bunkers_Birds$genus)
div_gen

div_gen.df <- as.data.frame(div_gen)
colnames(div_gen.df) <- c("Genus","count")
div_gen.df

div_gen.df$color <- rep(c("skyblue", "pink"), length.out = nrow(div_gen.df))
div_gen.df

ggplot(div_gen.df, aes(Genus,count)) +
  geom_bar(stat = "identity",fill = div_gen.df$color) +
  theme(axis.text.x = element_text(angle = 69, hjust = 1))

