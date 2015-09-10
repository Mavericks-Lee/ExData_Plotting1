## Exploratory Data Analysis Course Project 1
## Read data from the dates 2007-02-01 and 2007-02-02 without read the entire
## data set, and making required plot1.png

hpc <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),
                  col.names = c('Date',
                                'Time',
                                'Global_Active_Power',
                                'Global_Reactive_Power',
                                'Voltage',
                                'Global_Intensity',
                                'Sub_Metering_1',
                                'Sub_Metering_2',
                                'Sub_Metering_3'),
                  stringsAsFactors = FALSE,
                  colClasses = c('character',
                                'character',
                                'numeric',
                                'numeric',
                                'numeric',
                                'numeric',
                                'numeric',
                                'numeric',
                                'numeric'),
                  na.strings = '?',
                  sep = ';')


## Make plot1 and save it in png file
png("plot1.png",width = 480,height = 480)
hist(hpc$Global_Active_Power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = 'red')
dev.off()

## Remove hpc
rm(hpc)