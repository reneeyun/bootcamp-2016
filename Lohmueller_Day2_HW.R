getwd()
setwd("C:\\Users\\renee\\Documents\\GitHub\\bootcamp-2016")

##Question 1 Part a
snpsDataFrame=read.table('hapmap_CEU_r23a_chr2_ld.txt',header=TRUE) #puts into environment
phenoDataFrame=read.table("pheno.sim.2014-1.txt", header=TRUE)

snps=as.matrix(snpsDataFrame) ##Convert dataframe to matrix
pheno=as.matrix(phenoDataFrame)

compute_chisquare=function(x){ ##create a function
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  n=sum(obscnts)
  exp_probs=c((1-freq)^2,2*freq*(1-freq),freq^2)
  chisq<-chisq.test(obscnts,p=exp_probs, correct = FALSE)$statistic
  return(chisq)
}

chisqs= apply(snps,1,compute_chisquare)

pvals=pchisq(chisqs,1,lower.tail=FALSE)

#Part b
signifthres <- 0.05
sum(pvals<signifthres)
length(pvals)
sum(pvals<signifthres)/(length(pvals)) ##proportion of pvals that are <0.05 is 0.04509218

signifthres <- 0.01
sum(pvals<signifthres)/(length(pvals)) ##proportion of pvals that are <0.05 is 0.01021425

signifthres <- 0.001
sum(pvals<signifthres)/(length(pvals)) ##proportion of pvals that are <0.05 is 0.00124564

#Part c
num_pval <- length(pvals) ##4014 SNPs

#Part d
exp_pvals <- (seq(1,num_pval,by=1))/num_pval ##numerator goes from 1 to num_pval (which is 4014), denominator stays same

#Part e
sort_pvals <- sort(pvals, decreasing=FALSE)

#Part f
log_sort_pvals <- (-log10(sort_pvals))
log_exp_pvals <- (-log10(exp_pvals))

#Part g
plot(log_exp_pvals, log_sort_pvals,
     xlab = "-log10(expected P-value)", ylab = "-log10(observed P-value)",
     pch=19)

#Part h
abline(0, 1, h=5, col=2, lty=2) #0 intercept, slope=1

##Question 2, Part a
zz <- read.table("pheno.sim.2014-1.txt", header=TRUE)

#Part b
quantile(zz$glucose_mmolperL, 0.25)

#Part c
quantile(zz$glucose_mmolperL, 0.75)

#Part d
hist(zz$glucose_mmolperL, xlab="glucose mm/L", main="Histogram", las=1)
lowtail <- quantile(zz$glucose_mmolperL, 0.25)
hightail <- quantile(zz$glucose_mmolperL, 0.75)
abline(v=lowtail, col=4)
abline(v=hightail, col=2)
