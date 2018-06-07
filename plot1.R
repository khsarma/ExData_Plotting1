# Exploratory Data Analysis Project 1
# Hemasundar
# Plot 1 R script

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

#Plot 1
png("plot1.png", width = 480, height = 480)
hist(hpcSubset$Global_active_power, 
     col = 'red', 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
