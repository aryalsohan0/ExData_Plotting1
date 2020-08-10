# Reading Data


epcData <- read.csv("household_power_consumption.txt", 
                    sep = ";", na = "?")

# Changing Date and Time column type
epcData$Date <- as.Date(epcData$Date, format = "%d/%m/%Y")

epcData$DateTime <- strptime(paste(epcData$Date, epcData$Time),'%Y-%m-%d %H:%M:%S')

# Filtering Date from Data
library(tidyverse)
epc_filtered <- epcData %>% 
        filter((Date >= "2007-02-01") & (Date <= "2007-02-02"))


# Making Plot 3
png("plot3.png", height = 480, width = 480)
plot(epc_filtered$DateTime, epc_filtered$Sub_metering_1, xlab='', ylab='Energy sub metering', type='n')
points(epc_filtered$DateTime, epc_filtered$Sub_metering_1, type='l', col='black')
points(epc_filtered$DateTime, epc_filtered$Sub_metering_2, type='l', col='red')
points(epc_filtered$DateTime, epc_filtered$Sub_metering_3, type='l', col='blue')
legend('topright', col=c('black', 'red', 'blue'), legend=c('Sub metering 1', 'Sub metering 2', 'Sub metering 3'), lty=c(1,1), lwd=c(1,1))
dev.off()
