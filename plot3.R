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
with(dt1, {
  plot(Sub_metering_1~Date.Time, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Date.Time,col='Red')
  lines(Sub_metering_3~Date.Time,col='Blue')
})
legend("topright", col = c("black","red","blue"), lwd = c(1,1,1),
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "plot3.png", width=480, height = 480, units = "px")
dev.off()
