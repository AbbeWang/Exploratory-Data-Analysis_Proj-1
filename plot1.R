plot1 <- function(){
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                     col.names=c("Date","Time","Global_active_power",
                                 "Global_reactive_power","Voltage",
                                 "Global_intensity","Sub_metering_1",
                                 "Sub_metering_2","Sub_metering_3"),
                     skip=66636, nrows=2880)
  
  png(filename="plot1.png", width=480, height=480)
  
  hist(data$Global_active_power, col="red", main="Global Active Power",
       xlab="Global Active Power (kilowatts)")
  
  dev.off()
}