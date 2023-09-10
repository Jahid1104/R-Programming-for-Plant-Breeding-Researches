
#loadlibraries
library(FIELDimageR)
library(raster)

#Select target file
EX1 <- stack(file.choose())
plotRGB(EX1, r = 1, g = 2, b = 3)   #plot the file

#image cropping
EX1.Crop <- fieldCrop(mosaic = EX1) # For heavy images (large, high resolution, etc.) please use: fast.plot=T



#image rotation
# Codeline when you don't know the rotation angle "Theta":
EX1.Rotated <- fieldRotate(mosaic = EX1.Crop, clockwise = F, h=F) # h=horizontal

# Codeline when you know the rotation angle "Theta" (theta = 2.3):
# EX1.Rotated <- fieldRotate(mosaic = EX1.Crop, theta = 2.3)

# Codeline with "extentGIS=TRUE" to fit back the shapefile to the original image GIS. More information at section "5. Building the plot shape file":
# EX1.Rotated<-fieldRotate(mosaic = EX1.Crop, theta = 2.3, extentGIS=TRUE)


#Removing soil using vegetation indices
EX1.RemSoil <- fieldMask(mosaic = EX1.Rotated, Red = 1, Green = 2, Blue = 3, index = "HUE")


#Building the plot shape file (ncols nrows as per design)
EX1.Shape<-fieldShape(mosaic = EX1.RemSoil,ncols = 14, nrows = 9)




### Field map identification (name for each Plot). 'fieldPlot' argument can be a number or name.

DataTable<-read.csv("DataTable.csv",header = T)  
fieldMap<-fieldMap(fieldPlot=DataTable$Plot, fieldColumn=DataTable$Row, fieldRow=DataTable$Range, decreasing=T)
fieldMap

# The new column PlotName is identifying the plots:
EX1.Shape<-fieldShape(mosaic = EX1.RemSoil, ncols = 14, nrows = 9, fieldMap = fieldMap)




### Joing all information in one "fieldShape" file:

EX1.Shape<-fieldShape(mosaic = EX1.RemSoil, ncols = 14, nrows = 9, fieldMap = fieldMap, 
                      fieldData = DataTable, ID = "Plot")

# The new column PlotName is identifying the plots:                      
EX1.Shape$fieldShape@data                      




# Calculating myIndex = "(Red-Blue)/Green" (not avaliable at 'FIELDimageR')

EX1.Indices<- fieldIndex(mosaic = EX1.RemSoil$newMosaic, Red = 1, Green = 2, Blue = 3, 
                         index = c("NGRDI","BGI"), 
                         myIndex = c("(Red-Blue)/Green"))

# More than one myIndex code: myIndex = c("myIndex1","myIndex2","myIndex3")    

EX1.Indices.myIndex<- fieldIndex(mosaic = EX1.RemSoil$newMosaic, Red = 1, Green = 2, Blue = 3, 
                                 index = c("NGRDI","BGI"), 
                                 myIndex = c("(Red-Blue)/Green","Red/Green","Blue/Green"))



EX1.Indices.BGI<- fieldIndex(mosaic = EX1.Rotated, index = c("BGI"))

dev.off()
hist(EX1.Indices.BGI$BGI) # Image segmentation start from 0.7 (soil and plants)

EX1.BGI<- fieldMask(mosaic = EX1.Rotated, Red = 1, Green = 2, Blue = 3, 
                    index = "BGI", cropValue = 0.8, cropAbove = T) 

#Check if: cropValue=0.8 or cropValue=0.6 works better.






#Counting the number of objects (e.g. plants, seeds, etc)
EX1.SC<- fieldCount(mosaic = EX1.RemSoil$mask, fieldShape = EX1.Shape$fieldShape, value = 0, minSize=0.001, cex=0.4, pch=16, col="blue", na.rm=F)
EX1.SC$fieldCount

### Parallel (n.core = 3)
EX1.SC<-fieldCount(mosaic = EX1.RemSoil$mask, fieldShape = EX1.Shape$fieldShape, n.core = 3, cex=0.4, col="blue")
EX1.SC$fieldCount

