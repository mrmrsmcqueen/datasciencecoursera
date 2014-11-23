pollutantmean<-function(directory,pollutant,id=1:332) {
  files_list<-list.files(directory,full.names=TRUE)
  dat<-data.frame()
  for(i in id) {
    dat<-rbind(dat,read.csv(files_list[i]))
  }
  dat_subset<-dat
  if(pollutant=="sulfate") {
    mean(dat[,"sulfate"],na.rm=TRUE)
  } else {
    mean(dat[,"nitrate"],na.rm=TRUE)
  }
}