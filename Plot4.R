# Plot4.R
data=read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=TRUE)

#get subdata with data are 1/2/2007 and 2/2/2007
subdata<-subset(data,data$Date=='1/2/2007'|data$Date=='2/2/2007', select=c(Date,Time,Global_active_power,Global_reactive_power,Voltage,Global_intensity ,Sub_metering_1,Sub_metering_2,Sub_metering_3))
subdata$Date<-as.Date(subdata$Date,format="%d/%m/%Y")
datetime<-(paste(subdata$Date,subdata$Time, sep=" "))
subdata$datetime<-as.factor(datetime)

# plot plot4.png
png("plot4.png", height=480, width=480)
par(mfrow=c(2,2))
par(mar=c(4, 4, 1, 1))
plot(subdata$datetime,subdata$Global_active_power, cex=0.2, ylab="Global Active Power",type="l",xaxt="n")
lines(subdata$datetime,subdata$Global_active_power)
axis(1,at=c(1,length(datetime)/2,length(datetime)),lab=c("Thu","Fri","Sat"))

par(mar=c(4, 4, 1, 1))
plot(subdata$datetime,subdata$Voltage,ylab="Voltage",type="l",xaxt="n", xlab="datatime")
lines(subdata$datetime,subdata$Voltage,ylab="Voltage")
axis(1,at=c(1,length(datetime)/2,length(datetime)),lab=c("Thu","Fri","Sat"))

par(mar=c(4, 4, 1, 1))
plot(subdata$datetime,subdata$Sub_metering_1,type="l", cex=0.2, xaxt="n", ylab="Energy sub metering")
lines(subdata$datetime,subdata$Sub_metering_1, col="black", ylab="Energy sub metering")
lines(subdata$datetime,subdata$Sub_metering_2, col="red", ylab="Energy sub metering")
lines(subdata$datetime,subdata$Sub_metering_3, col="blue", ylab="Energy sub metering")
legend('topright', bty="n", y.intersp=1,lty = 1, col=c('black','red', 'blue'), cex=0.5, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1,at=c(1,length(subdata$datetime)/2,length(subdata$datetime)),lab=c("Thu","Fri","Sat"))
axis(2, at =c(0,10,20,30), labels=c(0,10,20,30)
     
par(mar=c(4, 4, 1, 1))
plot(subdata$datetime,subdata$Global_reactive_power, cex=0.2, ylab="Global_reactive_power",type="l",xaxt="n", xlab="datatime")
lines(subdata$datetime,subdata$Global_reactive_power,ylab="Global_reactive_power")
axis(1,at=c(1,length(datetime)/2,length(datetime)),lab=c("Thu","Fri","Sat"))
axis(2, at =c(0.0,0.1,0.2,0.3,0.4,0.5), labels=c(0.0,0.1,0.2,0.3,0.4,0.5))

dev.off()
