# Read the data for 2007-02-01 and 2007-02-02
d <- read.table('data/household_power_consumption.txt', header=TRUE, sep=';', colClasses="character")
d <- d[d$Date == '1/2/2007' | d$Date == '2/2/2007',]

# Deal with missing value
d[d == '?'] = NA

# Type conversion from factor to numeric
d$Global_active_power = as.numeric(d$Global_active_power)
d$Global_reactive_power = as.numeric(d$Global_reactive_power)
d$Sub_metering_1 = as.numeric(d$Sub_metering_1)
d$Sub_metering_2 = as.numeric(d$Sub_metering_2)
d$Sub_metering_3 = as.numeric(d$Sub_metering_3)
d$Voltage = as.numeric(d$Voltage)

d$Datetime = strptime(paste(d$Date, d$Time), '%d/%m/%Y %H:%M:%S')

png(filename='plot4.png', width=480, height=480)
par(mfrow=c(2, 2), mar=c(4,4,2,1))
with(d, {
  plot(Datetime, Global_active_power, type='l', xlab='', ylab='Global Active Power')
  plot(Datetime, Voltage, type='l', xlab='datetime', ylab='Voltage')
  plot(Datetime, Sub_metering_1, type='l', col='black', xlab='', ylab='Energy sub metering')
  points(Datetime, Sub_metering_2, type='l', col='red')
  points(Datetime, Sub_metering_3, type='l', col='blue')
  legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
         col=c('black', 'red', 'blue'), lwd=1, lty=1)
  plot(Datetime, Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')
})
dev.off()