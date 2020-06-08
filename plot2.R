data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE)
# subset data only on 1/2/2007 and 2/2/2007
subdata <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))
# convert character data into numeric data
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
# assign date and time data into a new variable and convert string into date data
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png",width = 480,height=480)
plot(datetime,subdata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
