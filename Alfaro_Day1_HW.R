##Exercise 1
for (ii in 1:9){
  if (ii==9){cat("\n*")}
  else {cat("\n")}
}


##Exercise 2
for (ii in 1:10){
  if (ii==10){cat("*")}
  else {cat("*&")}
}


##Exercise 3
#iteration 1 (start 10,end 11)
#iteration 2 (start 11,end 12)
#iteration 3 (start 12,end 13)
#iteration 4 (start 13,end 14)
#iteration 5 (start 14,end 15)

#iteration 1 (start 0,end -4)
#iteration 2 (start -4,end -9)
#iteration 3 (start -9,end -15)
#iteration 4 (start -15,end -22)
#iteration 5 (start -22,end -30)

#iteration 1 (start 12,end -1)
#iteration 1 (start -1,end -2)
#iteration 1 (start -2,end -3)
#iteration 1 (start -3,end -4)

##Exercise 4
years <- c( 2015, 2016, 2018, 2020, 2021)
for(ii in 1:length(years)){
  if(years[ii] %% 2 == 0){
    cat(years[ii], 'Hooray, congressional elections!', sep = '\t', fill = T)
  }
  if(years[ii] %% 4 ==0){
    cat(years[ii], 'Hooray, presidential elections!', sep = '\t', fill = T)
  }
}


##Exercise 5
bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5)
interestRate <- 0.0125
compounded <- rep (NA,length(bankAccounts))
for (i in 1:length(bankAccounts)){
  compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i]
}
compounded
#or, just use the same name "bankAccounts" 
bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5)
interestRate <- 0.0125

for (i in 1:length(bankAccounts)){
  bankAccounts[i] <- interestRate*bankAccounts[i] + bankAccounts[i]
}
bankAccounts


##Exercise 6
bankAccounts <- c(10, 9.2, 5.6)
interestRate <- 0.0525
house <- c(4.8, 3.8, 5.7)
food<- c(3.5, 4.3, 5.0)
fun <- c(7.8, 2.1, 10.5)
income <- c(21, 21, 21)
for (j in 1:5){
  for (i in 1:length(bankAccounts)){
    bankAccounts[i] <- (bankAccounts[i] - (house[i] + food[i] +fun[i])) + income[i]
    bankAccounts[i] <- interestRate*bankAccounts[i] + bankAccounts[i]}
    }
bankAccounts


##Exercise 7
bankAccounts <- c(10, 9.2, 5.6)
house <- c(4.8, 3.8, 5.7) 
food<- c(3.5, 4.3, 5.0)
fun <- c(7.8, 2.1, 10.5) 
income <- c(21, 21, 21)
interestRate <- 0.0525
year <- c(2015, 2016, 2017, 2018, 2019, 2020)

for (j in 1:length(year)){
  for (i in 1:length(bankAccounts)){
    bankAccounts[i] <- (bankAccounts[i] - (house[i] + food[i] +fun[i])) + income[i]
    if ((year[j] %%2 == 1)&&(i!=2) ){bankAccounts[i] <- bankAccounts[i]+5}
    bankAccounts[i] <- interestRate*bankAccounts[i] + bankAccounts[i]}
}
bankAccounts


##Exercise 8
x <- 0
y <- 1
while (y<18){
  x <- x + y
  y <- y + 1
}
x


##Exercise 9
sizer <- function(x){
  if(x<=(-1)){cat("small")}
  else if(x>=1){cat("big")}
  else{cat("medium")}
}
sizer(x)