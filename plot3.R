################################################################################
#Course: Exploratory Data Analysis#
#Week #1: Base Plotting and Graphics File 
#Date: 10/Apr/2015
################################################################################



################################################################################

################################################################################
#               Set the working directory
################################################################################
#setwd("/Users/ApigeeCorporation/Desktop/VishalArchive/04-Exploratory Data Analysis/Course Assignments/Project/Project 1/")
#getwd()

# library used for this project
library(plyr)
library(dplyr)

# read the data from the Electric power consumption (epc) and create epc dataset 
epcdata <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE)
# check the rows and column to ensure read is successful
str (epcdata) # 2075259 obs. of  9 variables
# create a new column which is date time and format it using strptime() 
epcdata <- mutate(epcdata, DateTime = as.POSIXct(strptime(paste(Date, Time),"%d/%m/%Y %H:%M:%S")))
# create a subset of data for 2 days 
subepcdata <- filter (epcdata, DateTime >= '2007-02-1' & DateTime < '2007-02-03')

# create plot and save the result in plot3.png
with(subepcdata, plot(DateTime, as.numeric(Sub_metering_1), type = "n", xlab="", ylab="Energy sub metering"))
with(subepcdata, points(DateTime, as.numeric(Sub_metering_1), type ="l", col="black"))
with(subepcdata, points(DateTime, as.numeric(Sub_metering_2), type ="l", col="red"))
with(subepcdata, points(DateTime, as.numeric(Sub_metering_3), type ="l", col="blue"))
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Copy plot to a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px") 
# Close the PNG device!
dev.off()  


