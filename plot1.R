#Read Datafile
dataFile <- "household_power_consumption.txt"

#Need to seperate fields with ";" seperator. 
data <- read.table(dataFile, header=TRUE, sep=";",stringsAsFactors=F)

#Subset data needs for plot
RequiredData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
GlobalActivePower <- as.numeric(RequiredData$Global_active_power)

#Plot the histograms graph
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Shutdown the plotting device
dev.off()
