# Load ggplot2
library(ggplot2)

# Read the data
data1 <- read.csv(file.choose())
head(data1)

library(ggplot2)

ggplot(data1, aes(x = Group, y = Protein.Size..aa., fill = Group)) +
  geom_violin(alpha = 1, trim = FALSE) +
  geom_dotplot(binaxis = "y",
               stackdir = "center",
               dotsize = 1.1,
               fill=1) +
  theme(
    panel.background = element_blank(),  # Remove only the plot area background
    plot.background = element_blank(),    # Remove the background of the whole plot
    axis.line = element_line(color = "black", size = 0.7),  # Keep axis lines
    axis.ticks = element_line(color = "black", size = 0,7)  # Keep axis ticks
  )
