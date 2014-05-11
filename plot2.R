# Read the data for 2007-02-01 and 2007-02-02
d <- read.table('data/household_power_consumption.txt', header=TRUE, sep=';', colClasses="character")
d <- d[d$Date == '1/2/2007' | d$Date == '2/2/2007',]

# Deal with missing value
d[d == '?'] = NA

# Type conversion from factor to numeric
d$Global_active_power = as.numeric(d$Global_active_power)

d$Datetime = strptime(paste(d$Date, d$Time), '%d/%m/%Y %H:%M:%S')

png(filename='plot2.png', width=480, height=480)
with(d, plot(Datetime, Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)'))
dev.off()