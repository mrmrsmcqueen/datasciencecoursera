corr <- function(directory, threshold = 0) {
  files_list<-list.files(directory,full.names=TRUE)
  cor<-c()
  dat<-data.frame()
  for(i in 1:332) {
    dat<-data.frame(read.csv(files_list[i]))
    dat_good<-dat[complete.cases(dat),]
    nobs<-nrow(dat_good)
    dat_subset<-dat
    if(nobs>=threshold) {
      sulfate<-dat_good[["sulfate"]]
      nitrate<-dat_good[["nitrate"]]
      cor1<-cor(sulfate,nitrate,use="complete.obs")
      cor<-c(cor,cor1)
    } else {next}
  }
  return(cor)
}