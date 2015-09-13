windows.options(width=480, height=480) ## set the width of the png to be 480 pixels and a height of 480 pixels.
data<-read.csv("household_power_consumption.txt",header = TRUE, stringsAsFactors = FALSE,sep = ";",na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")  ## change the format of Date of data to be format Date
data1<-subset(data,data$Date=="2007-02-01"|data$Date=="2007-02-02") ## subsetting
DateTime<-paste(data1$Date,data1$Time)
DateTime <- strptime(DateTime, format = "%Y-%m-%d %H:%M:%S") ## set the format of the DateTime to be format Date
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data1,{
  plot(DateTime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")
  plot(DateTime,Voltage,type = "l",xlab = "datetime")
  plot(DateTime,Sub_metering_1,type = "l")
  plot(DateTime,Global_reactive_power,type="l",xlab = "datetime")
})
dev.copy(png,file="plot4.png") 
