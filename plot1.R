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
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

##Save the plot as png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()