# Read the data for 2007-02-01 and 2007-02-02
d <- read.table('data/household_power_consumption.txt', header=TRUE, sep=';', colClasses="character")
d <- d[d$Date == '1/2/2007' | d$Date == '2/2/2007',]

# Deal with missing value
d[d == '?'] = NA

# Type conversion from factor to numeric
d$Sub_metering_1 = as.numeric(d$Sub_metering_1)
d$Sub_metering_2 = as.numeric(d$Sub_metering_2)
d$Sub_metering_3 = as.numeric(d$Sub_metering_3)

d$Datetime = strptime(paste(d$Date, d$Time), '%d/%m/%Y %H:%M:%S')

png(filename='plot3.png', width=480, height=480)
with(d, plot(Datetime, Sub_metering_1, type='l', col='black', xlab='', ylab='Energy sub metering'))
with(d, points(Datetime, Sub_metering_2, type='l', col='red'))
with(d, points(Datetime, Sub_metering_3, type='l', col='blue'))
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col=c('black', 'red', 'blue'), lwd=1, lty=1)
dev.off()