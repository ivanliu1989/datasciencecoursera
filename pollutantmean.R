pollutantmean <-function(directory, pollutant, id=1:332){
  my_data <- c()
  filename <- paste("C:/Users/Ivan.Liuyanfeng/Desktop/Data_Mining_Work_Space/datasciencecoursera/",directory,"/",sep="")
  for(i in id){
    if (i <10){
      i <- paste("00",i,sep="")
    }else if(i<100){
      i<-paste("0",i,sep="")
    }
    filename2 <- paste(filename, i,".csv",sep="")
    my_data <- rbind(my_data,read.csv(filename2,header = TRUE))
    
  }
  my_mean <- mean(my_data[,pollutant],na.rm = TRUE)
  print(my_mean)
}