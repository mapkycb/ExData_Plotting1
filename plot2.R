A <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", colClasses = c("character","character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# POSIXlt values
times <- strptime(paste(A$Date, A$Time), format="%d/%m/%Y %H:%M:%S") 

# Set weekday names to english
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# get the indices for 2006-02-01 and 2006-02-02
I <- format(times, "%Y-%m-%d") == "2007-02-01" | format(times, "%Y-%m-%d") == "2007-02-02"

# Considered data
A <- A[I,]


plot(times[I], A$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.copy(png, "plot2.png")
dev.off()

