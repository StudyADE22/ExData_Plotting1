rm(list = ls())
setwd("Z:/R")
hpc <- read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?") 
#head(hpc)
Feb012007_hpc<-subset(hpc, hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")
head(Feb012007_hpc)

#Plot3
Date_Time<-strptime(paste(Feb012007_hpc$Date,Feb012007_hpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
Date_Time[1:5]
#plot.window(ylim=50)
with(Feb012007_hpc,plot(Date_Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black"))
lines(Date_Time,Feb012007_hpc$Sub_metering_2,type="l",col="red",ylab="")
lines(Date_Time,Feb012007_hpc$Sub_metering_3,type="l",col="blue",ylab="")
legend("topright", pch=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),cex=0.5)

dev.copy(png,"Plot3.png")
dev.off()
