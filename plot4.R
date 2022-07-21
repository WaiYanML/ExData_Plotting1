load_data<-function(){
  #loading required data
  data<-read.table("household_power_consumption.txt", 
                   sep=";",header =TRUE)
  data<-data[grep('^[1,2]/2/2007', data$Date),]
  #changing data class
  data$Date<-as.Date(data$Date, format='%d/%m/%Y')
  data$Time<-strptime(paste(data$Date,data$Time),
                      format='%F %H:%M:%S')
  data[3:9]<-lapply(data[3:9], as.numeric)
  
  data
}

data<-load_data()

#plotting plot4
png('plot4.png')
par(mfrow=c(2,2),mar=c(4,4,2,1))
plot(data$Time,data$Global_active_power, type='l',
     xlab='', ylab='Global Active Power')

plot(data$Time,data$Voltage, type='l', xlab='datetime',
     ylab='Voltage')

plot(data$Time, data$Sub_metering_1, type='l', xlab='',
     ylab='Energy sub metering')
lines(data$Time, data$Sub_metering_2, col='red')
lines(data$Time, data$Sub_metering_3, col='blue')
legend('topright', col=c('black','red','blue'), lty=c(1,1,1),
  legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
  box.lty = 0)

plot(data$Time,data$Global_reactive_power,type='l',
     xlab='datetime', ylab='Global_reactive_power')
dev.off()
