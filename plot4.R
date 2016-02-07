## read in the dataset (force column classes)
hpc<-read.csv("household_power_consumption.txt",
              sep=";",
              na.strings="?",
              colClasses = c("character","character","numeric",
                             "numeric","numeric","numeric",
                             "numeric","numeric","numeric"))

## subset the data to dates 2007-02-01 and 2007-02-02
hpc<-subset(hpc,Date=="1/2/2007" | Date=="2/2/2007")

## add a column converting Date and Time into DateTime
hpc<-mutate(hpc,DateTime = strptime(paste(Date," ",Time),"%d/%m/%Y %H:%M:%S"))

## store current par to restore after plotting
oldpar <- par(no.readonly=TRUE)

## create the layout for the plots
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

## create first plot of Global Active Power over time
plot(hpc$DateTime,hpc$Global_active_power,xlab="",ylab="Global Active Power",type="l")

## create second plot of Voltage over time
plot(hpc$DateTime,hpc$Voltage,xlab="datetime",ylab="Voltage",type="l")

## create third plot of Energy sub meterings over time
plot(hpc$DateTime,hpc$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="Black")
lines(hpc$DateTime,hpc$Sub_metering_2,col="Red")
lines(hpc$DateTime,hpc$Sub_metering_3,col="Blue")
legend("topright",lty=c(1,1,1),col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

## create fourth plot of Global reactive power over time
plot(hpc$DateTime,hpc$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

## restore par
par(oldpar)

## repeat plotting to create png 
png("plot4.png",width=480,height=480)

## create the layout for the plots
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

## create first plot of Global Active Power over time
plot(hpc$DateTime,hpc$Global_active_power,xlab="",ylab="Global Active Power",type="l")

## create second plot of Voltage over time
plot(hpc$DateTime,hpc$Voltage,xlab="datetime",ylab="Voltage",type="l")

## create third plot of Energy sub meterings over time
plot(hpc$DateTime,hpc$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="Black")
lines(hpc$DateTime,hpc$Sub_metering_2,col="Red")
lines(hpc$DateTime,hpc$Sub_metering_3,col="Blue")
legend("topright",lty=c(1,1,1),col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

## create fourth plot of Global reactive power over time
plot(hpc$DateTime,hpc$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

## close the png device
dev.off()
