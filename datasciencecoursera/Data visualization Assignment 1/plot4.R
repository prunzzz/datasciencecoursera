rm(list = ls())
library(data.table)
library(dplyr)

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

data2 <- as.character(as.Date(data1$Date, "%d/%m/%Y"))
data2a <- paste(data2, data1$Time)
data2b <- strptime(data2a, "%Y-%m-%d %H:%M:%S")


png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 
plot(data2b, as.numeric(data1$Global_active_power), type="l",
     ylab="Global Active Power", xlab="")
plot(data2b, as.numeric(data1$Voltage), type="l",
     ylab="Voltage", xlab="datetime")
plot(data2b, as.numeric(data1$Sub_metering_1), type="l",
     ylab="Energy Submetering", xlab="")
lines(data2b, as.numeric(data1$Sub_metering_2), type="l", col="red")
lines(data2b, as.numeric(data1$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,
       col=c("black", "red", "blue"), bty = "n")
plot(data2b, as.numeric(data1$Global_reactive_power), type="l", xlab="datetime",
     ylab="Global_reactive_power")
dev.off()