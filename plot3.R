data_all<-read.table("./household_power_consumption.txt",colClasses = c("character","character","character","character","character","character","character","character","character"),sep=";",header=TRUE)

data_all$Date <- strptime(data_all$Date, format= "%d/%m/%Y")
new_date<-format(data_all$Date, format="%Y-%m-%d")

sub<-subset(data_all,as.Date(data_all$Date)>= '2007-02-01' & as.Date(data_all$Date)<='2007-02-02')


v1<-as.numeric(sub$Sub_metering_1)
v2<-as.numeric(sub$Sub_metering_2)
v3<-as.numeric(sub$Sub_metering_3)

plot_colors <- c("black","blue","red")

# Start PNG device driver to save output to figure.png

png(filename="./plot3.png")

# Graph autos using y axis that ranges from 0 to max_y.
# Turn off axes and annotations (axis labels) so we can 
# specify them ourself
plot(v1, type="l", col=plot_colors[1])
lines(v2, type="l", col=plot_colors[2])
lines(v3, type="l", col=plot_colors[3])

title(ylab= "Energy sub metering")
title(xlab="")


legend("topright",legend=(c("Sub_metering_1","Sub_metering_2","Sub_metering_3")), lty=c(1,1), lwd=c(2.5,2.5),
       col=plot_colors) # gives the legend lines the correct color and width


dev.off()


