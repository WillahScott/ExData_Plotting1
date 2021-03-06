## PROGRAMMING ASSIGNMENT 1 - Plot 2
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


## Plot 2:
#  Line plot of Global Active Power

# Prepare output PNG file
png(filename= "Plot2.png", height= 480, width= 480)

# Set timestamp column
data2$timestamp <- with(data2, strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

# Plot histogram
with(data2, plot(x=timestamp, y=Global_active_power,
                 ylab = "Global Active Power (kilowatts)", xlab = '', type = 'l'))

# Close file
dev.off()
