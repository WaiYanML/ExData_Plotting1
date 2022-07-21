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
#plotting plot1
png('plot1.png')
hist(data$Global_active_power, col='red', main='Global Active Power',
     xlab='Global Active Power (kilowatts)')
dev.off()

