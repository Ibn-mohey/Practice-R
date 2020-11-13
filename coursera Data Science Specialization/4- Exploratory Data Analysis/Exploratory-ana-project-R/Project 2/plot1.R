#plot on 


'''
Question 1
Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of
the years 1999, 2002, 2005, and 2008.

'''

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

aggregated1 <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)
aggregated1

png(filename='plot1.png')

plot(aggregated1$year, aggregated1$x, type = "l", col = "red"
     , main = expression("Total US "~ PM[2.5]~ "Emissions by Year")
     , ylab = expression("Total US "~   PM[2.5] ~ "Emissions")
     , xlab = "Year")

dev.off()