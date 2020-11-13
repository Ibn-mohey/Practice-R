'''
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
   ''' 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)

head(SCC)
library(ggplot2)
twociteis <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
twociteis

aggregated6 <- aggregate(twociteis$Emissions, by=list(year=twociteis$year ,city=twociteis$fips), FUN=sum)
aggregated6

png(filename='plot6.png')
g <- ggplot(aggregated6, aes(year, x , group= city)) 
g + geom_point(aes(color = city), size = 5, alpha = 1/2) + geom_line( size = 1, color = 'green')+ 
    ggtitle(expression("Baltimore and Los Angeles" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
    ylab(expression("Total"~PM[2.5]~ "Motor Vehicle Emissions")) +
    xlab("Year")
dev.off()