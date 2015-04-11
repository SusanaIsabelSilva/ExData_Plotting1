## PLOT 1: Histogram of Global Active Power

## Read Data File
dt <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## Subset Data - Date in (01/02/2007,02/02/2007)
dtsub <- dt[ dt$Date=="1/2/2007" | dt$Date=="2/2/2007",]

## Create graphic on screen device
## Options: xlab = x axis label, main = graphic title, col = fill bar
hist(dtsub$Global_active_power,xlab="GLobal Active Power (kilowatts)",main="Global Active Power",col="red")

## Copy graphic on PNG device
dev.copy(png, file="Plot1.png", width=480, height=480)

## Close PNG device
dev.off()