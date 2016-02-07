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

## create the line plot of Energy sub meterings over time
plot(hpc$DateTime,hpc$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="Black")
lines(hpc$DateTime,hpc$Sub_metering_2,col="Red")
lines(hpc$DateTime,hpc$Sub_metering_3,col="Blue")
legend("topright",lty=c(1,1,1),col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## restore par
par(oldpar)

## repeat plotting to create png 
png("plot3.png",width=480,height=480)

## create the line plot of Energy sub meterings over time
plot(hpc$DateTime,hpc$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="Black")
lines(hpc$DateTime,hpc$Sub_metering_2,col="Red")
lines(hpc$DateTime,hpc$Sub_metering_3,col="Blue")
legend("topright",lty=c(1,1,1),col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## close the png device
dev.off()

