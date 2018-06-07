# Exploratory Data Analysis Project 1
# Hemasundar
# Plot 3 R script

library(data.table)

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

#Plot 3
png("plot3.png", width = 480, height = 480)
with(hpcSubset, plot(Datetime, Sub_metering_1, type = "n", ylab = "Energy sub metering"))
with(hpcSubset, points(Datetime, Sub_metering_1, type = "l"))
with(hpcSubset, points(Datetime, Sub_metering_2, type = "l", col = "red"))
with(hpcSubset, points(Datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1,  col = c("black", "blue", "red"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
