# This is the Plot 1

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

png(file ="plot1.png", width = 480, height = 480, units = "px")
hist(filtra$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Activite Power (kilowatts)")
dev.off()
