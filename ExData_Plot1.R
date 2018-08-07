## unzip and loading the data
##install.packages("data.table")
library("data.table")
setwd("e:\\MachineLearning\\My-R-programming-Repo")
path <- paste(getwd(), "data", sep="/")
path
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))

setwd(path)
unzip(zipfile = paste(path,"dataFiles.zip",sep = "/"))

SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))

# As code path is different from the data file path
setwd("e:\\MachineLearning\\My-R-programming-Repo")

#1.Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all 
#sources for each of the years 1999, 2002, 2005, and 2008.

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum) 

png('ExData_plot1.png') 
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years')) 
dev.off() 

