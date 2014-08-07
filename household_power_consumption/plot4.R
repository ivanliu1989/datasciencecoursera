## Create Plot4

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
par(ps=12, bg="transparent", mfrow=c(2,2))

## Generate diagram
plot(Time, Global_active_power, type="n", ylab="Global Active Power", xlab="")
lines(Time, Global_active_power)

plot(Time, Voltage, type="n",xlab="datetime")
lines(Time, Voltage)

plot(Time, Sub_metering_1,ylab="Energy sub metering",xlab="", type="n")
lines(Time, Sub_metering_1)
lines(Time, Sub_metering_2,col="red")
lines(Time, Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"), bty = "n")

plot(Time, Global_reactive_power, type="n", xlab="datetime")
lines(Time, Global_reactive_power)

detach(sub.data)

axis(1, at=c(1,(nrow(sub.data)/4),nrow(sub.data)/2), label=c("Thu","Fri","Sat"))

## Output diagram
dev.copy(png,file="plot4.png", width=480,height=480)

dev.off()