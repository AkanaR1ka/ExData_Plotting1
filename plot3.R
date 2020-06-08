data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE)

# subset data only on 1/2/2007 and 2/2/2007
subdata <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))

# # convert character data into numeric data
subdata$Sub_metering_1 <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2 <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3 <- as.numeric(subdata$Sub_metering_3)

# assign date and time data into a new variable and convert string into date data
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(datetime, subdata$Sub_metering_1,type="l", ylab="Energy sub metering")
lines(datetime, subdata$Sub_metering_2, type="l", col="red")
lines(datetime, subdata$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))
dev.off()
