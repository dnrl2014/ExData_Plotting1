# Plot2 

setwd("C:/dataexp")

#   Read file from diretory

rawdata <- read.table("class_41.txt", header=TRUE, sep=";", colClasses="character")

# set Column names to be easier to work with.
# Date   date
# Time   time
# GAP    Global_Active_Power
# GRP    Global_Reactive_Power
# Volt   Voltage
# GI     Global_Intensity
# SM1	   Sub_metering_1
# SM2    Sub_metering_2
# SM3    Sub_metering_3

colnames(rawdata) <- c("Date","Time", "GAP","GRP","Volt","GI","SM1","SM2","SM3")

# Set date  format.

rawdata[,1] <- as.Date(rawdata$Date,"%d/%m/%Y")


# convert the date to new format.

cnvdata <- subset(rawdata, rawdata$Date %in% as.Date(c("2007-02-01", "2007-02-02")))

cnvdata$DateTime <- as.POSIXct(paste(cnvdata$Date, cnvdata$Time), format="%Y-%m-%d %H:%M:%S")

# Set columns to numeic.

cnvdata[,3] <- as.numeric(cnvdata[,3])
cnvdata[,4] <- as.numeric(cnvdata[,4])
cnvdata[,5] <- as.numeric(cnvdata[,5])
cnvdata[,6] <- as.numeric(cnvdata[,6])
cnvdata[,7] <- as.numeric(cnvdata[,7])
cnvdata[,8] <- as.numeric(cnvdata[,8])
cnvdata[,9] <- as.numeric(cnvdata[,9])

# Create plot of data.

plot(cnvdata$DateTime, cnvdata[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Create PNG file.

dev.copy(png, file="plot2.png")
dev.off()

