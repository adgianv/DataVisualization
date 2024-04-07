# ==============================================================================
# Suggested libraries
# ==============================================================================
library(caret)
library(DMwR)
library(FNN)
library(foreign)
library(pracma)
library(pROC)
library(rminer)
library(stepPlr)
library(nnet)
library(ltm)
library(glmnet)
library(plyr)
library(kernlab)
library(ggplot2)
library(scales)
library(zoo)
library(lubridate)
library(chron)
library(stats)
library(shiny)
library(sp)
library(leaflet)
library(RColorBrewer)
library(dplyr)
library(rgdal)

# ==============================================================================
# Create a GeoJSON file where each postcode is represented with a latitude, 
# longitude value, together with minimum, maximum, mean and median house price.

# Open the GeoJSON file in the GIS application of your choice (e.g. QGIS) and
# color-code the data to give an overview of areas with high, medium and low 
# median house price.

# Instead of using median price, you could have been asked to color-code the mean 
# house price. Would that have given a better view of the house prices across the UK?
# ==============================================================================

# Load price paid data.
load("data/ppdata")

# Load file with postcodes and latitude/longitude
ukpostcodes <- read.csv("data/ukpostcodes.csv", header = TRUE, sep = ',')

# Create GeoJSON file
merge_data <- merge(ppdata, ukpostcodes, by = "postcode")
coordinates(merge_data) <- c("latitude", "longitude")
writeOGR(merge_data, "test_geojson", layer = "merge_data", driver = "GeoJSON")
