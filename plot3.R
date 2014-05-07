#Load the data for limited rows from file
powerconsum<-read.table('household_power_consumption.txt',sep=';',skip=66637,nrow=2880)

#Because of skip argument we lost column names. Let's add them back
names(powerconsum)=c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')

#Convert Date variable to Date datatype
powerconsum$Date<-as.Date(powerconsum$Date, "%d/%m/%Y")

#Open device (png)
png(filename = "plot3.png",width = 480, height = 480)

#List min and max of sub metering variables to define proper range
l_min<-c(min(powerconsum$Sub_metering_1),min(powerconsum$Sub_metering_2),min(powerconsum$Sub_metering_3))
l_max<-c(max(powerconsum$Sub_metering_1),max(powerconsum$Sub_metering_2),max(powerconsum$Sub_metering_3))

#Plot the chart without axis
plot(powerconsum$Global_active_power, type="n", ylim=range(l_min,l_max), axes=F, ann=T, xlab=NA,ylab='Energy sub metering')
#Add x axis with three ticks and three labels
axis(1, at=c(0,nrow(powerconsum)/2,nrow(powerconsum)),labels=c('Thu','Fri','Sat'))
#Add y axis
axis(2)
#Box it up
box()

#Add lines for each sub metering variable
lines(powerconsum$Sub_metering_1)
lines(powerconsum$Sub_metering_2,col='Red')
lines(powerconsum$Sub_metering_3,col='Blue')

#Add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c('Black','Red','Blue'),lty=c(1,1,1))

#Close device
dev.off()