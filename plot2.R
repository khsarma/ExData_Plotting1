# Exploratory Data Analysis Project 1
# Hemasundar
# Plot 2 R script

library(data.table)
library(zoo)

#Import data into a data.table using fread
hpcDT <- fread(input = "hpc.txt", 
               sep = ";", 
               na.strings = "?", 
               stringsAsFactors = F)

#Prepare the data
#Filter the data for the 2 dates
hpcSubset <- hpcDT[Date == '1/2/2007' | Date == '2/2/2007']

#Convert the classes from character to Date-Time format
hpcSubset <- hpcSubset[,Datetime := paste(Date,Time)]
hpcSubset <- hpcSubset[, Datetime := as.POSIXct(
                                      Datetime, 
                                      format = "%d/%m/%Y %H:%M:%S")]

#Plot 2
png("plot2.png", width = 480, height = 480)
gapDaily <- zoo(hpcSubset$Global_active_power, hpcSubset$Datetime)
plot(gapDaily, xlab = "Datetime", ylab = "Global Active Power (kilowatts)")
dev.off()