week4quiz <- function(){
    
    setwd("C:/Documents and Settings/Macro/Desktop/Ivandata/datasciencecoursera/getting and cleaning data/")
    
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
    acs.data[,4]<-as.numeric(gsub(",","",acs.data[,4]))
    #head(acs.data)
    return(mean(acs.data[,4]))
    
    # Question 3
    num.united <- grep("^United",acs.data[,3])
    return(num.united)
    
    # Question 4
    edu.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
    edu.file <- basename(edu.url)
    if(!(file.exists(edu.file)))
        download.file(edu.url,destfile=edu.file,method="auto")
    edu.data <- read.csv(edu.file)
    merged.data <- merge(x=acs.data,y=edu.data,by="CountryCode",all=T)
    #head(merged.data, n=3)
    num.june <- grep("June^",merged.data[,13])
    count <- grep("June",merged.data[,13])
    return(sum(table(count)))
    
    # Question 5
    library(quantmod)
    amzn = getSymbols("AMZN",auto.assign=FALSE)
    sampleTimes = index(amzn)
    lb.time <- as.Date("2012-1-1")
    hb.time <- as.Date("2013-1-1")
    date.format <- format(subset.time,'%A')
    subset.time <- cbind(subset.time, date.format)
    #head(subset.time)
    table(subset.time[,2])
    sum(table(subset.time[,2]))
}