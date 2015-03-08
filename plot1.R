## read data
power <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

## reformat data
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

## include only 2 days
twoday <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02", ]

## create PNG file
png("plot1.png",  width = 480, height = 480, units = "px", bg = "transparent")

## plot histogram
hist(twoday$Global_active_power, col = "red", breaks = 16, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## close PNG device
dev.off()