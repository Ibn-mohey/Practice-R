
#plot on 

'''
Question 2
Of the four types of sources indicated by the ???????????????? (point, nonpoint, onroad, nonroad) variable, 
which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in e
missions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
'''

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


forbaltimore <- subset(NEI , NEI$fips == "24510")

aggregated <- 2 <- aggregate(forbaltimore$Emissions, by=list(year=forbaltimore$year), FUN=sum)
aggregated2

png(filename='plot2.png')
plot(aggregated2$year, aggregated2$x, type = "l", col = "red"
     , main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year")
     , ylab = expression("Total Baltimore   PM[2.5] ~ "Emissions")
     , xlab = "Year")

dev.off()