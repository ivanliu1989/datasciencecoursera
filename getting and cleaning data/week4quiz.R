week4quiz <- function(){
    
    setwd("C:/Users/Ivan.Liuyanfeng/Desktop/Data_Mining_Work_Space/datasciencecoursera/getting and cleaning data/")
    
    # Question 1
    acs.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    acs.file <- basename(acs.url)
    if(!(file.exists(acs.file))) 
        download.file(acs.url,destfile = acs.file,method="auto")
    acs.data <- read.csv(acs.file)
    #head(acs.data)
    tolower(names(acs.data))
    splitNames = strsplit(names(acs.data),"\\wgtp")
    splitNames[[123]]
    
    # Question 2
    gdp.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    gdp.file <- basename(gdp.url)
    if(!(file.exists(gdp.file))) 
        download.file(gdp.url,destfile = gdp.file,method="auto")
    acs.data <- read.csv(gdp.file, header = FALSE,skip=5,nrows=190)
    acs.data<-acs.data[,c(1,2,4,5)]
    colnames(acs.data) <- c("CountryCode","Ranking","Economy","MillionDollars")
    
}