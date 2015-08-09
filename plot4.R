DATA<-read.table("household_power_consumption.trim.txt",sep=";",header=T)
DATA$Date<-as.Date(DATA$Date, format="%d/%m/%Y")


png(filename="plot4.png",width=480,height=480,units="px",pointsize=15,bg="white")
par(mfrow=c(2,2))

# Plot 1

with(DATA, plot(subset(Global_active_power, Date >= "2007-02-01" & Date <= "2007-02-02"), xaxt="n", type="l", xlab=NA, ylab="Global Active Power (kilowatts)"))
ticks<-seq(1, length(DATA$Date), by=length(DATA$Date[DATA$Date=="2007-02-01"]))
fmt<-"%A"
labs<-format(DATA$Date[ticks], fmt)

axis(side = 1, at = ticks, labels = labs)

# Plot 2

with(DATA, plot(subset(Voltage, Date >= "2007-02-01" & Date <= "2007-02-02"), xaxt="n", type="l", xlab=NA, ylab="Voltage"))
ticks<-seq(1, length(DATA$Date), by=length(DATA$Date[DATA$Date=="2007-02-01"]))
fmt<-"%A"
labs<-format(DATA$Date[ticks], fmt)

axis(side = 1, at = ticks, labels = labs)

# Plot 3

plot(subset(DATA$Sub_metering_1, DATA$Date >= "2007-02-01" & DATA$Date <= "2007-02-02"), xaxt="n", type="l", xlab=NA, ylab="Energy sub metering")
lines(subset(DATA$Sub_metering_2, DATA$Date >= "2007-02-01" & DATA$Date <= "2007-02-02"), col="red")
lines(subset(DATA$Sub_metering_3, DATA$Date >= "2007-02-01" & DATA$Date <= "2007-02-02"), col="blue")

ticks<-seq(1, length(DATA$Date), by=length(DATA$Date[DATA$Date=="2007-02-01"]))
fmt<-"%A"
labs<-format(DATA$Date[ticks], fmt)

axis(side = 1, at = ticks, labels = labs)
legend("topright", colnames(DATA)[7:9], col=c("black","red","blue"), lty=1, cex=0.7)


# Plot 4

with(DATA, plot(subset(Global_reactive_power, Date >= "2007-02-01" & Date <= "2007-02-02"), xaxt="n", type="l", xlab="datetime", ylab="Global Reactive Power (kilowatts)"))
ticks<-seq(1, length(DATA$Date), by=length(DATA$Date[DATA$Date=="2007-02-01"]))
fmt<-"%A"
labs<-format(DATA$Date[ticks], fmt)

axis(side = 1, at = ticks, labels = labs)

dev.off()