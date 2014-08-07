rankall <- function(outcome, num = "best") {
  ## Read outcome data
  setwd("C:/Users/Ivan.liuyanfeng/Desktop/Data_Mining_Work_Space/datasciencecoursera/Hospital Quality Instructions/")
  
  main.data <- read.csv("outcome-of-care-measures.csv",colClasses="character")
    
  ## Check that state and outcome are valid
  outcome.list <- c("heart attack","heart failure","pneumonia")
  
  rate.col <- c(11,17,23)
    
  if(!is.element(outcome,outcome.list))stop ("Invalid outcome")
  
  if(!is.element(num,c("best","worst"))&!is.numeric(num)) stop ("invalid number")
  
  if(outcome==outcome.list[1]) rate.col = 11
  
  if(outcome==outcome.list[2]) rate.col = 17
  
  if(outcome==outcome.list[3]) rate.col = 23
  
  ## For each state, find the hospital of the given rank
  outcome.data <- main.data[,c(2,7,rate.col)]
  
  outcome.data[,3]<-as.numeric(outcome.data[,3])
  
  outcome.data <- na.omit(outcome.data)
  
  state.data <- split(outcome.data,outcome.data$State, drop=TRUE)
  
  ranking <- data.frame(hospitals=NULL, state=NULL, value=NULL)
  
  for (i in seq(state.data)){
    hospitals <- state.data[[i]]
    
    state<-head(hospitals$State,1)
    
    hospitals <- hospitals[order(hospitals[,3],hospitals$Hospital.Name),]
    
    if (num=="best") {
      ranking <- rbind(ranking, data.frame(hospital=head(hospitals$Hospital.Name, 1), state=state))
    } else if (num=="worst") {
      ranking <- rbind(ranking, data.frame(hospital=tail(hospitals$Hospital.Name, 1), state=state))			
    } else {
      ranking <- rbind(ranking, data.frame(hospital=hospitals[num, "Hospital.Name"], state=state))
    }
  }
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  return(ranking)
  
}