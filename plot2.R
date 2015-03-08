## read data
power <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

## reformat data
power$Time <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

## include only 2 days
twoday <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02", ]

## create PNG file
png("plot2.png",  width = 480, height = 480, units = "px", bg = "transparent")

## plot line graph
plot(twoday$Time, twoday$Global_active_power, type = "l", ylim = range(twoday$Global_active_power), ylab = "Global Active Power (kilowatts)", xlab = "")

## close PNG device
dev.off()