rm(list = ls())

hpc <- read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?") 
head(hpc)
#as.Date(hpc$Date,"yyyy-mm-dd")
#strptime(household_power_consumption$Time) 
Feb012007_hpc<-subset(hpc, hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007")
head(Feb012007_hpc)

#Plot1
hist(Feb012007_hpc$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",main="Global Active Power")  
dev.copy(png,file="Plot1.png")
dev.off()

 
