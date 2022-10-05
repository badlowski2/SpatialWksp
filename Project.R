##############################
##### THIS IS A PROJECT ######
##############################

## Project: Widespread seagrass die off in Florida Bay
## By: Gina A. Badlowski
## September 30 2022
## Version 1.0

## This script is for a Multiscale Analysis using a buffer on the florida bay 
## data 

## libraries needed
library(terra)

## sources

## local functions

###### start script ###################################
setwd("S:/Spatial Project/James_etal_ICES_JMS-main/James_etal_ICES_JMS-main")

d1<- read.csv('James_etal_ICES_JMS_sites.csv')
d2<- read.csv('James_etal_ICES_JMS_consumerIso.csv')

## load data
# raster data
data<- rast('FLBay_Apr21UTM.tif') ## this raster is in UTM coordination 
x11();plot(data)

# point data
pdata<- read.csv('James_etal_ICES_JMS_sites.csv') ## this data is in lat and long

## need to get the point data projected onto the raster but in correct type of coordinate system

# spatial vector (terra)
pdata_v <- terra::vect(pdata,geom=c('lon','lat'),crs='EPSG:4326') ## need to find out what ESPG data was collected

{   # project points from GCS WGS 84 to UTM 17N
  pdata_GCS <- terra::project(pdata_v,'EPSG:32617')
  geom(pdata_GCS) # coordinates were converted to UTM
}

# plot grid points on raster image
plot(pdata_GCS,add=TRUE,pch=19.,col='black') 

