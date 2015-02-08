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

#Plot 1 is the Red Histogram
hist(datos$Global_active_power,col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
