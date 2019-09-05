## ============================================================================
## Filename: plot3.R
# Author: Daniel DeWaters
# Date Created: 9/4/2019
# Description:  Recreate the fourth plot in the "figure" folder, 
#               "unnamed-chunk-5.png", a combination of 4 plots. The top left
#               is the graph made in plot2.R, a line graph of the Global Active
#               Power over the period of Feb 1st-2nd 2007, the top right is the
#               voltage over that same period, bottom left if the graph made in
#               plot3.R, a line graph of the energy sub metering over that
#               same period again, and the bottom right is a line graph of the
#               global reactive power over that same period once more.
## ============================================================================

# Open PNG file
png("./plots/plot4.png", width=480, height=480)

# Make plot grid
par(mfrow=c(2,2))

# Fill plot grid
with(relevant_data, {
  # Plot 1 ,topleft
  plot(Global_active_power ~ DateTime, type="n", xlab="", ylab="Global Active Power (kilowatts)")
  lines(relevant_data$DateTime, relevant_data$Global_active_power)
  # Plot 2, topright
  plot(Voltage ~ DateTime, type="n", xlab="Voltage", ylab="datetime")
  lines(relevant_data$DateTime, relevant_data$Voltage)
  # Plot 3, bottom left
  plot(Sub_metering_1 ~ DateTime, type="n", xlab="", ylab="Energy sub metering")
  lines(relevant_data$DateTime, relevant_data$Sub_metering_1, col="black")
  lines(relevant_data$DateTime, relevant_data$Sub_metering_2, col="red")
  lines(relevant_data$DateTime, relevant_data$Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="-")
  # Plot 4, bottom right
  plot(Global_reactive_power ~ DateTime, type="n", xlab="datetime", ylab="Global_reactive_power")
  lines(relevant_data$DateTime, relevant_data$Global_reactive_power)
})

# Close PNG file
dev.off()
