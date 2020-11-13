
'''
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
'''
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)

head(SCC)

library(ggplot2)
coalrows <- grepl("coal", SCC$Short.Name, ignore.case = T)
SCCcoal <- SCC[coalrows,]
NEIcoal <- subset(NEI , NEI$SCC %in% SCCcoal$SCC)
aggregated4 <- aggregate(NEIcoal$Emissions, by=list(year=NEIcoal$year , type=NEIcoal$type), FUN=sum)
aggregated4


png(filename='plot4.png')

g <- ggplot(aggregated4, aes(year, x , group= type)) 
g + geom_point(aes(color = type), size = 5, alpha = 1/2) + geom_line( size = 1)+ 
    ggtitle(expression("Total US " ~ PM[2.5] ~ "Coal Emission by Year for each Type")) +
    ylab(expression("Total US " ~ PM[2.5] ~ "Coal Emission")) +
    xlab("Year")

dev.off()