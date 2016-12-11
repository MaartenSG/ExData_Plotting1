# Expliratory Data Analysis week 1
# code to reproduce plot 2

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

png(file="plot2.png")
with(data, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
