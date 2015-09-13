d <- read.csv("household_power_consumption.txt", sep = ';', na.strings = c("NA", '?'))
# convert to date format
d$Date <- as.Date(d$Date, format = '%d/%m/%Y')
# insert new variable
d$DateTime <- as.POSIXct(paste(d$Date, d$Time))
# to extract subset from the dates 2007-02-01 and 2007-02-02
s <- d[d$Date == '2007-02-01' | d$Date == '2007-02-02', ]
#
png('plot4.png', width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
# 1
plot(s$Global_active_power ~ s$DateTime, type = 'l', xlab = '', ylab = 'Global Active Power')
# 2
plot(s$Voltage ~ s$DateTime, type = 'l', xlab = 'datetime', ylab = 'Voltage')
# 3
plot(s$Sub_metering_1 ~ s$DateTime, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(s$Sub_metering_2 ~ s$DateTime, col = 'red')
lines(s$Sub_metering_3 ~ s$DateTime, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, lwd = 1)
# 4
plot(s$Global_reactive_power ~ s$DateTime, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')
dev.off()
