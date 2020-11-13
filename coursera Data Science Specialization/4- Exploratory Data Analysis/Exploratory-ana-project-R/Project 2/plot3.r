'''
Of the four types of sources indicated by the ???????????????? (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
    Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
'''


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)

head(SCC)

Baltimore <- subset(NEI , NEI$fips == "24510")
aggregated3 <- aggregate(forbaltimore$Emissions, by=list(year=forbaltimore$year , type=forbaltimore$type), FUN=sum)
aggregated3

library(ggplot2)

g <- ggplot(aggregated3, aes(year, x , group= type)) 

png(filename='plot3.png')

g + geom_point(aes(color = type), size = 5, alpha = 1/2) + geom_line( size = 1)+ 
    ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions by Year for each Type")) +
    ylab(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions")) +
    xlab("Year")
dev.off()