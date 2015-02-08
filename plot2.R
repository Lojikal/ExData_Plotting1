
# Read in the text File for the data with read.table
FileNAme <- "./household_power_consumption.txt"
consumptionData <- read.table(FileNAme, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Subset the data for the two dates
subConsumptionData <- consumptionData[consumptionData$Date %in% c("1/2/2007","2/2/2007") ,]

forPlot <- as.numeric(subConsumptionData$Global_active_power)
PlotTimeLine <- strptime(paste(subConsumptionData$Date, subConsumptionData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
thePlot <- plot(PlotTimeLine,forPlot,xlab="",type="l", ylab="Global Active Power (kilowatts)")
dev.off()