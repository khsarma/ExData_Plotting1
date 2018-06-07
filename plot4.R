# Exploratory Data Analysis Project 1
# Hemasundar
# Plot 4 R script

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

#Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(hpcSubset, plot(Datetime, Global_active_power, type = "l", 
                     ylab = "Global Active Power"))
with(hpcSubset, plot(Datetime, Voltage, type = "l"))
with(hpcSubset, {
  plot(Datetime, Sub_metering_1, type = "n", 
       ylab = "Energy sub metering")
  points(Datetime, Sub_metering_1, type = "l") 
  points(Datetime, Sub_metering_2, type = "l", col = "red")
  points(Datetime, Sub_metering_3, type = "l", col = "blue") 
  legend("topright", lty = 1,  col = c("black", "blue", "red"), 
         bty = "n", cex = 0.85, xjust = 0,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
with(hpcSubset, plot(Datetime, Global_reactive_power, type = "l",
                     ylab = "Global Reactive Power"))
dev.off()