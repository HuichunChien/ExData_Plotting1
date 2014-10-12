# Plot3.R
data=read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=TRUE)

#get subdata with data are 1/2/2007 and 2/2/2007
subdata<-subset(data,data$Date=='1/2/2007'|data$Date=='2/2/2007', select=c(Date,Time,Global_active_power,Global_reactive_power,Voltage,Global_intensity ,Sub_metering_1,Sub_metering_2,Sub_metering_3))
subdata$Date<-as.Date(subdata$Date,format="%d/%m/%Y")
datetime<-(paste(subdata$Date,subdata$Time, sep=" "))
subdata$datetime<-as.factor(datetime)
# plot plot3.png
png("plot3.png", height=480, width=480)
plot(subdata$datetime,subdata$Sub_metering_1,type="l", xaxt="n", ylab="Energy sub metering")
lines(subdata$datetime,subdata$Sub_metering_1, col="black", ylab="Energy sub metering")
lines(subdata$datetime,subdata$Sub_metering_2, col="red", ylab="Energy sub metering")
lines(subdata$datetime,subdata$Sub_metering_3, col="blue", ylab="Energy sub metering")
axis(1,at=c(1,length(subdata$datetime)/2,length(subdata$datetime)),lab=c("Thu","Fri","Sat"))
legend('topright', lty=1, col=c('black','red', 'blue'), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
