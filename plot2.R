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


# Making Plot 2
png("plot2.png", height = 480, width = 480)
plot(epc_filtered$DateTime, epc_filtered$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

