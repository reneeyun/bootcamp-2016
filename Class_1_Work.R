setwd("C:/Users/renee/Documents/GitHub/bootcamp-2016")
getwd
library(ape)
list.files()
tt <- read.tree("tree.tre")
str(tt)
attributes(tt)
tt$tip.label[1:10]
head(tt$tip.label)
pruned.tree <- drop.tip(tt, tt$tip.label[1:7900])
plot(ladderize(pruned.tree))
rnorm(10)
rnorm(10, mean=10)
#first, draw 1000 random values from standard normal distribution, called S1
s1 <- rnorm(1000, mean=0, sd=1)
#next, 1000 random values where SD=3, called s3
s3 <- rnorm(1000, mean=0, sd=3)
hist(s1)
plot(density(s1))
