# Exploratory-ana-project-R
##Exploratory Data Analysis Peer-graded Assignment: Course Project 1

This assignment uses data from the [UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/index.php), a popular repository for machine learning datasets. In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on the course web site:
___

* Dataset: [Electric power consumption [20Mb]](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)

* Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

___
The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

1. **Date**: Date in format dd/mm/yyyy
2. **Time**: time in format hh:mm:ss
3. **Global_active_power**: household global minute-averaged active power (in kilowatt)
4. **Global_reactive_power**: household global minute-averaged reactive power (in kilowatt)
5. **Voltage**: minute-averaged voltage (in volt)
6. **Global_intensity**: household global minute-averaged current intensity (in ampere)

7. **Sub_metering_1**: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).

8. **Sub_metering_2**: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.


9. **Sub_metering_3**: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
___

#the code it self is [R code.r](https://github.com/Ibn-mohey/Exploratory-ana-project-R/blob/master/project%201/R%20code.R)  

#the reading and cleaning part
```R

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
```

#the first plot 

```R
png("plot1.png", width = 480, height = 480 , units = "px")

hist(df$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)")
dev.off()
```
![](https://github.com/Ibn-mohey/Exploratory-ana-project-R/blob/master/project%201/plot1.png)


#second plot

```R
png("plot2.png", width = 480, height = 480 , units = "px")

plot(x = df$datetime, y = df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
```
![](https://github.com/Ibn-mohey/Exploratory-ana-project-R/blob/master/project%201/plot2.png)

#third plot
```R
png("plot3.png", width = 480, height = 480 , units = "px")

plot(df$datetime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2,col="red")
lines(df$datetime, df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),legend =  c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.off()
```
![](https://github.com/Ibn-mohey/Exploratory-ana-project-R/blob/master/project%201/plot3.png)

#final plot
```R
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
```

![](https://github.com/Ibn-mohey/Exploratory-ana-project-R/blob/master/project%201/plot4.png)
