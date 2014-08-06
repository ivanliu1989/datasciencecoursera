rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  setwd("C:/Users/Ivan.liuyanfeng/Desktop/Data_Mining_Work_Space/datasciencecoursera/Hospital Quality Instructions/")
  
  main.data <- read.csv("outcome-of-care-measures.csv",colClasses="character")
  
  ## Check that state and outcome are valid
  state.list <- as.character(unique(main.data[,7]))
  
  outcome.list <- c("heart attack","heart failure","pneumonia")
  
  rate.col <- c(11,17,23)
  
  if(!is.element(state,state.list)) stop ("Invalid state")
  
  if(!is.element(outcome,outcome.list))stop ("Invalid outcome")
  
  if(!is.element(num,c("best","worst"))&!is.numeric(num)) stop ("invalid number")
  
  if(outcome==outcome.list[1]) rate.col = 11
  
  if(outcome==outcome.list[2]) rate.col = 17
  
  if(outcome==outcome.list[3]) rate.col = 23
  
  ## Return hospital name in that state with the given rank
  state.data <- subset(main.data,State == state, select=c(2,rate.col))
  
  lowest_data <- state.data[order(as.numeric(state.data[,2]),state.data[,1]),]
    
  ## 30-day death rate
  if (num=="best"){
    head(lowest_data$Hospital.Name,1)  
  }else if (num =="worst"){
    lowest_data <- state.data[order(as.numeric(state.data[,2]),state.data[,1],decreasing = TRUE),]
    head(lowest_data$Hospital.Name,1)
  }else
    lowest_data[num,1]

}