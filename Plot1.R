## Plot 1
require(lubridate)

# download, unzip, and read data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "zipped.zip")
unzip("zipped.zip")
data <- read.table("household_power_consumption.txt",header = T,sep=";",
                   na.strings = "?",stringsAsFactors = F)
epc <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
epc$Date <- dmy(epc$Date)
# create plot from data

png(file="Plot1.png", width = 480, height = 480)
hist(epc$Global_active_power,col = "red",main="Global Active Power", xlab ="Global Active Power (kilowatts)")
dev.off()