# Expliratory Data Analysis week 1
# code to reproduce plot 4

library(dplyr)
setwd("~/coursera/4 Exploratory Data Analysis/week1")

# read data
filename <- "household_power_consumption.txt"
data <- read.table(filename, header=T, row.names=NULL, sep=";", nrows=100000, stringsAsFactors=F)

#process data
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
data$Time <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")
data[,3:9] <- as.numeric(as.character(unlist(data[,3:9]))) #this converts multiple columns to numeric

#plot data

png(file="plot4.png")
par(mfrow=c(2,2))
with(data, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

with(data, plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(data, plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))
legend("topright", legend=names(data[,7:9]), lty=c(1,1,1), col=c(1,2,4), bty="n")

with(data, plot(Time, Global_reactive_power, type="l", xlab="datetime", ylab=names(data)[4] ))
dev.off()

