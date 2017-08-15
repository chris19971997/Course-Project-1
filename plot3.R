##First download the data to local memory and set the working directory
setwd("C:/Users/Administrator/Desktop/Exploratory Data Analysis")

##Read and subset the data, change the date format
data <- read.table("./household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(data$Date, data$Time)
data$DateTime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

##Create plot
Global_active_power <- as.numeric(data$Global_active_power)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)
plot(data$DateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(data$DateTime, subMetering2, type="l", col="red")
lines(data$DateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), cex = 0.7)

##Save the plot as png
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
