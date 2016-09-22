#Plotting and genetic variation data analysis exercises, Assignment 1

#Questions 1,2,3
get_heights <- function(x){
  heights <- rnorm(x, mean=69, sd=10)
  return(mean(heights))}
#we are creating a function called get_heights, which will draw x samples (100 or 1000)
#these samples will come from the normal distribution "heights", with the set mean and stdev
#our funtion will return the mean of these x # of heights

#Question 4
mean_heights_100 <- seq(from=1, to=1000)

for(i in 1:1000){
  mean_heights_100[i] <- get_heights(100)
}

#Question 5
mean_heights_1000 <- seq(from=1, to=1000)
for(i in 1:1000){
  mean_heights_1000[i] <- get_heights(1000)
}

#Question 6
bins <- seq(from=65, to=73, by=0.5)
hist(mean_heights_100, breaks=bins)$breaks
hist(mean_heights_1000, breaks=bins)$breaks

counts_100 <- hist(mean_heights_100, breaks=bins)$counts
counts_1000 <-hist(mean_heights_1000, breaks=bins)$counts

windows()
barplot(rbind(counts_100, counts_1000),
        col=c(2,4), beside=TRUE, names.arg=seq(from=65, to=72.5, by=0.5), #count using the bins we set, we will need 16 names
        xlab="Average height (inches)", ylab="Count", main= "Average Height of a Population of n Living in LA",
        las=1, cex.lab=1.2)
legend("topleft", c("n=100", "n=1000"), col=c(2,4), lwd=4)


