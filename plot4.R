A <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", colClasses = c("character","character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# POSIXlt values
times <- strptime(paste(A$Date, A$Time), format="%d/%m/%Y %H:%M:%S") 

# Set weekday names to english
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# get the indices for 2006-02-01 and 2006-02-02
I <- format(times, "%Y-%m-%d") == "2007-02-01" | format(times, "%Y-%m-%d") == "2007-02-02"

# Considered data
A <- A[I,]

# Making the plot
par(mfrow=c(2,2))
plot(times[I], A$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(times[I], A$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(times[I], A$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
points(times[I], A$Sub_metering_2, col = "red", type = "l")
points(times[I], A$Sub_metering_3, col = "blue", type = "l")
legend("topright", names(A)[7:9], lty=1, col=c("black", "red", "blue"), bty="n")
plot(times[I], A$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.copy(png, "plot4.png")
dev.off()
