
library(variability)

vardata <- read.csv(file.choose())

head(vardata)
tail(vardata)

####Analysis of Covariance####
data(vardata)
ancova(vardata[3:9],vardata$Gen,vardata$Rep)

##### Estimation of Genetic Parameters#####
gen.var(vardata[3:9],vardata$Gen,vardata$Rep)

#####Genotypic Correlation Analysis#####
geno.corr(vardata[3:9],vardata$Gen,vardata$Rep)

#### Phenotypic Correlation Analysis####
pheno.corr (vardata[3:9],vardata$Gen,vardata$Rep)

####Estimation of direct and indirect effect####

#### Genotypic Path Analysis####
geno.path(vardata[9],vardata[3:8],vardata$Gen,vardata$Rep)

#### Phenotypic Path Analysis####
pheno.path(vardata[9],vardata[3:8],vardata$Gen,vardata$Rep)


