## Plot 3
require(lubridate)
require(dplyr)
# download, unzip, and read data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "zipped.zip")
unzip("zipped.zip")
data <- read.table("household_power_consumption.txt",header = T,sep=";",
                   na.strings = "?",stringsAsFactors = F)

# Basic cleaning of data for charting
epc <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
epc$Date <- dmy(epc$Date)

epc2 <- epc %>%
    mutate(datetime=ymd_hms(paste(Date,Time)))

# create plot from data
png(file="Plot3.png", width = 480, height = 480)
plot(epc2$datetime,epc2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
with(epc2,lines(datetime,Sub_metering_1,col="black"))
with(epc2,lines(datetime,Sub_metering_2,col="red"))
with(epc2,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()