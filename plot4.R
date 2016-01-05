# Read the data from the file. 
# Number of rows = 2075259,  Seperator is ';'

CompleteData <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",nrows=2075259)

#Date field is formatted to dd/mm/yyyy format
CompleteData$Date <- as.Date(CompleteData$Date, format="%d/%m/%Y")

#using data from the dates 2007-02-01 and 2007-02-02 and subsetting it to PartialData table
PartialData <- subset(CompleteData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert the Date and Time variables to Date/Time classes
PartialData$Datetime <- as.POSIXct(paste(as.Date(PartialData$Date), PartialData$Time))

# create plot 4  graphs

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(PartialData, 
{
    plot(Global_active_power~Datetime, type="l",ylab="Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~Datetime, type="l", ylab=" Energy Sub Metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", ylab="Global_Rective_Power",xlab="datetime")
} )


#save it to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
