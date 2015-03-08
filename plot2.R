data_all<-read.table("./household_power_consumption.txt",colClasses = c("character","character","character","character","character","character","character","character","character"),sep=";",header=TRUE)

data_all$Date <- strptime(data_all$Date, format= "%d/%m/%Y")
new_date<-format(data_all$Date, format="%Y-%m-%d")

sub<-subset(data_all,as.Date(data_all$Date)>= '2007-02-01' & as.Date(data_all$Date)<='2007-02-02')

y<-as.numeric(sub$Global_active_power)
png(filename="./plot2.png")
plot(y, xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()
