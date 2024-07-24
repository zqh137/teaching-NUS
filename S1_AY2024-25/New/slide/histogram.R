install.packages("ggplot2")
install.packages("readr")
install.packages("dplyr")
library(ggplot2)
library(readr)
library(dplyr)
home_data <- read.csv("https://raw.githubusercontent.com/rashida048/Datasets/master/home_data.csv")[ ,c('price', 'condition')]
ggplot(data = home_data, aes(x = price)) + geom_histogram()

#  print the raw data and save as a eps figure
# setEPS()
# postscript("hist_housing_default.eps")
# hist(home_data$price, xlab = 'Price (USD)', ylab = 'Number of Listings', main = 'Distribution of House Prices', col = "blue", border = "white")
# dev.off()

# hist(home_data$price, xlab = 'Price (USD)', ylab = 'Number of Listings', ylim = c(0,2500), main = 'Distribution of House Prices', col = "blue", border = "white", breaks = "Scott")