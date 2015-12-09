A <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", colClasses = c("character","character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# POSIXlt values
times <- strptime(paste(A$Date, A$Time), format="%d/%m/%Y %H:%M:%S") 

# get the indices for 2006-02-01 and 2006-02-02
I <- format(times, "%Y-%m-%d") == "2007-02-01" | format(times, "%Y-%m-%d") == "2007-02-02"

# Considered data
A <- A[I,]

# Make plot
hist(A$Global_active_power, col="red", xlim = c(0,6), xaxp = c(0,6,3), xlab ="Global Active Power (kilowatts)", ylim = c(0,1200), yaxp = c(0,1200,6), main ="Global Active Power")

# Save plot at png
dev.copy(png, "plot1.png")
dev.off()

