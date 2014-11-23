complete<-function(directory,id=1:332) {
  files_list<-list.files(directory,full.names=TRUE)
  dat<-data.frame()
  nobs<-c()
  for (i in id) {
    dat<-data.frame(read.csv(files_list[i]))
    dat_good<-dat[complete.cases(dat),]
    nobs2<-nrow(dat_good)
    nobs<-c(nobs,nobs2)
  }
  cbind.data.frame(id,nobs)
}