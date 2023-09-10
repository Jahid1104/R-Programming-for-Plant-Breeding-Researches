
# loading data set and storing it in ds variable
data1<-read.csv(file.choose())
head(data1)

# Create a boxplot by using geom_boxplot() function of ggplot2 package
library(ggplot2)
crop=ggplot(data=data1, mapping=aes(x=Gen, y=weight))+geom_boxplot()
crop


