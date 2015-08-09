png(filename="plot1.png",width=480,height=480,units="px",pointsize=15,bg="white")
DATA<-read.table("household_power_consumption.trim.txt",sep=";",header=T)
with(DATA,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()