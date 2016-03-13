#Read Datafile
dataFile <- "household_power_consumption.txt"

#Need to seperate fields with ";" seperator. 
data <- read.table(dataFile, header=TRUE, sep=";",stringsAsFactors=F)

#Subset data needs for plot
RequiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Extract required x , y variable for plot in required format
DateTime <- strptime(paste(RequiredData$Date, RequiredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(RequiredData$Global_active_power)

#Plot the line graph using type=l
png("plot2.png", width=480, height=480)
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Shutdown the plotting device
dev.off()
