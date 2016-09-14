for (ii in 1:9){
  if (ii==9){cat("\n*")}
  else {cat("\n")}
}


for (ii in 1:10){
  if (ii==10){cat("*")}
  else {cat("*&")}
}


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


years <- c( 2015, 2016, 2018, 2020, 2021)
for(ii in 1:length(years)){
  if(years[ii] %% 2 == 0){
    cat(years[ii], 'Hooray, congressional elections!', sep = '\t', fill = T)
  }
  if(years[ii] %% 4 ==0){
    cat(years[ii], 'Hooray, presidential elections!', sep = '\t', fill = T)
  }
}
