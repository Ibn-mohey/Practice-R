
'''
5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
  '''
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)

head(SCC)
     
library(ggplot2)
baltimoreMotor <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")

aggregated5 <- aggregate(baltimoreMotor$Emissions, by=list(year=baltimoreMotor$year), FUN=sum)
aggregated5

png(filename='plot5.png')
g <- ggplot(aggregated5, aes(year, x)) 
g + geom_point(size = 5, alpha = 1/2) + geom_line( size = 1 , color = 'blue')+ 
    ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
    ylab(expression("Total Baltimore " ~ PM[2.5] ~ "Motor Vehicle Emissions")) +
    xlab("Year")
dev.off()