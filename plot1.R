data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE)
# subset data only on 1/2/2007 and 2/2/2007
subdata <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))
# convert character data into numeric data
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)


png("plot1.png",width = 480,height=480)
hist(subdata$Global_active_power,col="red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
