## Load data.table package.
library (data.table)

## Load data of the household power consumption data set (only the data of the specified dates)
cmd <- 'findstr /b /c:"1/2/2007" /c:"2/2/2007" /c:"Date;" household_power_consumption.txt'
t <- paste0(system(cmd, intern = T), collapse = "\n")
data <- fread(t, sep = ";", header = T, na.strings = '?')

## Convert the Date and Time variables to Date/Time classes.
data$DateTime <- paste (data$Date, data$Time)
data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))

## Call graphic device, create plot, close graphic device.
png(filename="plot3.png")
with(data, {plot(DateTime, Sub_metering_1,  xlab= "", ylab = "Energy sub meeting", type = "l")
  lines(DateTime, Sub_metering_2,  col = "red")
  lines(DateTime, Sub_metering_3,  col = "blue")
  legend("topright", lty = 1, col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  })
dev.off()
