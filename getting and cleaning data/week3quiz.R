week3quiz <- function(){
    
    setwd("C:/Users/Ivan.Liuyanfeng/Desktop/Data_Mining_Work_Space/datasciencecoursera/getting and cleaning data/")
    
    # Question 1
    uscom.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    uscom.file <- basename(uscom.url)
    if(!(file.exists(uscom.file))){
        download.file(url = uscom.url,destfile = uscom.file,method = "auto")
    }
    uscom.data <- read.csv(uscom.file)
    attach(uscom.data)
    agriculturelLogical <- uscom.data[which(ACR==3 & AGS==6),]
    head(agriculturelLogical, n=3)
    
    # Question 2
    library(jpeg)
    img.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
    img.file <- basename(img.url)
    if(!(file.exists(img.file))){
        download.file(img.url,destfile=img.file,method="auto")
    }
    img.data <- readJPEG(img.file,native = TRUE)
    quantile.per <- c(.3,.8)
    question2 <- quantile(img.data, probs = quantile.per)
    return(question2)
    
    # Question 3
    GDP.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    GDP.file <- basename(GDP.url)
    if(!(file.exists(GDP.file))){
        download.file(GDP.url, destfile = GDP.file,method = "auto")
    }
    GDP.data <- read.csv(GDP.file)
    
    EDU.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
    EDU.file <- basename(EDU.url)
    if(!(file.exists(EDU.file))){
        download.file(EDU.url, destfile = EDU.file,method = "auto")
    }
    EDU.data <- read.csv(EDU.file)
        #head(GDP.data)
        #head(EDU.data)
    merged.data <- merge(GDP.data,EDU.data, by.x="X", by.y="CountryCode" )
    q3.1 <- sum(!is.na(merged.data[,1]))
    table(merged.data[,1])
    library(plyr)
    merged.data[,2]<-as.numeric(merged.data[,2])
    sorted.data <- arrange(merged.data, desc(merged.data[,2]))
    sorted.data[13,]
    
    # Question 4
    summary(merged.data)
    
    # Question 5
    c <- as.numeric(merged.data[,2])
    merged.data$GDP_group<- cut(c, breaks=quantile(c, probs = c(0.2,0.4,0.6,0.8,1.0)))
    table(merged.data$GDP_group,merged.data$Income.Group)
    
    
}