# This is the Plot 4

#Read the data in the same directory has a txt

base <- read.table("household_power_consumption.txt", sep= ";", na.strings = "?", stringsAsFactors = FALSE, header = TRUE)

#Coverting the Date and Time variables to Date/Time class variable call Date_Time

base2 <- data.frame(Date_Time =paste(base$Date,base$Time),base, stringsAsFactors = FALSE)
base2$Date_Time <-strptime(base2$Date_Time, "%d/%m/%Y %H:%M:%S") 
base2$Date <- as.Date(base$Date, "%d/%m/%Y")
base2$Time <- strptime(base$Time, "%H:%M:%S")

#Subsetting the data from the dates 2007-02-01 and 2007-02-02

filtra <- subset(base2, Date>="2007-02-01"&Date<="2007-02-02")

#Making plot

png(file ="plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2))
plot(filtra$Date_Time,filtra$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
minimo <- with (filtra, min(Sub_metering_1,Sub_metering_2,Sub_metering_3))
maximo <- with (filtra, max(Sub_metering_1,Sub_metering_2,Sub_metering_3))
with(filtra,plot(Date_Time,seq(from= minimo, to = maximo, length.out = length(Date_Time)),type="n", ylab = "Energy sub metering", xlab = ""))
with(filtra, lines(Date_Time,Sub_metering_1))
with(filtra, lines(Date_Time,Sub_metering_2, col = "Red"))
with(filtra, lines(Date_Time,Sub_metering_3, col = "Blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"),
       lty = c(1, 1, 1))
plot(filtra$Date_Time,filtra$Voltage,type="l", ylab="Voltage", xlab="datetime")
plot(filtra$Date_Time,filtra$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()