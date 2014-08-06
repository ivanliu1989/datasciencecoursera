corr <-function(directory, threshold=0){
  filename <- paste(directory,"/",sep="")
  data_list <- dir(path=filename)
  cor_data <- NULL
  data_num <- 1:length(data_list)
  for (i in data_num){
    if (i <10){
      i <- paste("00",i,sep="")
    }else if(i<100){
      i<-paste("0",i,sep="")
    }
    my_data <- read.csv(paste(filename,i,".csv",sep = ""))
    my_data <- na.omit(my_data)
    data_row<-nrow(my_data)
    if (threshold <= data_row & data_row!=0){
      cor_data<-append(cor_data,cor(my_data$nitrate,my_data$sulfate))
    }
  }
  return(as.numeric(cor_data))
}