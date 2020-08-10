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


# Making Plot 1
png("plot1.png", width = 480, height = 480)

hist(epc_filtered$Global_active_power, main="Global Active Power", 
          xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()





