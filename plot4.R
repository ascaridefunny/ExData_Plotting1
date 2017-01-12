setwd("D:/coursera/Exploratory data")
dir()
#Doc file txt có headline và chua quy d???nh giá tr??? bi???n
#, phân cách =";", missing = ?
dt<-read.table("household_power_consumption.txt", header =TRUE, sep = ";",
               na.strings = "?",
               colClasses = c("character", 'character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(dt)

#change character to date
dt$Date<-as.Date(dt$Date, "%d/%m/%Y")
class(dt$Date)

#Set data from Feb. 1, 2007 to Feb. 2, 2007
dt1<-subset(dt, dt$Date >= as.Date("2007-02-01"))
dt1<-subset(dt1, dt1$Date <= as.Date("2007-02-02"))
head(dt1)

#Create date-time variable
dt1<-cbind(dt1, Date.Time = paste(dt1$Date, dt1$Time))
head(dt1)
class(dt1$Date.Time)
dt1$Date.Time<-as.POSIXct(dt1$Date.Time)

#Draw graphic
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dt1, {
  plot(Global_active_power~Date.Time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Date.Time, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Date.Time, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Date.Time,col='Red')
  lines(Sub_metering_3~Date.Time,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Date.Time, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})
dev.copy(png, "plot4.png", width=480, height = 480, units = "px")
dev.off()