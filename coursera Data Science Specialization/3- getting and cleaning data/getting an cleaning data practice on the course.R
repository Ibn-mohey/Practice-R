#getting an cleaning data practice on the course 

## downloading files 

#get and set WD

## ../ up and 
## 


## use the backslah  for windows 

if (!file.exists('the file'))
{
    dir.create('data')
}

#url = 
#distination = 
#method =

url <-  
distination <- 

    
path <- getwd()

#to reach some path use the file.path function 
file.path(path, "UCI HAR Dataset/train/Y_train.txt")

download.file(url, distfile = distination, method = "crul")

#read

read.table()
read.csv()
read.csv2()

#header = true the variable name is included in the file 

data <- read.table('./data/cameras.csv', sep = ',',head = TRUE)
#read.csv() >>>>  sep = ',',head = TRUE
#nrow how many rows to read 
#skip some rows 
#quote = "" helpfull tip in reading local files


## less 06 

#reading excell files 

# .xlsx

library(xlsx)

#read.xlsx() to get into it 
# sheetIndex = 1 ,,,,, header = TRUE

# col and row index to read some specofic files into R 


## sumarizing data 

#head( dataframe , n = )
#tail 
#summary 
#str 

#quantile

#quantile

#table with specific variables useNA="ifany" make sure u r not missing values 
#make cross tab 
#identify where the relationship exists in this data set

#xtabs( #variable wanna be displayed  ~ another one + , data =        )
    
#flat table make it more compact and sumarize it 

#cut commend categorical into quantative 

#factore vaiable 
# i can remake it into table to cluster them 

library(hmisc)
#cut2( , g = )

#factor variable 
#factor()
#Factor variables are categorical variables that can be either numeric or string variables.
#can be used in statistical modeling where they will be implemented correctly
#very useful in many different types of graphics.


#reshape 
library(reshape2)
#melt (data frame , id = c("" , "" ) , measure.vars = c("",""))

mtcars$carname <- rownames(mtcars)
carmelt <- melt(mtcars, id = c("carname" , "gear" , "cyl") , measure.vars = c("mpg",  "hp") )
head(carmelt)


cyldata <- dcast(carmelt, cyl ~ variable, mean )
cyldata


##merging data 

if(!file.exists("./data")){dir.create("./data")}
fileUrl1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./data/reviews.csv",method="curl")
download.file(fileUrl2,destfile="./data/solutions.csv",method="curl")

reviews = read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")
head(reviews)

mergedData = merge(reviews ,solutions , by.x="solution_id", by.y="id" , all=TRUE)
#all = true that they add if they cant find the same id 
#deff it merge with the same columns names 

head(mergedData)

interaction(names(),names())
arrange(join(df,df), the wanted column )
dflist = list(df, df , df)
join_all(dflist )

#see the left and right join first 

#