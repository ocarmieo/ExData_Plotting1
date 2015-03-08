## read data
power <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

## reformat data
power$Time <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

## include only 2 days
twoday <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02", ]

## create PNG file
png("plot4.png",  width = 480, height = 480, units = "px", bg = "transparent")

## set up parameters
par(mfcol = c(2, 2))

## plot global active power graph
plot(twoday$Time, twoday$Global_active_power, type = "l", ylim = range(twoday$Global_active_power), ylab = "Global Active Power (kilowatts)", xlab = "")

## plot submetering graph
plot(twoday$Time, twoday$Sub_metering_1, type = "l", ylim = range(twoday$Sub_metering_1), ylab = "Energy sub metering", xlab = "")
lines(twoday$Time, twoday$Sub_metering_2, col = "red")
lines(twoday$Time, twoday$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

## plot voltage graph
plot(twoday$Time, twoday$Voltage, type = "l", ylim = range(twoday$Voltage), ylab = "Voltage", xlab = "datetime")

## plot global reactive power graph
plot(twoday$Time, twoday$Global_reactive_power, type = "l", ylim = range(twoday$Global_reactive_power), ylab = "Global_reactive_power", xlab = "datetime")

## close PNG device
dev.off()