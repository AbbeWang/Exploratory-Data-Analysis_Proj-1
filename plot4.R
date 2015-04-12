plot4 <- function(){
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                     col.names=c("Date","Time","Global_active_power",
                                 "Global_reactive_power","Voltage",
                                 "Global_intensity","Sub_metering_1",
                                 "Sub_metering_2","Sub_metering_3"),
                     skip=66636, nrows=2880)
  
  x <- paste(data$Date, data$Time)
  y <- strptime(x, "%d/%m/%Y %T")
  
  png(filename="plot4.png", width=480, height=480)
  
  par(mfrow=c(2,2))
  
  plot(y, data$Global_active_powe, type="l", xlab="",
       ylab="Global Active Power")
  
  plot(y, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(y, data$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
  lines(y, data$Sub_metering_2, col="red")
  lines(y, data$Sub_metering_3, col="blue")
  legend("topright", col=c("black","red","blue"), bty="n",         
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1)
  
  plot(y, data$Global_reactive_power, type="l", xlab="datetime",
       ylab="Global_reactive_power")
  
  par(mfrow=c(1,1))
  dev.off()  
}