#Read Datafile
dataFile <- "household_power_consumption.txt"

#Need to seperate fields with ";" seperator. 
data <- read.table(dataFile, header=TRUE, sep=";",stringsAsFactors=F)

#Subset data needs for plot
RequiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract required x , y variable for plot in required format
GlobalActivePower <- as.numeric(RequiredData$Global_active_power)
DateTime <- strptime(paste(RequiredData$Date, RequiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
SubMetering1 <- as.numeric(RequiredData$Sub_metering_1)
SubMetering2 <- as.numeric(RequiredData$Sub_metering_2)
SubMetering3 <- as.numeric(RequiredData$Sub_metering_3)
GlobalReactivePower <- as.numeric(RequiredData$Global_reactive_power)
Voltage <- as.numeric(RequiredData$Voltage)

#Plot the line graph using type=l with required col and titles on x & y axis
png("plot4.png", width=480, height=480)
#Set up the layout 2 rows and 2 cols
par(mfrow = c(2, 2)) 

#Plot graph on 1st row 1st col
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")

#Plot graph on 1st row 2nd col
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot graph on 2nd row 1st col
plot(DateTime, SubMetering1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(DateTime, SubMetering2, type="l", col="red")
lines(DateTime, SubMetering3, type="l", col="blue")
#Add legend to top right corner 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red", "blue")
       ,lty=1, lwd=2.5
)

#Plot graph on 2nd row 2nd col
plot(DateTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#Shutdown the plotting device
dev.off()
