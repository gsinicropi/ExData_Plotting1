# 11/05/2014 
# Data Science Track - Specialization
# Course "Exploratory Data Analysis"
# Plot3.png Assignment
# github repository: gsinicropi/ExData_Plotting1 - forked from rdpeng/ExData_Plotting1


# Begin plotting plot3.png

# It's assumed that you have your file in your working directory. If not, you have to download it.  
# code to download file, if needed:
# library("downloader")
# url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# zip.filename <- "exdata_data_household_power_consumption.zip"
# download(url, zip.filename, mode="wb")
# extracted.filename <- unzip(zip.filename)


# Plot3.png

# clear the workspace

rm(list=ls())


# BEGIN READING

# file name

nFile <- "household_power_consumption.txt"

# Because of we will only be using data from the dates 2007-02-01 and 2007-02-02, an alternative to load the entire file is to read the data from just those dates.

# sql to load only data needed for our analysis

qSql <- "SELECT * from file WHERE Date = '1/2/2007' or Date = '2/2/2007'"

# reading data into R - filtered only days 1/2 AND 2/2

dSet <- read.csv.sql(nFile, sql=qSql, sep=";")


# your computer has enough memory you can read the entire dataset:

# dSet<- read.table("./household_power_consumption.txt")

# Subsetting the full data to obtain the data related to two days: 

# sSet<- subset(dSet, (dSet$Date == "1/2/2007" | dSet$Date== "2/2/2007")) 

# END READING


# Convert the Date and Time variables to Date/Time classes 

dSet$Date <- as.Date(dSet$Date, format = "%d/%m/%Y")

# Concat the Date and Time variable creating "DateTime" column:

dSet$DateTime <- as.POSIXct(paste(dSet$Date, dSet$Time))


# set the locale in RStudio - thanks to Klaus-Dieter Schmatz for suggestion here: https://class.coursera.org/exdata-002/forum/thread?thread_id=100

Sys.setlocale(locale = "C")


# BEGIN PLOTTING

# open file png

png("plot3.png", width=480, height= 480)

# create plot

plot(dSet$DateTime, dSet$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(dSet$DateTime, dSet$Sub_metering_2, type="l", col="red")
lines(dSet$DateTime, dSet$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue")) 

# close the file png

dev.off()

# END Plot3.png Assignment

# End plotting plot3.png
# 11/05/2014 
# Data Science Track - Specialization
# Course "Exploratory Data Analysis"
# Plot1.png Assignment
# github repository: gsinicropi/ExData_Plotting1 - forked from rdpeng/ExData_Plotting1