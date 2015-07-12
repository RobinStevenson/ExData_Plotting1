setwd("~/r/EDA/Project1")

data1<-read.table("household_power_consumption.txt", sep=";",
                  header=T,stringsAsFactors=F,na.strings="?")
data1$Date2<-as.Date(data1$Date,format="%d/%m/%Y")

startDate <- as.Date("01/02/2007",format="%d/%m/%Y")
endDate <- as.Date("02/02/2007",format="%d/%m/%Y")
datasubset<- data1$Date2>=startDate&data1$Date2<=endDate
data<-data1[datasubset,]
data$Time2<-paste(data$Date,data$Time)
data$datetime<-strptime(data$Time2,format="%d/%m/%Y %H:%M:%S")



png("./plot4.png")
par(mfrow=c(2,2))
plot(data$datetime,data$Global_active_power,type="l",xlab="",
     ylab="Global Active Power")
plot(data$datetime,data$Voltage,type="l",xlab="datetime",
     ylab="Voltage")
plot(data$datetime,data$Sub_metering_1,type="l",xlab="",
     ylab="Energy sub metering")
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2",
                    "Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,bty="n")
plot(data$datetime,data$Global_reactive_power,type="l",xlab="datetime",
     ylab="Global_rective_power")
dev.off()


