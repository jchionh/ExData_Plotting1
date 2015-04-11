# first, read the data into a text
dataText <- readLines("data/household_power_consumption.txt");
# define the col classes
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
# then grep only the relevant data, and put it into a data table
dataTable <- read.table(text=grep("^[1|2]/2/2007", x=dataText, value=TRUE), sep=";", stringsAsFactor = FALSE, colClasses=classes, col.names=colNames)
# now, add a datetime column by combining date and time
dataTable$DateTime <- strptime(paste(dataTable$Date, dataTable$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# define our png device with filename
png("plot1.png", width=480, height=480)
# draw the histogram
hist(dataTable$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
