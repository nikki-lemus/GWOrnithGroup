#Sampling Map

#making a map of Kansas with locality information
#count how many birds were sampled from that locality
#change the size of the circle on the map to reflect sample size

library(ggplot2)
library(maps)
library(mapdata)

#set working directory
setwd("~/KU/Fall2024/GitHubWorkshop/GW_ornith_group")

#read in sampling file
#columns named Latitude, Longitude, and species are of interest
data <- read.csv("./resurvey_data.csv")

#generate list of unique latitudes
unq<-data[!duplicated(data$Latitude),]
#for each unique latitude, find how many samples are from there by adding a sample size column
unq$sample.size<-as.vector(table(data$Latitude)[order(match(names(table(data$Latitude)),unq$Latitude))])

#get map of Kansas from rgeoboundaries
kansas <- subset(map_data("state"), region=="kansas")
#set how big you want boundaries around points to be
g=1
#subset map outline based on sampling
phil_bound <- st_crop(phil_bound, xmin = min(unq$Longitude)-g, xmax = max(unq$Longitude)+g,
                      ymin = min(unq$Latitude)-g, ymax = max(unq$Latitude)+g)

#plot figure
ggplot(data=kansas, mapping=aes(x=long, y=lat, group=group)) +
  geom_polygon(color="black", fill="gray") +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        rect = element_blank()) +
  #geom_point(data = unq, aes(x = Longitude, y = Latitude, color=Species, size=sample.size), show.legend=TRUE) +
  #geom_point(data = unq, aes(x = Longitude, y = Latitude, size=sample.size), shape=21, colour="black")+
  labs(x = "", y = "", size="Count")
