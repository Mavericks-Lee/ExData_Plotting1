## Exploratory Data Analysis Course Project 1
## Read data from the dates 2007-02-01 and 2007-02-02 without read the entire
## data set, and making required plot4.png

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
png("plot4.png",width = 480,height = 480)
par(mfcol=c(2,2))
par(mar=c(4,4,2,1))
## Plot1
plot(hpc$new_time,hpc$Global_Active_Power,type = 'l',xlab = '',
     ylab = 'Global Active Power (Kilowatts)')
## Plot2
plot(hpc$new_time,hpc$Sub_Metering_1,type = 'l',xlab = '',
     ylab = 'Energy sub metering')
points(hpc$new_time,hpc$Sub_Metering_2,type = 'l',col='red')
points(hpc$new_time,hpc$Sub_Metering_3,type = 'l',col='blue')
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty = 1,
       col = c('black','red','blue'))
## Plot3
plot(hpc$new_time,hpc$Voltage,xlab = "datetime",ylab = "Voltage",type = 'l')

## Plot4
plot(hpc$new_time,hpc$Global_Reactive_Power,xlab = "datetime",
     ylab = 'Global_reactive_power',type = 'l')
dev.off()

## Remove hpc
rm(hpc)