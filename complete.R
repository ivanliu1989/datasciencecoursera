complete <-function(directory, id=1:332){
  my_obs<-c()
  filename <- paste("C:/Users/Ivan.Liuyanfeng/Desktop/Data_Mining_Work_Space/datasciencecoursera/",directory,"/",sep="")
  for(i in id){
    j <- i
    if (i <10){
      i <- paste("00",i,sep="")
    }else if(i<100){
      i<-paste("0",i,sep="")
    }
    filename2 <- paste(filename, i,".csv",sep="")
    my_data <- read.csv(filename2,header = TRUE)
    nobs <- nrow(my_data[complete.cases(my_data),])
    obs <- data.frame(j,nobs)
    my_obs <- rbind(my_obs,obs)
  }
  colnames(my_obs)<-c("id","nobs")
  print(my_obs)
}