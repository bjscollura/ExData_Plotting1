## Plot 4
require(lubridate)
require(dplyr)
# download, unzip, and read data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "zipped.zip")
unzip("zipped.zip")
data <- read.table("household_power_consumption.txt",header = T,sep=";",
                   na.strings = "?",stringsAsFactors = F)
epc <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
epc$Date <- dmy(epc$Date)

epc2 <- epc %>%
    mutate(datetime=ymd_hms(paste(Date,Time)))

# create plot from data

png(file="Plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(epc2$datetime,epc2$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
with(epc2,plot(datetime,Voltage,type="l"))
plot(epc2$datetime,epc2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
with(epc2,lines(datetime,Sub_metering_1,col="black"))
with(epc2,lines(datetime,Sub_metering_2,col="red"))
with(epc2,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(epc2,plot(datetime,Global_reactive_power,type="l"))
dev.off()