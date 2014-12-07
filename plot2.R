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
png(filename="plot2.png")
plot(data$DateTime, data$Global_active_power,  xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
