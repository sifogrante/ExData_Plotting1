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
#Plot 4 is the 2x2 Time Series Panel
Sys.setlocale("LC_TIME", "C")
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2, 2))
with(datos, 
{
 #Plot 1,1 Global Active Power
 plot(fecha_hora,Global_active_power,type="l",xlab="",ylab="Global Active Power")
 #Plot 1,2 Voltage
 plot(fecha_hora,Voltage,type="l",xlab="datetime",ylab="Voltage")
 #Plot 2,1 Sub Metering
 plot(fecha_hora,Sub_metering_1,lty=1,type="l",xlab="",ylab="Energy sub metering")
 lines(fecha_hora,Sub_metering_2,lty=1,type="l",col="red")
 lines(fecha_hora,Sub_metering_3,lty=1,type="l",col="blue")
 legend("topright",lty=1,bty="n", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
 #Plot 2,2 Global Reactive Power
 plot(fecha_hora,Global_reactive_power,type="l",xlab="datetime",ylab="Voltage")
 
})
dev.off()