readacs <- function(){

setwd("C:/Users/Ivan.Liuyanfeng/Desktop/Data_Mining_Work_Space/datasciencecoursera/getting and cleaning data/")

## Q2:
    acs.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    ##acs.filename <- basename(acs.url)
    
    ##if (!(file.exists(acs.filename)))
    ##    download.file(acs.url, destfile=acs.filename,method="curl")
    
    acs <- read.csv(acs.url)
    ##head(acs)
    library(sqldf)
    
    question1 <- sqldf("select pwgtp1 from acs where AGEP <50")
    print("Data for the probability weights pwgtp1 with ages less than 50:")
    head(question1)
    
## Q3:
    question2.1<-unique(acs$AGEP)
    question2.2 <- sqldf("select distinct AGEP from acs")
    head(question2.1)
    head(question2.2)

## Q4:
    con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
    question3 <- readLines(con)
    
    lines<-c(10,20,30,100)
    question3.2 <- lapply(question3[lines],nchar)
    return(question3.2)
}