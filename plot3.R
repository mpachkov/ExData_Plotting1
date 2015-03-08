data <- read.table("household_power_consumption.txt",
                   colClasses=c("character", "character", rep("numeric", 7)),
                   na.strings="?",
                   header=T, 
                   sep=";")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

dataFeb <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]

dataFeb$Date <- as.POSIXlt(paste(as.Date(dataFeb$Date, format="%d/%m/%Y"), dataFeb$Time, sep=" "))


png("plot3.png", width=480, height=480)

plot(dataFeb$Date, dataFeb$Sub_metering_1,
     type="n",
     lwd=1, 
     ylim=c(0, max(c(dataFeb$Sub_metering_1,
         dataFeb$Sub_metering_2,
         dataFeb$Sub_metering_3))),
     xlab="",
     ylab="Energy sub metering")

lines(dataFeb$Date, dataFeb$Sub_metering_1, col="black")
lines(dataFeb$Date, dataFeb$Sub_metering_2, col="red")
lines(dataFeb$Date, dataFeb$Sub_metering_3, col="blue")

legend("topright", lwd=1, 
	col=c("black", "red", "blue"), 
	legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

dev.off()
