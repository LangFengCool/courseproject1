windows.options(width=480, height=480) ## set the width of the png to be 480 pixels and a height of 480 pixels.
data<-read.csv("household_power_consumption.txt",header = TRUE, stringsAsFactors = FALSE,sep = ";",na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") ## change the format of Date of data to be format Date
data1<-subset(data,data$Date=="2007-02-01"|data$Date=="2007-02-02") ## subsetting
DateTime<-paste(data1$Date,data1$Time) 
DateTime <- strptime(DateTime, format = "%Y-%m-%d %H:%M:%S") ## set the format of the DateTime to be format Date
hist(data1$Global_active_power,breaks = 12,xlab= "Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power", freq=TRUE, col = "red")
dev.copy(png,file="plot1.png") ## save the png to the file plot1.png
