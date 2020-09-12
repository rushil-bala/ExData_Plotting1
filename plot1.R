# Appropriately set the working directory.
# Download the raw data.

rawdata <- read.table("household_power_consumption.txt", header = TRUE,
                      sep = ";", na.strings = "?", nrows = 2075259,
                      stringsAsFactors = FALSE)
data1 <- subset(rawdata, Date %in% c("1/2/2007","2/2/2007"))

# Plot the data.

hist(data1$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()