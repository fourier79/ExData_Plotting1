# Project 1 Plot1

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


#####################################################
# plot 1
png(file = "plot1.png", width = 480, height=480)
hist(dfr$Global_active_power, xlab="Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()

