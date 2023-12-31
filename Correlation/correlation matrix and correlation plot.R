

my_data <- read.csv(file.choose())

head(my_data)
d<-my_data[,c(-1)]
d

cor(d)
mat <-cor(d)


library (corrplot)

corrplot(mat) #plot 1
corrplot(mat,method="color", type="lower")

#method = c("circle", "square", "ellipse", "number", "shade", "color", "pie"),
#type = c("full", "lower", "upper")

#or 

corr_mat=cor(mat,method="s")
corr_mat[1:5,1:5]
corrplot(corr_mat)  #plot 3

# Draw corrplot with p-values
corrplot(mat,                    
         p.mat = mat,
         type= "lower")

library(metan)
# All numeric variables

ALL=corr_coef(d)
ALL
plot(ALL)

# Select variables
Some=corr_coef(d, Chl,LAI, tw,  GSV, H, Glu, TW)
Some
plot(Some)



library(RColorBrewer)

M <-cor(d) 
testRes = cor.mtest(d, conf.level = 0.95)

#plot 4
corrplot(M, p.mat = testRes$p, method = 'ellipse', diag = FALSE, type = 'full', sig.level = c(0.001, 0.01, 0.05), pch.cex = 1, insig = 'label_sig', pch.col = 'grey20', order = 'AOE')

#plot 5
corrplot(M, p.mat = testRes$p, method = 'color', diag = FALSE, type = 'upper',
         sig.level = c(0.001, 0.01, 0.05), pch.cex = 2,
         insig = 'label_sig', pch.col = 'grey20', order = 'AOE')

#plot 6
corrplot(M, p.mat = testRes$p, method = 'ellipse', diag = TRUE, type = 'lower',
         sig.level = c(0.001, 0.01, 0.05), pch.cex = 2,
         insig = 'label_sig', pch.col = 'green4', order = 'AOE')

#plot 7
corrplot(corr_mat, method = "color", outline = T, addgrid.col = "darkgray", order="hclust", 
         addrect = 4, rect.col = "black", rect.lwd = 5,cl.pos = "b", tl.col = "indianred4", 
         tl.cex = 1.5, cl.cex = 1.5, addCoef.col = "white", number.digits = 2, number.cex = 0.75, 
         col = colorRampPalette(c("darkred","white","midnightblue"))(100))


library(PerformanceAnalytics)
chart.Correlation(cor(d)) #chart 1


library(lares)
corr_cross(d, rm.na = T, max_pvalue = 0.05, top = 15, grid = T) #plot 8
corr_cross(d, type = 2, top = NA) #plot 9
