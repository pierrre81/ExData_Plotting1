## Load data.table package
library (data.table)

## Load data of the household power consumption data set (only the data of the specified dates)
cmd <- 'findstr /b /c:"1/2/2007" /c:"2/2/2007" /c:"Date;" household_power_consumption.txt'
t <- paste0(system(cmd, intern = T), collapse = "\n")
data <- fread(t, sep = ";", header = T, na.strings = '?')

## Call graphic device, create plot, close graphic device.
png(filename="plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
dev.off()