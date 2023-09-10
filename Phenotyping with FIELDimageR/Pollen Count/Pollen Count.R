#install required package
install.packages("devtools")
devtools::install_github("OpenDroneMap/FIELDimageR")


#load libraries 
library(FIELDimageR)
library(raster)


# Uploading image
EX.P<-stack("file_name.jpeg")   #with file name
EX.P<-stack(file.choose())      #choose file


# Reducing image resolution (fast analysis)
EX.P<-aggregate(EX.P,fact=4) #change fact (0/1/2/3/4) value according to your image resolution 
plotRGB(EX.P, r = 1, g = 2, b = 3)

# Shapefile using the entire image (extent = T)
EX.P.shapeFile<-fieldPolygon(EX.P,extent = T)


# Using index "BIM" to remove background (change cropValue as required)
EX.P.R1<- fieldMask(mosaic = EX.P,index = "BIM", cropValue = 19, cropAbove = T)
plotRGB(EX.P.R1$newMosaic)

# Counting all pollens above 0.01 size (change minSize as required)
EX.P.Total<-fieldCount(mosaic = EX.P.R1$mask, fieldShape = EX.P.shapeFile$fieldShape, minSize = 0.01) 

