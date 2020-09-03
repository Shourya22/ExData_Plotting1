##Loading the large dataset and selecting the required days.

filename = "household_power_consumption.txt"
data = read.table(filename, header = TRUE, sep = ";", na = "?",
                   colClasses = c("character", "character", rep("numeric",7)))
attach(data)

dates = Date == "1/2/2007" | Date == "2/2/2007"
newData = data[dates, ]
attach(newData)
x = paste(Date, Time)
newData$DateTime = strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) = 1:nrow(newData)
attach(newData)

png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
par(mfrow = c(2, 2))

plot(DateTime, Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

plot(DateTime, Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(DateTime, Sub_metering_1, type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")

legend("topright", bty = "n", col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

plot(DateTime, Global_reactive_power, type = "l", col = "black",
     xlab = "datetime", ylab = colnames(newData)[4])
dev.off()
