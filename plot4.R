## plot4.R

data<-read.table('household_power_consumption.txt',header=TRUE,sep=';',colClasses='character');

##tbl <- data.table(data)
##tbl2<-tbl[{Date %in% c('2/2/2007','1/2/2007')}]

tbl2 <- subset(data,Date %in% c('1/2/2007','2/2/2007'))


cols<-c('Date','Time')
tbl2$x<-do.call(paste,c(tbl2[cols],sep=' '))

tbl2$x2<-strptime(tbl2$x,'%d/%m/%Y %H:%M:%S')

png('plot4.png')
par(mfrow=c(2,2))

plot(tbl2$x2,tbl2$Global_active_power,type='l',xlab='',ylab='Global Active Power')

plot(tbl2$x2,tbl2$Voltage,type='l',xlab='datetime',ylab='Voltage')

plot(tbl2$x2,tbl2$Sub_metering_1,type='n',xlab='',ylab='Energy sub metering')
lines(tbl2$x2,tbl2$Sub_metering_1,col='black')
lines(tbl2$x2,tbl2$Sub_metering_2,col='red')
lines(tbl2$x2,tbl2$Sub_metering_3,col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),text.col='black',lty=c(1,1,1),bty='n')

##Global_reactive_power

plot(tbl2$x2,tbl2$Global_reactive_power,type='l',xlab='datetime',ylab="Global_reactive_power")

dev.off()

