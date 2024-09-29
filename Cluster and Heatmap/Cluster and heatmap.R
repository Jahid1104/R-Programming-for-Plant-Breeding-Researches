
###Load the library
library("pheatmap")

###Load the data
data<-read.csv(file.choose()) #without cluster

head(data)
str(data)
data$x<-as.character(x=data$Gene.Name)
str(data)
head(data)
rownames(data)<-c(data$Gene.Name)
head(data)
newdata<-data [ , -47]
newdata<-data [ , -1]
head(newdata)
View (newdata)

matx <- scale(newdata)
heatmap(matx, scale = "row")

###Draw Heatmap with Row & Column Clusters (Euclidean", "ward.D2", method )
pheatmap(matx, 
         color=colorRampPalette(c("navy", "white", "red"))(50))
# Define the file name and desired DPI
file_name <- "plot_image.tiff"
dpi <- 300

# Set up the TIFF device with desired DPI
tiff(filename = file_name, width = 6 * dpi, height = 4 * dpi, res = dpi)
pheatmap(matx, 
         clustering_distance_rows = "euclidean",
         clustering_distance_cols = "euclidean", clustering_method = "ward.D2",
         cutree_rows = 3, cutree_cols =3, 
         legend = T,
         fontsize = 11,
         color=colorRampPalette(c("navy", "white", "red"))(50))
pheatmap(matx, 
         color=colorRampPalette(c("navy", "white", "red"))(50))
# Turn off the device to save the file
dev.off()
