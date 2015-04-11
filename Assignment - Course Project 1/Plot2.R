## PLOT 2: Plot Global Active Power by Day

## Read Data File
dt <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## Subset Data - Date in (01/02/2007,02/02/2007)
dtsub <- dt[ dt$Date=="1/2/2007" | dt$Date=="2/2/2007",]

## Transform Date variable into Date+Time to represent on x axis of graphic
dtsub$Date <- strptime(paste(dtsub$Date,dtsub$Time), format = "%d/%m/%Y %H:%M:%S")

## Create graphic on screen device
## Options: type = plot type - l for lines, xlab = x axis label, ylab = y axis label
plot(dtsub$Date,dtsub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

## Copy graphic on PNG device
dev.copy(png, file="Plot2.png", width=480, height=480)

## Close PNG device
dev.off()