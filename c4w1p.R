#Reading Data

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", skip = 1, stringsAsFactors = FALSE, na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage" , "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data$Global_active_power= as.numeric(as.character(data$Global_active_power))
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data2$DateTime <- paste(data2$Date, data2$Time)
data2$DateTime <- strptime(data2$DateTime,"%d/%m/%Y %H:%M:%S")

#Plot1

hist(data2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()

#Plot2 



plot(data2$DateTime, data2$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png")
dev.off()


#Plot3

plot(data2$DateTime, data2$Sub_metering_1, col = "black", type="l", xlab="", ylab="Energy sub metering")
lines(data2$DateTime, data2$Sub_metering_2, col="red")
lines(data2$DateTime, data2$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.copy(png, file = "plot3.png")
dev.off()


#Plot 4 
png(filename="plot4",height=480, width=480)

par(mfrow=c(2,2))
plot(data2$DateTime, data2$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(data2$DateTime , data2$Voltage, xlab="datetime", ylab="Voltage", type="l")


plot(data2$DateTime, data2$Sub_metering_1, col = "black", type="l", xlab="", ylab="Energy sub metering")
lines(data2$DateTime, data2$Sub_metering_2, col="red")
lines(data2$DateTime, data2$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"), cex=.8,bty="n")


plot(data2$DateTime, data2$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")


dev.off()
