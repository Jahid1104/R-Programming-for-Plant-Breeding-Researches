

library (pastecs)

my_data <- read.csv(file.choose())
head (my_data)

result <- stat.desc(my_data) 

round(result,2) #2 digit after decimal
round(result,3) #3 digit after decimal

#for skewness, kurtosis
sk <- stat.desc(my_data, basic=TRUE, desc=TRUE, norm=TRUE, p=0.95)

write.csv(result, file = "output.csv", row.name = T)
write.csv(sk, file = "output_sk.csv", row.name = T)
