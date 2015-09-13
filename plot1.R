## plot1.R

data<-read.table('household_power_consumption.txt',header=TRUE,sep=';',colClasses='character');

##tbl <- data.table(data)
##tbl2<-tbl[{Date %in% c('2/2/2007','1/2/2007')}]

tbl2 <- subset(data,Date %in% c('1/2/2007','2/2/2007'))

png('plot1.png')
hist(as.numeric(tbl2[,'Global_active_power']),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()