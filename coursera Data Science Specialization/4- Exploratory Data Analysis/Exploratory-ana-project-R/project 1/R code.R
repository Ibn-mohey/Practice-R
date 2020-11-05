##this code was made as part of peergraded project 


#load into the data 

rm(list=ls())

#leave that alone 

setwd("E:/career/Dataa/github/Exploratory-ana-project-R")

getwd()
path <- getwd()
list.files(path)


if (file.exists("data/household_power_consumption.txt")){
    print("you are good to go")
} else {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", file.path(path, "dataFiles.zip"))
    unzip(zipfile = "dataFiles.zip")
    
}
library("data.table")
#read into the data 
## df <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")



df <- data.table::fread(input = "data/household_power_consumption.txt", na.strings="?")
head(df)
#We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from 
#just those dates rather than reading in the entire dataset and subsetting to those dates.
#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.


df$datetime <- paste(df$Date,df$Time)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- subset(df, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
df$datetime <- as.POSIXct(df$datetime,format = "%d/%m/%Y %H:%M:%S" )


#######################
png("plot1.png", width = 480, height = 480 , units = "px")

hist(df$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)")
dev.off()

################


png("plot2.png", width = 480, height = 480 , units = "px")

plot(x = df$datetime, y = df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
##################

png("plot3.png", width = 480, height = 480 , units = "px")

plot(df$datetime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2,col="red")
lines(df$datetime, df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),legend =  c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.off()

##############


png("plot4.png", width = 480, height = 480 , units = "px")

par(mfrow = c(2,2))

plot(x = df$datetime, y = df$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(x = df$datetime, y = df$Voltage , type="l" , xlab="datetime", ylab="Voltage" )

plot(df$datetime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2,col="red")
lines(df$datetime, df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),legend =  c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

plot(x = df$datetime, y = df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
