d <- read.csv("household_power_consumption.txt", sep = ';', na.strings = c("NA", '?'))
# convert to date format
d$Date <- as.Date(d$Date, format = '%d/%m/%Y')
# insert new variable
d$DateTime <- as.POSIXct(paste(d$Date, d$Time))
# to extract subset from the dates 2007-02-01 and 2007-02-02
s <- d[d$Date == '2007-02-01' | d$Date == '2007-02-02', ]
#
png('plot2.png', width = 480, height = 480, units = "px")
plot(s$Global_active_power ~ s$DateTime, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()
