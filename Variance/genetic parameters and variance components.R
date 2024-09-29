
library(variability)

a <- read.csv(file.choose())

View(a)

head(a)
tail(a)

####Analysis of Covariance####

ancova(a[3:18],a$Genotype,a$Replication)

##### Estimation of Genetic Parameters#####
gen.var(a[2:20],a$Name)

#####Genotypic Correlation Analysis#####
geno.corr(a[3:17],a$Accession,a$Replication)

#### Phenotypic Correlation Analysis####
pheno.corr (a[3:17],a$Accession,a$Replication)

####Estimation of direct and indirect effect####

#### Genotypic Path Analysis####
geno.path(a[18],a[3:17],a$Genotype,a$Replication)

#### Phenotypic Path Analysis####
pheno.path(a[18],a[3:17],a$Genotype,a$Replication)

?geno.path
