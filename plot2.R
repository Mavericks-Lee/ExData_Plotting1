## Exploratory Data Analysis Course Project 1
## Read data from the dates 2007-02-01 and 2007-02-02 without read the entire
## data set, and making required plot2.png

library(dplyr)
library(lubridate)

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

hpc <- mutate(hpc,new_time = {paste(Date,Time) %>% dmy_hms()})

## Make plot1 and save it in png file
png("plot2.png",width = 480,height = 480)
plot(hpc$new_time,hpc$Global_Active_Power,type = 'l',xlab = '',
     ylab = 'Global Active Power (Kilowatts)')
dev.off()

## Remove hpc
rm(hpc)