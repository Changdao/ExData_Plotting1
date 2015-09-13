## plot2.R

data<-read.table('household_power_consumption.txt',header=TRUE,sep=';',colClasses='character');

##tbl <- data.table(data)
##tbl2<-tbl[{Date %in% c('2/2/2007','1/2/2007')}]

tbl2 <- subset(data,Date %in% c('1/2/2007','2/2/2007'))


cols<-c('Date','Time')
tbl2$x<-do.call(paste,c(tbl2[cols],sep=' '))

tbl2$x2<-strptime(tbl2$x,'%d/%m/%Y %H:%M:%S')

png('plot2.png')
plot(tbl2$x2,tbl2$Global_active_power,type='l',xlab='',ylab='Global Active Power (killowatts)')
dev.off()



