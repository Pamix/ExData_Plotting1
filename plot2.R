
# Exploratory Data Analysis
# Week 1 - Assignment
# Pamela Escobar

#### Plot 2- Global Active Power
# Set the working directory

setwd("/Users/pescobar/Pamela/DataScience/Course 4- Exploratory Data Analysis/Week 1/Assignment/ExData_Plotting1")
library(lubridate)

# Read the dataset and select data from dates 2007-02-01 and 2007-02-02.

epower<-read.table("./household_power_consumption.txt", sep=";", header=TRUE)
epower$Date<-as.Date(epower$Date, "%d/%m/%Y")
epower2007<-subset(epower, (year(Date)=="2007" & month(Date)==2 & (day(Date)==1 | (day(Date)==2))))
epower2007$Global_active_power<-as.numeric(levels(epower2007$Global_active_power))[epower2007$Global_active_power]
epower2007$DateTime<-paste(epower2007$Date, epower2007$Time)
epower2007$DateTime<-as.POSIXct(epower2007$DateTime, "%Y%m%d %H%M%S")

# Prepare the plot 

dev.off()
with(epower2007, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
png("./plot2.png", width = 480, height = 480)
dev.copy(device=png)
dev.off()


