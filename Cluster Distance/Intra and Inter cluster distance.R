#####Intra and Inter cluster distance (D2)

####Data load
pea<-read.csv(file.choose()) #without cluster
head(pea)

# Determine number of clusters
wss <- (nrow(pea)-1)*sum(apply(pea,2,var))
for (i in 2:11) wss[i] <- sum(kmeans(pea,
                                     centers=i)$withinss)
plot(1:10, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")

####Scaling####
pea.s <-scale(pea[,-1])
pea.s

####dissimilarity matrix####
d <-dist (pea.s)
options (max.print=100000)
d


#### hierarchical distance (Ward.D2 means Euclidean and ward squared method)

library(NbClust)
wardse <-hclust(d,"ward.D2")
hcm <-cutree(wardse, k=5) #k means the number of cluster
hcm #sort your data according to the output groups



###Inter and Intra distance
library(clv)
hid <-cls.scatt.data(pea.s,hcm)
print(hid) #use $intercls.average and $intracls.average


###Cluster wise biplot


###Data load
data<-read.csv(file.choose()) #with cluster
head(data)
tail(data)
str(data)
data$X<-as.character(x=data$Cluster)
str(data)
head(data)
rownames(data)<-c(data$Accession)
head(data)
data1 <-data[,-1]
head(data1)

library("factoextra")
library("FactoMineR")
iris.pca <- PCA(data1[,-19], graph = FALSE)
iris.pca
#plot 1
fviz_pca_ind(iris.pca, label = "all", col.ind = data1$Cluster, palette = c("#00AFBB", "green", "red", "#FC4E07"),addEllipses = TRUE, ellipse.type = "convex",legend.title = "Cluster")

#plot 2
fviz_pca_biplot(iris.pca, col.ind = data1$Cluster, palette = c("#00AFBB","green4",  "maroon", "#FC4E07"),addEllipses = TRUE, ellipse.type = "convex",legend.title = "Clusters")

#plot 3
fviz_pca_biplot(iris.pca, col.ind = data1$Cluster, palette = c("#00AFBB", "red", "green4", "blue3"),addEllipses = TRUE, ellipse.type = "euclid",legend.title = "Cluster")

