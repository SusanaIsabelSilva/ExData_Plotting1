## Read Data File
dt <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## Subset Data - Date in (01/02/2007,02/02/2007)
dtsub <- dt[ dt$Date=="1/2/2007" | dt$Date=="2/2/2007",]

## Transform Date variable into Date+Time to represent on x axis of graphic
dtsub$Date <- strptime(paste(dtsub$Date,dtsub$Time), format = "%d/%m/%Y %H:%M:%S")

## PLOT 3: Plot Sub_metering_1 to _3 by Day

## Create graphic on screen device
quartz(width=6.4, height=6.4, bg="white") ## 6.4 inches = 480 pixels; bg = background color

## Options: type = plot type - l for lines, xlab = x axis label, ylab = y axis label
## Plot Sub_metering_1
plot(dtsub$Date,dtsub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
## Add line for Sub_metering_2
lines(dtsub$Date,dtsub$Sub_metering_2,type="l",col="red")
## Add line for Sub_metering_3
lines(dtsub$Date,dtsub$Sub_metering_3,type="l",col="blue")
## Add legend
legend("topright",pch="_",col=c("black","red","blue")
       ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5)

## Copy graphic on PNG device
dev.copy(png, file="Plot3.png", width=480, height=480)

## Close PNG device
dev.off(dev.prev())

## Close screen device
dev.off()