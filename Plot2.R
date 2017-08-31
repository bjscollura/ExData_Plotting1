## Plot 2
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
png(file="Plot2.png", width = 480, height = 480)
plot(epc2$datetime,epc2$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()