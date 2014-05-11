# Read the data for 2007-02-01 and 2007-02-02
d <- read.table('data/household_power_consumption.txt', header=TRUE, sep=';', colClasses="character")
d <- d[d$Date == '1/2/2007' | d$Date == '2/2/2007',]

# Deal with missing value
d[d == '?'] = NA

# Type conversion from factor to numeric
d$Global_active_power = as.numeric(d$Global_active_power)

png(filename='plot1.png', width=480, height=480)
hist(d$Global_active_power, main="Global Active Power", col='red',
     xlab="Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()