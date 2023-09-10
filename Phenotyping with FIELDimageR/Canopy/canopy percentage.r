#install packages
install.packages("devtools")
devtools::install_github("OpenDroneMap/FIELDimageR")

#package site: https://github.com/OpenDroneMap/FIELDimageR


#load libraries
library(FIELDimageR)
library(raster)

# Uploading file
EX.SC<-stack(file.choose())   #choose your file from directory
plotRGB(EX.SC, r = 1, g = 2, b = 3)

# Removing the soil
EX.SC.RemSoil<- fieldMask(mosaic = EX.SC, Red = 1, Green = 2, Blue = 3, index = "HUE")

# Building the plot shapefile (ncols = 1 and nrows = 7), change the values as required
EX.SC.Shape<-fieldShape(mosaic = EX.SC.RemSoil,ncols = 1, nrows = 7)

#evaluate area 
EX.SC.Canopy<-fieldArea(mosaic = EX.SC.RemSoil$mask, fieldShape = EX.SC.Shape$fieldShape)
EX.SC.Canopy$areaPorcent

#result:
#objNumCell is the area covered
#naNumCell is the area in a row
#objArea is ratio or prcentage of objNumCell and naNumCell

### Parallel (n.core = 3)
#similar as previous command, slight fast
EX.SC.Canopy<-fieldArea(mosaic = EX.SC.RemSoil$mask, fieldShape = EX.SC.Shape$fieldShape, n.core = 3)
EX.SC.Canopy$areaPorcent
