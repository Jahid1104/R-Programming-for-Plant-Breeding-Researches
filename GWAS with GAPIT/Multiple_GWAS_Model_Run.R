

########## STEP 1: Install the necessary packages ##########
############################################################

source("http://www.zzlab.net/GAPIT/GAPIT.library.R")
source("http://www.zzlab.net/GAPIT/gapit_functions.txt")
install.packages("devtools")
devtools::install_github("jiabowang/GAPIT3",force=TRUE)
library(GAPIT)


############################################################
# Change to numerical format and upload all required files #
############################################################

#set directory


library(GAPIT)

#read genomic data
myG <- read.table("Genomic data.txt", head=F) 


myGAPIT <- GAPIT(G=myG, output.numerical=TRUE)
myGD = myGAPIT$GD
myGM = myGAPIT$GM

##Sorting according to taxa
myGD1 <- myGD[order(myGD$taxa),]

#read phenotypic data
myY <- read.table("Phenotypic data.txt", head = TRUE)

#as per the col of your data table
Y1<-myY[,c(1,2)]
Y2<-myY[,c(1,3)]
Y3<-myY[,c(1,4)]
Y4<-myY[,c(1,5)]
Y5<-myY[,c(1,6)]
Y6<-myY[,c(1,7)]
Y7<-myY[,c(1,8)]
Y8<-myY[,c(1,9)]
Y9<-myY[,c(1,10)]
Y10<-myY[,c(1,11)]

########################################################
########################################################
########## STEP 3: Run GWAS ############################
########################################################

# check directory


### model selection
#check the Y value from below code, modify as required
myGAPIT <- GAPIT(
  Y=Y1,
  GD=myGD1,
  GM=myGM,
  PCA.total=10,
  Model.selection = TRUE 
)

###Running all models at a time
##check the Y value from below code, modify as required
myGAPIT <- GAPIT(
  Y=Y1,
  GD=myGD1,
  GM=myGM,
  PCA.total=1,
  Multiple_analysis=TRUE,
  model=c("GLM","MLM","CMLM","ECMLM","SUPER","MLMM","FarmCPU","Blink") 
)


