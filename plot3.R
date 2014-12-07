# Project 1 Plot3

# Read the table
df = read.table("household_power_consumption.txt", sep=";", header = T)

# subset the data with the given dates
df$Date <- as.Date(df$Date, "%d/%m/%Y")
date1 = as.Date("2007-02-01","%Y-%m-%d") 
date2 = as.Date("2007-02-02","%Y-%m-%d") 
dfr <- df[df$Date >= date1 &  df$Date <= date2,]

# convert some factors to numeric  (Sub_metering_3 is already numeric)
for(i in 3:8)
  dfr[,i] <- as.numeric(as.character(dfr[,i]))

# combine date and time
dfr$DateTime <-  paste(as.character(dfr$Date),dfr$Time)
dfr$DateTime <- strptime(dfr$DateTime, "%Y-%m-%d %H:%M:%S") 

#####################################################
## Plot 3

png(file = "plot3.png", width = 480, height=480)
plot(dfr$DateTime, dfr$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(dfr$DateTime, dfr$Sub_metering_2, col = "red")
lines(dfr$DateTime, dfr$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1, 1), col = c("black", "red", "blue"))
dev.off()