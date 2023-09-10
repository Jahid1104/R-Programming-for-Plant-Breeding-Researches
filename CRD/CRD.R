

## ANOVA ##

library (doebioresearch)

#Read Table #

data<-read.csv(file.choose())

head(data)

#it allows only 6 column at a time

d1<-crd(data[2:8],data$Treatments,1)  # 0 for no test, 1 for LSD, 2 for DMRT
d2<-crd(data[9:12],data$Treatments,1)

d1

d2
