## Histogram ##

data1<-read.csv(file.choose())
head(data1)

# for mpg column #

hist(data1$mpg,
     main= "Chart Title",
     xlab="mpg", col="gray",
     prob=TRUE)

##Curved set

lines(density(data1$mpg))

