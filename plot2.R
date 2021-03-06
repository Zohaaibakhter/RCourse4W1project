#Reading Data

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", skip = 1, stringsAsFactors = FALSE, na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage" , "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data$Global_active_power= as.numeric(as.character(data$Global_active_power))
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data2$DateTime <- paste(data2$Date, data2$Time)
data2$DateTime <- strptime(data2$DateTime,"%d/%m/%Y %H:%M:%S")


#Plot2 



plot(data2$DateTime, data2$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png")
dev.off()
