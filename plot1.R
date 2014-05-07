#Load the data for limited rows from file
powerconsum<-read.table('household_power_consumption.txt',sep=';',skip=66637,nrow=2880)

#Because of skip argument we lost column names. Let's add them back
names(powerconsum)=c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')

#Convert Date variable to Date datatype
powerconsum$Date<-as.Date(powerconsum$Date, "%d/%m/%Y")

#Open device (png)
png(filename = "plot1.png",width = 480, height = 480)

#Plot the chart
hist(powerconsum$Global_active_power,main='Global Active Power',xlab='Global Active Power (Kilowatts)',col='Red')

#Close device 
dev.off()
