#Load the data for limited rows from file
powerconsum<-read.table('household_power_consumption.txt',sep=';',skip=66637,nrow=2880)

#Because of skip argument we lost column names. Let's add them back
names(powerconsum)=c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')

#Convert Date variable to Date datatype
powerconsum$Date<-as.Date(powerconsum$Date, "%d/%m/%Y")

#Open device (png)
png(filename = "plot2.png",width = 480, height = 480)

#Plot the chart without axis
plot(powerconsum$Global_active_power, type="l", ylim=range(powerconsum$Global_active_power), axes=F, ann=T, xlab=NA,ylab='Global Active Power (Kilowatts)')
#Add x axis with three ticks and three labels
axis(1, at=c(0,nrow(powerconsum)/2,nrow(powerconsum)),labels=c('Thu','Fri','Sat'))
#Add y axis
axis(2)
#Box it up
box()

#Close device
dev.off()
