## read in the dataset (force column classes)
hpc<-read.csv("household_power_consumption.txt",
              sep=";",
              na.strings="?",
              colClasses = c("character","character","numeric",
                             "numeric","numeric","numeric",
                             "numeric","numeric","numeric"))

## subset the data to dates 2007-02-01 and 2007-02-02
hpc<-subset(hpc,Date=="1/2/2007" | Date=="2/2/2007")

## store current par to restore after plotting
oldpar <- par(no.readonly=TRUE)

## create the histogram of Global Active Power
hist(hpc$Global_active_power, col="Red", xlab = "Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power")

## restore par
par(oldpar)

## repeat plotting to create png 
png("plot1.png",width=480,height=480)

## create the histogram of Global Active Power
hist(hpc$Global_active_power, col="Red", xlab = "Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power")

## close the png device
dev.off()
