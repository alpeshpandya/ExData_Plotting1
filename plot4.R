#Load the data for limited rows from file
powerconsum<-read.table('household_power_consumption.txt',sep=';',skip=66637,nrow=2880)

#Because of skip argument we lost column names. Let's add them back
names(powerconsum)=c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')

#Convert Date variable to Date datatype
powerconsum$Date<-as.Date(powerconsum$Date, "%d/%m/%Y")

#Open device (png)
png(filename = "plot4.png",width = 480, height = 480)

#Define two rows and two columns with adjusted margins for better reading
par(mfrow=c(2,2),mar=c(4,4,1,1))

#Chart 1
plot(powerconsum$Global_active_power, type="l", ylim=range(powerconsum$Global_active_power), axes=F, ann=T, xlab=NA,ylab='Global Active Power')
axis(1, at=c(0,nrow(powerconsum)/2,nrow(powerconsum)),labels=c('Thu','Fri','Sat'))
axis(2)
box()

#Chart 2
plot(powerconsum$Voltage, type="l", ylim=range(powerconsum$Voltage), axes=F, ann=T, xlab='datetime',ylab='Voltage')
axis(1, at=c(0,nrow(powerconsum)/2,nrow(powerconsum)),labels=c('Thu','Fri','Sat'))
axis(2)
box()

#Chart 3
plot(powerconsum$Global_active_power, type="n", ylim=range(l_min,l_max), axes=F, ann=T, xlab=NA,ylab='Energy sub metering')
axis(1, at=c(0,nrow(powerconsum)/2,nrow(powerconsum)),labels=c('Thu','Fri','Sat'))
axis(2)
box()
lines(powerconsum$Sub_metering_1)
lines(powerconsum$Sub_metering_2,col='Red')
lines(powerconsum$Sub_metering_3,col='Blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c('Black','Red','Blue'),lty=c(1,1,1),cex=0.7)

#Chart 4
plot(powerconsum$Global_reactive_power, type="l", ylim=range(powerconsum$Global_reactive_power), axes=F, ann=T, xlab='datetime',ylab='Global_reactive_power')
axis(1, at=c(0,nrow(powerconsum)/2,nrow(powerconsum)),labels=c('Thu','Fri','Sat'))
axis(2)
box()

#Close device
dev.off()