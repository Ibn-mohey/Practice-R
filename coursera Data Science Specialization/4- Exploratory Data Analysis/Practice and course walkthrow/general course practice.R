##
rstudioapi::getActiveDocumentContext
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

pollution <- read.csv("data/avgpm25.csv", colClasses = c("numeric", "character", 
                                                         "factor", "numeric", "numeric"))
head(pollution)

summary(pollution$pm25)

boxplot(pollution$pm25, col = "blue")

hist(pollution$pm25, col = "green")

hist(pollution$pm25, col = "green")
rug(pollution$pm25)

hist(pollution$pm25, col = "blue", breaks = 100)
rug(pollution$pm25)


boxplot(pollution$pm25, col = "blue")
abline(h = 12)

barplot(table(pollution$region) , main = "test")


boxplot(pm25 ~ region, data = pollution)

par(mfrow = c(2, 1) , mar = c(4,4,2,1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")


library(ggplot2)
load("data/maacs (2).Rda")
str(maacs)


