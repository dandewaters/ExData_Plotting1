## ===========================================================================
## Filename: plot2.R
# Author: Daniel DeWaters
# Date Created: 9/4/2019
# Description:  Recreate the second plot in the "figure" folder, 
#               "unnamed-chunk-3.png", a line graph of the global active power
#               over the period of Feb 1st-2nd 2007. Make sure you run
#               "getData.R" before running any of the plotting scripts.
## ===========================================================================
# Make PNG file
png("./plots/plot2.png", width=480, height=480)

# Makes plot frame
with(relevant_data, 
     plot(Global_active_power ~ DateTime, 
          type="n", 
          xlab="", ylab="Global Active Power (kilowatts)"))

# Adds data points to plot
lines(relevant_data$DateTime, relevant_data$Global_active_power)

# Close PNG file
dev.off()