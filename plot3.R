# Read the file

power<-fread("household_power_consumption.txt", sep = ";", na.strings="?", colClasses=)

# Create a column with the Date in POSIX1t format for subsetting

power[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Subset for date 2/1/2007-2/2/2007
DateNeeded <-filter(power, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))

#plot the graph 

with (forGraph, plot(forGraph$TimeFormat, c(DN$Sub_metering_1,DN$Sub_metering_2,DN$Sub_metering_3), type="n"))
with (subset(forGraph, DN$Sub_metering_2, col="red"))
with (subset(forGraph, DN$Sub_metering_3, col="blue"))
      
legend("topright",pch=-, col=c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(forGraph$TimeFormat, DN$Sub_metering_1, type="l", col ="black", ylab="Energy sub metering", xlab=" ")

#Save PNG

dev.copy(png, file="plot3.png")
dev.off()