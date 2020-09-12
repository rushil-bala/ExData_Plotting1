# Appropriately set the working directory.
# Download the raw data.

rawdata <- read.table("household_power_consumption.txt", header = TRUE,
                      sep = ";", na.strings = "?", nrows = 2075259,
                      stringsAsFactors = FALSE)
data1 <- subset(rawdata, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$DateTime <- as.POSIXct(datetime)

# Plot the data.

plot(data1$DateTime, data1$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()