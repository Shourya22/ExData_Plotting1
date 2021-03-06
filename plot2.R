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

#plot2
png(filename = "plot2.png", width = 480, height = 480,
     units = "px", bg = "transparent")
plot(DateTime, Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
