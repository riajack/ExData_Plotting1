#extract and clean power consumption data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode ="wb")
unzip(temp)

t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
t$Date <- as.Date(t$Date, "%d/%m/%Y")
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

#Plot 3
with(t, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save plot 3 as 480x480png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()