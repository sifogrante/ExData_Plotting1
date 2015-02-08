library(data.table)
library(lubridate)
library(dplyr)
#setwd("/home/pablo/Data-Science/ExpData/ExData_Plotting1")
# Download and Unzip data.
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","hpc.zip")
unzip("hpc.zip")
#read data and filter by date
hpc<-read.csv("household_power_consumption.txt",sep=";",na.strings="?")
hpc$Date<-dmy(hpc$Date)
hpc<-data.table(hpc)
datos<-hpc[Date==dmy("01/02/2007") | Date==dmy("02/02/2007") ,]
datos$Time<-hms(datos$Time)
fecha_hora<-datos$Date+datos$Time
datos<-cbind(datos,fecha_hora)
#Plot 2 is the Time Series
Sys.setlocale("LC_TIME", "C")
png(filename = "plot1.png",width = 480, height = 480)
with(datos, plot(fecha_hora,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
