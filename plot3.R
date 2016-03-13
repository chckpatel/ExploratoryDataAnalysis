#Read Datafile
dataFile <- "household_power_consumption.txt"

#Need to seperate fields with ";" seperator. 
data <- read.table(dataFile, header=TRUE, sep=";",stringsAsFactors=F)

#Subset data needs for plot
RequiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract required x , y variable for plot in required format
DateTime <- strptime(paste(RequiredData$Date, RequiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
SubMetering1 <- as.numeric(RequiredData$Sub_metering_1)
SubMetering2 <- as.numeric(RequiredData$Sub_metering_2)
SubMetering3 <- as.numeric(RequiredData$Sub_metering_3)

#Plot the line graph using type=l with required col and titles on x & y axis
png("plot3.png", width=480, height=480)
plot(DateTime, SubMetering1, type="l", col="black", ylab="Energy Submetering", xlab="")
lines(DateTime, SubMetering2, type="l", col="red")
lines(DateTime, SubMetering3, type="l", col="blue")

#Add legend to top right corner 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               col=c("black","red", "blue")
                   ,lty=1, lwd=2.5
              )

#Shutdown the plotting device
dev.off()
