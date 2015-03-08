
data <- read.table("household_power_consumption.txt",
                   colClasses=c("character", "character", rep("numeric", 7)),
                   na.strings="?",
                   header=T, 
                   sep=";")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

dataFeb <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]

png("plot1.png", width=480, height=480)
hist(dataFeb$Global_active_power,
     breaks=12, col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

dev.off()
