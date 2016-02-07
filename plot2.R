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

## create the line plot of Global Active Power over time
plot(hpc$DateTime,hpc$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")

## restore par
par(oldpar)

## repeat plotting to create png 
png("plot2.png",width=480,height=480)

## create the line plot of Global Active Power over time
plot(hpc$DateTime,hpc$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")

## close the png device
dev.off()
