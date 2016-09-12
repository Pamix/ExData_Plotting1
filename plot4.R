
# Exploratory Data Analysis
# Week 1 - Assignment
# Pamela Escobar

#### Plot 4- Four Graphs
# Set the working directory

setwd("/Users/pescobar/Pamela/DataScience/Course 4- Exploratory Data Analysis/Week 1/Assignment/ExData_Plotting1")
library(lubridate)

# Read the dataset and select data from dates 2007-02-01 and 2007-02-02.

epower<-read.table("./household_power_consumption.txt", sep=";", header=TRUE)
epower$Date<-as.Date(epower$Date, "%d/%m/%Y")
epower2007<-subset(epower, (year(Date)=="2007" & month(Date)==2 & (day(Date)==1 | (day(Date)==2))))
epower2007$Global_active_power<-as.numeric(levels(epower2007$Global_active_power))[epower2007$Global_active_power]
epower2007$Sub_metering_1<-as.numeric(levels(epower2007$Sub_metering_1))[epower2007$Sub_metering_1]
epower2007$Sub_metering_2<-as.numeric(levels(epower2007$Sub_metering_2))[epower2007$Sub_metering_2]
epower2007$Sub_metering_3<-as.numeric(levels(epower2007$Sub_metering_3))[epower2007$Sub_metering_3]
epower2007$Voltage<-as.numeric(levels(epower2007$Voltage))[epower2007$Voltage]
epower2007$Global_reactive_power<-as.numeric(levels(epower2007$Global_reactive_power))[epower2007$Global_reactive_power]
epower2007$DateTime<-paste(epower2007$Date, epower2007$Time)
epower2007$DateTime<-as.POSIXct(epower2007$DateTime, "%Y%m%d %H%M%S")

# Prepare plot 4.1

par(mfrow=c(2,2))
dev.off()
with(epower2007, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

# Prepare plot 4.2

dev.off()
with(epower2007, plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime"))


# Prepare plot 4.3 

with(epower2007, plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(epower2007, lines(DateTime, Sub_metering_1, type="l", col="black"))
with(epower2007, lines(DateTime, Sub_metering_2, type="l", col="red"))
with(epower2007, lines(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), 
       lty=1)

# Prepare plot 4.4

dev.off()
with(epower2007, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))


############### Multiple plots ########################

plot.new()
par(mfrow=c(2,2))
with(epower2007, {
     plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
     plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime")
     plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
          with(epower2007, lines(DateTime, Sub_metering_1, type="l", col="black"))
          with(epower2007, lines(DateTime, Sub_metering_2, type="l", col="red"))
          with(epower2007, lines(DateTime, Sub_metering_3, type="l", col="blue"))     
          legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                  col=c("black", "red", "blue"), lty=1)
      plot(DateTime, Global_reactive_power, type="l", xlab="datetime") } )
png("./plot4.png", width = 480, height = 480)
dev.copy(device=png)
dev.off()


