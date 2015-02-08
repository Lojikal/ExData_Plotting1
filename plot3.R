
# Read in the text File for the data with read.table
FileNAme <- "./household_power_consumption.txt"
consumptionData <- read.table(FileNAme, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subset the data for the two dates
subConsumptionData <- consumptionData[consumptionData$Date %in% c("1/2/2007","2/2/2007") ,]
plotMeter1 <- as.numeric(subConsumptionData$Sub_metering_1)
plotMeter2 <- as.numeric(subConsumptionData$Sub_metering_2)
plotMeter3 <- as.numeric(subConsumptionData$Sub_metering_3)
PlotTimeLine <- strptime(paste(subConsumptionData$Date, subConsumptionData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Define dimensions of the png plot
png("plot3.png", width=480, height=480)
plot(PlotTimeLine, plotMeter1, type = "n", ylab = "Energy sub metering", xlab="")
lines(PlotTimeLine,plotMeter1,col = "black")
lines(PlotTimeLine,plotMeter2,col = "red")
lines(PlotTimeLine,plotMeter3,col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = c(1,1,1),col = c("black", "red", "blue"))
dev.off()