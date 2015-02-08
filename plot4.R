

# Read in the text File for the data with read.table
FileNAme <- "./household_power_consumption.txt"
consumptionData <- read.table(FileNAme, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subset the data for the two dates
subConsumptionData <- consumptionData[consumptionData$Date %in% c("1/2/2007","2/2/2007") ,]
plotMeter1 <-as.numeric(subConsumptionData$Sub_metering_1)
plotMeter2 <-as.numeric(subConsumptionData$Sub_metering_2)
plotMeter3 <-as.numeric(subConsumptionData$Sub_metering_3)
plotVolts <- as.numeric(subConsumptionData$Voltage)
plotActive <- as.numeric(subConsumptionData$Global_active_power)
PlotReactive <- as.numeric(subConsumptionData$Global_reactive_power)
PlotTimeLine <- strptime(paste(subConsumptionData$Date, subConsumptionData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

forPlot <- as.numeric(subConsumptionData$Global_active_power)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(PlotTimeLine, plotActive, type="l", ylab="Global Active Power")

plot(PlotTimeLine,plotVolts, type="l", xlab="datetime", ylab = "Voltage")

plot(PlotTimeLine, plotMeter1, type = "n", ylab = "Energy sub metering", xlab="")
lines(PlotTimeLine,plotMeter1,col = "black")
lines(PlotTimeLine,plotMeter2,col = "red")
lines(PlotTimeLine,plotMeter3,col = "blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = c(1,1,1),col = c("black", "red", "blue"))

plot(PlotTimeLine, PlotReactive, type="l",xlab="datetime", ylab="Global_reactive_power")

dev.off()