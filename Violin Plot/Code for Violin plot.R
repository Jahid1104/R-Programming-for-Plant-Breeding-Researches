
# load your data table
#find the sample data to organize your data table

data1<-read.csv(file.choose())

#Check the data
head(data1)

#install.packages

# Create a violin plot
library(ggplot2)
library(tidyverse)
library(hrbrthemes)
library(viridis)

# Violin basic
data1 %>%
ggplot( aes(x=Gen, y=weight, fill=Gen)) +
  geom_violin() +
  scale_fill_viridis(discrete = T, alpha=0.1, option="A") +
  theme_ipsum() +
  theme(
    legend.position="top",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Violin chart") +
  xlab("")
