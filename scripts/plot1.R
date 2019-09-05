## ===========================================================================
## Filename: plot1.R
# Author: Daniel DeWaters
# Date Created: 9/4/2019
# Description: Recreate the first plot in the "figure" folder, 
#              "unnamed-chunk-2.png", a histogram of the "global active power"
#              column in the dataset. Make sure you run "getData.R" before
#              running any of the plotting scripts.
## ===========================================================================
# Open PNG file
png("./plots/plot1.png", width=480, height=480)

# Make plot
with(data, 
     hist(Global_active_power, 
          col="red",
          main="Global Active Power",
          xlab="Global Active Power (kilowatts)",
          ylab="Frequency"))

# Close PNG file
dev.off()