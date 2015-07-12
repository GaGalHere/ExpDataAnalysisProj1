# Exploritory Data Analysis
#
# Course Project 1
#
# define working directory-for reading in 9 col, 2,075,259 rows
#
setwd("~/Documents/Coursera/4 ExploritoryDataAnalysisInR/Proj1")
## Read in data
col_class<-c("character","character","numeric",
             "numeric","numeric","numeric",
             "numeric","numeric","numeric")
data<-read.table(file="household_power_consumption.txt",
                 sep=";",
                 na.strings = "?",
                 blank.lines.skip = TRUE,
                 header=TRUE,
                 dec=".",
                 colClasses=col_class, skip=0)
# Create field for data and time together in one field
datetime<-strptime(paste(data$Date, data$Time, sep = " "),
                   "%d/%m/%Y %H:%M:%S")
# Extract Date from data
date<-strptime(data$Date, "%d/%m/%Y", tz="")
# Extract year and month
year <- as.numeric(format(date, format = "%Y")) 
month <- as.numeric(format(date, format = "%m")) 
day <- as.numeric(format(date, format = "%d")) 
# Combine datatime to data
all_data<-cbind(year,month,day,date,datetime,data)
# Subset data to get data for 2007-02-01 to 2007-02-02
subdata1 <- subset(all_data, year == 2007 & month == 2)
subdata2 <- subset(subdata1, day == 1 | day == 2)
# Histogram plot 1
par(mar=c(4,4,2,1))
plot1<-hist(subdata2$Global_active_power,col="red",
            xlab="Global Active Power - kilowatts",
            main="Global Active Power")
#Copy plot to PNG file
dev.copy(png, file="plot1.png")
dev.off()
