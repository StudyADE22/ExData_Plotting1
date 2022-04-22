rm(list = ls())

hpc <- read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?") 
head(hpc)
#as.Date(hpc$Date,"yyyy-mm-dd")
#strptime(household_power_consumption$Time) 
Feb012007_hpc<-subset(hpc, hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")
head(Feb012007_hpc)

#Plot2
Date_Time<-strptime(paste(Feb012007_hpc$Date,Feb012007_hpc$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
Date_Time[1:5]
strptime(Feb012007_hpc$Date_Time,"%d/%m/%Y %H:%M:%S")
plot(Date_Time,Feb012007_hpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,"Plot2.png")
dev.off()
