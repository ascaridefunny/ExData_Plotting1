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

#Construct the plot and save it to a PNG file with a width of 480 pixels 
#and a height of 480 pixels
#Plot 1:
hist(dt1$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width = 480, height = 480, units = "px")
dev.off()