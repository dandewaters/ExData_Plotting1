## ===========================================================================
## Filename: plot3.R
# Author: Daniel DeWaters
# Date Created: 9/4/2019
# Description:  Recreate the third plot in the "figure" folder, 
#               "unnamed-chunk-4.png", a line graph of the energy sub metering
#               over the period of Feb 1st-2nd 2007. Make sure you run
#               "getData.R" before running any of the plotting scripts.
## ===========================================================================
# Open PNG file
png("./plots/plot3.png", width=480, height=480)

# Makes plot frame
with(relevant_data, 
     plot(Sub_metering_1 ~ DateTime, 
          type="n", 
          xlab="", ylab="Energy sub metering"))

# Adds data points to plot
lines(relevant_data$DateTime, relevant_data$Sub_metering_1, col="black")
lines(relevant_data$DateTime, relevant_data$Sub_metering_2, col="red")
lines(relevant_data$DateTime, relevant_data$Sub_metering_3, col="blue")

# Adds legend to the plot
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="-")

# Close PNG file
dev.off()