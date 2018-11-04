power <- read.table("household_power_consumption.txt", skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
spower <- subset(power,power$Date=="1/2/2007" | power$Date=="2/2/2007")
spowerm <- mutate(spower,GlobalPower= as.numeric(as.character(spower$Global_active_power)), DateTime = as.POSIXct(paste(spower$Date, spower$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S", tz = ""))

png("plot4.png",width=480, height=480)
par(mfrow = c(2,2))
plot(spowerm$DateTime, spowerm$GlobalPower, xlab="",ylab="Global Active Power(kilowatts)", type="l")

plot(spowerm$DateTime, as.numeric(as.character(spowerm$Voltage)), xlab="datetime",ylab="Voltage", type="l")

plot(spowerm$DateTime, as.numeric(as.character(spowerm$Sub_metering_1)), xlab="",ylab="Energy sub metering", type="l")
with(spowerm,lines(spowerm$DateTime,as.numeric(as.character(spowerm$Sub_metering_2)),col="red"))
with(spowerm,lines(spowerm$DateTime,as.numeric(as.character(spowerm$Sub_metering_3)),col="blue"))
legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(spowerm$DateTime, as.numeric(as.character(spowerm$Global_reactive_power)), xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()








