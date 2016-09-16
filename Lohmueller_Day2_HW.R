getwd()

snpsDataFrame=read.table('hapmap_CEU_r23a_chr2_ld.txt',header=TRUE)
phenoDataFrame=read.table("pheno.sim.2014-1.txt", header=TRUE)

snps=as.matrix(snpsDataFrame)
pheno=as.matrix(phenoDataFrame)

compute_chisquare_2=function(x){
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

