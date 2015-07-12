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


png("./plot2.png")
plot(data$datetime,data$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()




