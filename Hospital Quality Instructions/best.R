best <- function(state, outcome){
  ## Read outcome data
  main.data <- read.csv("outcome-of-care-measures.csv",colClasses="character")
  ## Check that state and outcome are valid
  state.list <- main.data[,7]
  outcome.list <- c("heart attack","heart failure","pneumonia")
  if(state ! in state.list){
    
  }else if (outcome ! in outcome.list){
    
  }else{
    main.data <- main.data[]
  }
  ## Return hospital name in that state with lowest 30-day death
  ## rate
}