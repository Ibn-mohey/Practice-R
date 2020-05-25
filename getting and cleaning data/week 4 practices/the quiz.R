#here we go  
#started at 4:11

#(The American Community Survey distributes downloadable data about United States communities. 
#Download the 2006 microdata survey about housing for the state of Idaho using download.file() 

#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

#and load the data into R. The code book, describing the variable names is here:
    
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

#Apply strsplit() to split all the names of the data frame on the characters "wgtp". What is the value of the 123 element of the resulting list?)

#read the file and load the library 

library(data.table)
### down and more if needed 
#file1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
#download.file(file1, destfile = "./data/file1.csv",  method = "curl")
#list.files("./data")

data1 <- data.table(
                    read.csv("./data/file1.csv", sep = ",", header = TRUE)
                    )

#extract the names of them names(data1)
split1 <- strsplit(names(data1), "wgtp")
split1[[123]]


### Q2 
#Remove the commas from the GDP numbers in millions of dollars and average them. What is the average?

### down and more if needed 
file2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(file2, destfile = "./data/file2.csv",  method = "curl")
data2 <- data.table(read.csv("./data/file2.csv", sep = ",", nrows = 219, stringsAsFactors = FALSE))

#gsub() will return a character vector, not a numeric vector (which is it sounds like you want). 
#as.numeric() will convert the character vector back into a numeric vector:
#subset the needed column 

x <- data2$X.3[-c(1:4)]
mean <-mean(
        
    as.numeric(gsub(',' ,'', x)) 
    ,na.rm = TRUE
)
mean

#solution inline 
dtGDP <- data.table(read.csv("./data/file2.csv", skip = 4, nrows = 215, stringsAsFactors = FALSE))
dtGDP <- dtGDP[X != ""]
dtGDP <- dtGDP[, list(X, X.1, X.3, X.4)]
setnames(dtGDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "gdp")) gdp <- as.numeric(gsub(",", "", dtGDP$gdp))
mean(gdp, na.rm = TRUE)

