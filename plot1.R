d <- read.csv("household_power_consumption.txt", sep = ';', na.strings = c("NA", '?'))
# without date, current date always insert when extract time
t <- paste(d$Date, d$Time)
d$Date <- strptime(t, format = '%d/%m/%Y')
# time store as character
d$Time <- strftime(t, '%T')
# to convert from character to time
library(chron)
d$Time <- chron(times = d$Time)
# to extract subset from the dates 2007-02-01 and 2007-02-02
s <- d[d$Date == '2007-02-01' | d$Date == '2007-02-02', ]
#
png('plot1.png', width = 480, height = 480, units = "px")
hist(s$Global_active_power, main = 'Global Active Power', col = 'red', xlab = 'Global Active Power (kilowatts)')
dev.off()
