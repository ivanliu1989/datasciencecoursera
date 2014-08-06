best <- function(state, outcome){
  ## Read outcome data
  setwd("C:/Users/Ivan.liuyanfeng/Desktop/Data_Mining_Work_Space/datasciencecoursera/Hospital Quality Instructions/")
  main.data <- read.csv("outcome-of-care-measures.csv",colClasses="character")
  ## Check that state and outcome are valid
  state.list <- as.character(unique(main.data[,7]))
  outcome.list <- c("heart attack","heart failure","pneumonia")
  rate.col <- c(11,17,23)
  if(!is.element(state,state.list)) stop ("Invalid state")
  if(!is.element(outcome,outcome.list))stop ("Invalid outcome")
  
  if(outcome==outcome.list[1]) rate.col = 11
  if(outcome==outcome.list[2]) rate.col = 17
  if(outcome==outcome.list[3]) rate.col = 23
  
  ## Return hospital name in that state with lowest 30-day death
  state.data <- subset(main.data,State == state, select=c(2,rate.col))
  valid_hospital <- order(xtfrm(as.numeric(state.data[,2])),decreasing=FALSE, na.last = NA)
  ordered_data <- state.data[valid_hospital,]
  lowest_data <- ordered_data[which(ordered_data[,2]==ordered_data[1,2]),]
  lowest_data <- lowest_data[order(lowest_data[,1]),]
  ## rate
  return(lowest_data[1,1])
  
}