## ANOVA ##

library (doebioresearch)

#Read Table #
data<-read.csv(file.choose())

head(data)

#it allows only 6 column at a time

d1<- frbd2fact(data[4:5],data$Rep,data$Trt,data$Var,1) # 0 for no test, 1 for LSD, 2 for DMRT
d2<- frbd2fact(data[4:5],data$Rep,data$Trt,data$Var,2)

d1
d2