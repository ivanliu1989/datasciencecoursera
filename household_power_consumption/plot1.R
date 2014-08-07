## Create Plot1

  ## Read the data
  setwd("C:/Users/Ivan.liuyanfeng/Desktop/Data_Mining_Work_Space/datasciencecoursera/household_power_consumption/")
  
  main.data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
  
  sub.data <- main.data[main.data$Date %in% c("1/2/2007","2/2/2007"),]
  
  sub.data <- transform(
    sub.data,
    Date = as.Date(Date, format = "%d/%m/%Y"),
    Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
  
  ## Basic settings 
  par(ps=12, bg="transparent")
  
  ## Generate diagram
  hist(sub.data$Global_active_power,col="#ff2500",xlab="Global Active Power (Kilowatts)", main="Global Active Power")
  
  ## Output diagram
  dev.copy(png,file="plot1.png", width=480,height=480)
  
  dev.off()

