# Read the data from the file. 
# Number of rows = 2075259,  Seperator is ';'

CompleteData <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",nrows=2075259)

#Date field is formatted to dd/mm/yyyy format
CompleteData$Date <- as.Date(CompleteData$Date, format="%d/%m/%Y")

#using data from the dates 2007-02-01 and 2007-02-02 and subsetting it to PartialData table
PartialData <- subset(CompleteData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert the Date and Time variables to Date/Time classes
PartialData$Datetime <- as.POSIXct(paste(as.Date(PartialData$Date), PartialData$Time))

# create plot 1 - histogram for Global Active Power

hist(PartialData$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save it to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
