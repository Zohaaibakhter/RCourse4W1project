#Reading Data

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", skip = 1, stringsAsFactors = FALSE, na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage" , "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data$Global_active_power= as.numeric(as.character(data$Global_active_power))
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data2$DateTime <- paste(data2$Date, data2$Time)
data2$DateTime <- strptime(data2$DateTime,"%d/%m/%Y %H:%M:%S")

#Plot3

plot(data2$DateTime, data2$Sub_metering_1, col = "black", type="l", xlab="", ylab="Energy sub metering")
lines(data2$DateTime, data2$Sub_metering_2, col="red")
lines(data2$DateTime, data2$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.copy(png, file = "plot3.png")
dev.off()
