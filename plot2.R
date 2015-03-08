data <- read.table("household_power_consumption.txt",
                   colClasses=c("character", "character", rep("numeric", 7)),
                   na.strings="?",
                   header=T, 
                   sep=";")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

dataFeb <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]

dataFeb$Date <- as.POSIXlt(paste(as.Date(dataFeb$Date, format="%d/%m/%Y"), dataFeb$Time, sep=" "))
png("plot2.png", width=480, height=480)

plot(dataFeb$Date, dataFeb$Global_active_power,
     type="l", 
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
