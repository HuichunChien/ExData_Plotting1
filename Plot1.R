# Plot1.R
data=read.table("household_power_consumption.txt", na.strings = "?", sep=";", header=TRUE)

#get subdata with data are 1/2/2007 and 2/2/2007
subdata<-subset(data,data$Date=='1/2/2007'|data$Date=='2/2/2007', select=c(Global_active_power,Global_reactive_power,Voltage,Global_intensity ,Sub_metering_1,Sub_metering_2,Sub_metering_3))

# plot plot1.png
png("plot1.png", height=480, width=480)
hist(as.numeric(subdata$Global_active_power), col="red", xlab="Global active power(kilowatts)", ylab="Frequency", main="Global active power")
axis(1,seq(from=0,to=6,by=2))
axis(2,seq(from=0,to=1200,by=200))
dev.off()
