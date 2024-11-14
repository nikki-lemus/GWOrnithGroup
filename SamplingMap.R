#Sampling Map

#making a map of Kansas with locality information
#count how many birds were sampled from that locality
#change the size of the circle on the map to reflect sample size

library(ggplot2)
library(maps)
library(mapdata)

#set working directory
setwd("~/KU/Fall2024/GitHubWorkshop/GWOrnithGroup")

#read in sampling file
#columns named Latitude, Longitude, and species are of interest
data <- read.csv("./resurvey_data.csv")

#ignore data with missing coordinates
data <- data[!is.na(data$latitude),]
#generate list of unique latitudes
unq<-data[!duplicated(data$latitude),]
#for each unique latitude, find how many samples are from there by adding a sample size column
unq$sample.size<-as.vector(table(data$latitude)[order(match(names(table(data$latitude)),unq$latitude))])

#get map of Kansas
kansas <- subset(map_data("state"), region=="kansas")
#get map of Kansas counties
counties <- map_data("county")
ks_counties <- subset(counties, region=="kansas")

#plot figure
ggplot(data=kansas, mapping=aes(x=long, y=lat, group=group)) +
  geom_polygon(data=ks_counties, fill=NA, color="white") +
  geom_polygon(color="black", fill="gray") +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        rect = element_blank()) +
  #geom_point(data = unq, aes(x = Longitude, y = Latitude, color=Species, size=sample.size), show.legend=TRUE) +
  geom_point(data = unq, aes(x = longitude, y = latitude, size=sample.size), inherit.aes = FALSE, shape=21, colour="black") +
  geom_polygon(data=ks_counties, fill=NA, color="white") +
  geom_polygon(color="black", fill=NA) +
  labs(x = "", y = "", size="Count")
