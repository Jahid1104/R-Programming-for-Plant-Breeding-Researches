
# load your data table
#find the sample data to organize your data table

data1<-read.csv(file.choose())

#Check the data
head(data1)

#install ggplot2
install.packages("ggplot2")

# Create a boxplot by using geom_boxplot() function of ggplot2 package
library(ggplot2)

#modify the name of x and y axis as required 
crop=ggplot(data=data1, mapping=aes(x=Gen, y=weight))+geom_boxplot()
crop



# add mean to ggplot2 boxplot, legend position
ggplot(data1, aes(x = Gen, y = weight, fill = Gen)) +
  geom_boxplot() + theme(legend.position = "top") +
  stat_summary(fun = "mean", geom = "point", shape = 8,
               size = 2, color = "red")


