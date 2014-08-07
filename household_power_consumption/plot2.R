## Create Plot2

## Read the data
setwd("C:/Users/Ivan.liuyanfeng/Desktop/Data_Mining_Work_Space/datasciencecoursera/household_power_consumption/")

main.data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")

sub.data <- main.data[main.data$Date %in% c("1/2/2007","2/2/2007"),]

sub.data <- transform(
  sub.data,
  Date = as.Date(Date, format = "%d/%m/%Y"),
  Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

attach(sub.data)

## Basic settings 
par(ps=12, bg="transparent")

## Generate diagram
plot(Time, Global_active_power,ylab="Global Active Power (Kilowatts)",xlab="", type="n")

lines(Time, Global_active_power)

detach(sub.data)

axis(1, at=c(1,(nrow(sub.data)/4),nrow(sub.data)/2), label=c("Thu","Fri","Sat"))

## Output diagram
dev.copy(png,file="plot2.png", width=480,height=480)

dev.off()