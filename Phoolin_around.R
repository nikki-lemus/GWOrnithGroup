setwd("C:/R_BIOL_701/")

Bunkers_Birds <- read.csv("resurvey_data.csv")
View(Bunkers_Birds)

library(tidyverse)

species_counts <- table(Bunkers_Birds$genusspeciesconcat)
species_counts

species_counts.df <- as.data.frame(species_counts)
colnames(species_counts.df) <- c("genussppconcat","count")

library(ggplot2)

ggplot(species_counts.df, aes(genussppconcat,count)) +
  geom_bar(stat = "identity") +
theme(axis.text.x = element_text(angle = 90, hjust = 1))











?barplot
















