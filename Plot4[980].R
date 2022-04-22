rm(list = ls())
setwd("Z:/R")
hpc <- read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?") 
#head(hpc)
Feb012007_hpc<-subset(hpc, hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")
head(Feb012007_hpc)

#Plot4
Date_Time<-strptime(paste(Feb012007_hpc$Date,Feb012007_hpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
Date_Time[1:5]
par(mfrow=c(2,2), mar=c(4,4,2,1),oma=c(0,0,0,0))
with(Feb012007_hpc,{
  plot(Date_Time,Global_active_power, type="l",ylab="Global Active Power",xlab="")
  plot(Date_Time,Voltage,type="l",xlab="datetime")
  plot(Date_Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
  lines(Date_Time,Feb012007_hpc$Sub_metering_2,type="l",col="red",ylab="")
  lines(Date_Time,Feb012007_hpc$Sub_metering_3,type="l",col="blue",ylab="")
  legend("topright", pch=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),cex=0.5)
  plot(Date_Time,Global_reactive_power,type="l",xlab="datetime")
})
dev.copy(png,"Plot4.png")
dev.off()
