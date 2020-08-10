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


# Making Plot 4
png("plot4.png", height = 480, width = 480)

par(mfrow=c(2,2))

plot(epc_filtered$DateTime, epc_filtered$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(epc_filtered$DateTime, epc_filtered$Voltage, type="l", xlab="datetime", ylab="Voltage")


plot(epc_filtered$DateTime, epc_filtered$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(epc_filtered$DateTime, epc_filtered$Sub_metering_2, col="red")
lines(epc_filtered$DateTime, epc_filtered$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), bty="n", cex=.5) 

plot(epc_filtered$DateTime, epc_filtered$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()








