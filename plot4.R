## PROGRAMMING ASSIGNMENT 1 - Plot 4
## Guillermo Monge - May, 2014
##
## This script contains code for the forst plot of the first assignment
##   Data has been obtained from UC Irvine's Machine Learning API:
#     https://d396qusza40orc.cloudfront.net/
#             exdata%2Fdata%2Fhousehold_power_consumption.zip


# Set working directory
# setwd('/Users/Will/Documents/Coursera/Data Science/personal')


## Load data - Read all data then subset
# data <- read.table("household_power_consumption.txt", sep= ';', 
#                    header= TRUE, na.strings= '?', nrows = 1)
# data <- subset(data, Date %in% c("1/2/2007","2/2/2007") )


## Load data - Read only specific data
# Read specific data
data2 <- read.table("household_power_consumption.txt", sep = ';', 
                    header = FALSE, na.strings = '?',
                    skip = 66637, nrows = 2880)
# Read auxiliary set to get original headers
aux.names <- read.table("household_power_consumption.txt", sep= ';', 
                        header= TRUE, na.strings= '?', nrows = 1)
# Set names
names(data2) <- names(aux.names)
# Remove auxiliary data
rm(aux.names)


## Plot 4:
#  Global Active Power line plot and labels

# Prepare output PNG file
png(filename= "Plot4.png", height= 480, width= 480)

# Set plot parameters - set 2 by 2 plot matrix
par(mfrow=c(2,2))

# Set timestamp column
data2$timestamp <- with(data2, strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

# Plot Global Active Power
with(data2, plot(x=timestamp, y=Global_active_power, ylab = "Global Active Power",
                 xlab = '', type = 'l'))

# Plot Voltage
with(data2, plot(x=timestamp, y=Voltage, ylab = "Voltage",
                 xlab = 'datetime', type = 'l'))

# Plot Energy sub-metering
with(data2, plot(x=timestamp, y=Sub_metering_1, ylab = "Energy sub metering",
                 xlab = '', type = 'n'))

with(data2, lines(x=timestamp, y=Sub_metering_1, col = 'black'))
with(data2, lines(x=timestamp, y=Sub_metering_2, col = 'red'))
with(data2, lines(x=timestamp, y=Sub_metering_3, col = 'blue'))

legend("topright", col = c("black","red","blue"), lty = "solid",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty = 'n')

# Plot Global Reactive Power
with(data2, plot(x=timestamp, y=Global_reactive_power, ylab = "Global_reactive_power",
                 xlab = 'datetime', type = 'l'))

# Close file
dev.off()
