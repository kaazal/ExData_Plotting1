power <- read.table("household_power_consumption.txt", skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
spower <- subset(power,power$Date=="1/2/2007" | power$Date=="2/2/2007")
spowerm <- mutate(spower,GlobalPower= as.numeric(as.character(spower$Global_active_power)), DateTime = as.POSIXct(paste(spower$Date, spower$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S", tz = ""))
png("plot2.png",width=480, height=480)
plot(spowerm$DateTime, spowerm$GlobalPower, xlab="",ylab="Global Active Power(kilowatts)", type="l")
dev.off()


