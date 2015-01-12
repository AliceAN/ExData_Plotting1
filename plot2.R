# Read the file

power<-fread("household_power_consumption.txt", sep = ";", na.strings="?")

# Create a column with the Date in POSIX1t format for subsetting

power[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Subset for date 2/1/2007-2/2/2007
DateNeeded <-filter(power, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))

#Global active power as a numeric vector

DateNeeded$Global_active_power<-as.numeric(DateNeeded$Global_active_power)

#Time as Str time
DateNeeded[, DateTime2 := paste(Date,Time)]
TimeFormat<-strptime(DateNeeded$DateTime2, format="%d/%m/%Y %H:%M:%S")
forGraph<-cbind(DateNeeded, TimeFormat)

# plot "Global Active Power(kilowatts)" vs date
plot(forGraph$TimeFormat, forGraph$GAP, type="l", ylab = "Global active power(kilowatts)", xlab= " " )

#Save PNG file

dev.copy(png, file="plot2.png")
dev.off()