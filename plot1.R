# Read the file

power<-fread("household_power_consumption.txt", sep = ";", na.strings="?")

# Create a column with the Date in POSIX1t format for subsetting

power[,DateTime := as.Date(paste(Date,Time), format = "%d/%m/%Y %H:%M:%S")]

#Subset for date 2/1/2007-2/2/2007
DateNeeded <-filter(power, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))

# Global_active_power as numeric data

DateNeeded$Global_active_power<-as.numeric(DateNeeded$Global_active_power)

# Create Histogram

hist(DateNeeded$Global_active_power, col="red", main=paste("Global Active Power"), xlab=paste("Global Active Power(kilowatts)"))

#Save PNG

dev.copy(png, file="plot1.png")
dev.off()
