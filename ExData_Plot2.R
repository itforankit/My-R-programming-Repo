## Chcking the existence of NEI and SCC
if(!exists("NEI")){ 
    NEI <- readRDS("./data/summarySCC_PM25.rds") 
  } 
if(!exists("SCC")){ 
    SCC <- readRDS("./data/Source_Classification_Code.rds") 
  } 
# 2.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510"\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
subsetNEI  <- NEI[NEI$fips=="24510", ] 
dim(subsetNEI)
str(subsetNEI)
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum) 

png('ExData_plot2.png') 
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('Emission'),main=expression('Total PM'[2.5]*' in the Baltimore City')) 
dev.off() 
