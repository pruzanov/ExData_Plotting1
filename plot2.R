DATA<-read.table("household_power_consumption.trim.txt",sep=";",header=T)
DATA$Date<-as.Date(DATA$Date, format="%d/%m/%Y")

png(filename="plot2.png",width=480,height=480,units="px",pointsize=15,bg="white")

with(DATA, plot(subset(Global_active_power, Date >= "2007-02-01" & Date <= "2007-02-02"), xaxt="n", type="l", xlab=NA, ylab="Global Active Power (kilowatts)"))
ticks<-seq(1, length(DATA$Date), by=length(DATA$Date[DATA$Date=="2007-02-01"]))
fmt<-"%A"
labs<-format(DATA$Date[ticks], fmt)

axis(side = 1, at = ticks, labels = labs)
dev.off()