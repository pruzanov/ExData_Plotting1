DATA<-read.table("household_power_consumption.trim.txt",sep=";",header=T)
DATA$Date<-as.Date(DATA$Date, format="%d/%m/%Y")

plot(subset(DATA$Sub_metering_1, DATA$Date >= "2007-02-01" & DATA$Date <= "2007-02-02"), xaxt="n", type="l", xlab=NA, ylab="Energy sub metering")
lines(subset(DATA$Sub_metering_2, DATA$Date >= "2007-02-01" & DATA$Date <= "2007-02-02"), col="red")
lines(subset(DATA$Sub_metering_3, DATA$Date >= "2007-02-01" & DATA$Date <= "2007-02-02"), col="blue")

ticks<-seq(1, length(DATA$Date), by=length(DATA$Date[DATA$Date=="2007-02-01"]))
fmt<-"%A"
labs<-format(DATA$Date[ticks], fmt)

axis(side = 1, at = ticks, labels = labs)
legend("topright", colnames(DATA)[7:9], col=c("black","red","blue"), lty=1, cex=0.7)