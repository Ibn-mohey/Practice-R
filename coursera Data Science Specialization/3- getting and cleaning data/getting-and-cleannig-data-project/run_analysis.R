#the below note only for me just ignore it 
#wd = 'E:/career/Dataa/data sciene Specialization/03. Getting and Cleaning Data/course data/the project data'
#setwd(wd)

#what the code will do is 
#get the Working directory u have and set it to dumy var called path 
#list the WD files for your eays to see it 
#check if you downloaded the file and unzipped it the way the code meant to be run with if not it will donwload the file and unzipp it for u
#please note that the code count on your data and that it wasn't touched if u edited your data by any mean plz jsut re unzipp the file in the 
#WD directory u want and run the setwe() in this directory and the code should work fine 

rm(list=ls())
library(reshape2)
library(data.table)

getwd()
path <- getwd()
list.files(path)
WDtobereadfrom <- c("UCI HAR Dataset/test","UCI HAR Dataset/train")
if (file.exists(WDtobereadfrom)){
    print("you are good to go")
} else {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", file.path(path, "dataFiles.zip"))
    unzip(zipfile = "dataFiles.zip")
    
}

##rading the tables into the R 

#the features
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")      #some valus for the features
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")         #some valus for the features
#activity
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")      #factors for the activity
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")          #factors for the activity

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")  #factors for the subject    
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")     #factors for the subject

features <- read.table("UCI HAR Dataset/features.txt")      #561   2        #labels index and Factors labels
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt") #6 2          #labels index and Factors labels

#we need to exclude the index column from the features & activity and make them characters 

features_label <- as.character(features[,2])

# 1. Merges the training and the test sets to create one data set.

x_merged <- rbind(x_train, x_test)      #10299   561
y_merged <- rbind(y_train, y_test)      #10299     1

subject_merged <- rbind(subject_train, subject_test) #10299     1

all_data <- cbind(x_merged,y_merged,subject_merged) #10299   563 = 561 form features (x) + activity + subject

#not all the 561 is meanfull move to the next step

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

featuresWanted <- grep(".*mean.*|.*std.*", features_label, ignore.case=TRUE) #get the mean and STD ones 
featuresWantednames <- features_label[featuresWanted]
all_data <- all_data[,c(featuresWanted, 562, 563)] #take only the wanted features not incliding 562 and 563 will just drop the act and the sub

# 3. Uses descriptive activity names to name the activities in the data set.

colnames(all_data) <- c(featuresWantednames, "Activity" , "Subject") #name the columns 

# 4. Appropriately labels the data set with descriptive activity names.
#look into some of the names 
#names(all_data) #look into all data
# "tBodyAcc-mean()-X"   "tGravityAcc-std()-X" "tBodyGyro-mean()-Y" 
#Using its embedded accelerometer and gyroscope from the site 
#looking to the video we can see that there is time factor and Frequency factor 

names(all_data) = gsub('[-]', ' ', names(all_data)) #clean  -
names(all_data) <- gsub('[()]', '', names(all_data)) #clean ()
names(all_data)<-gsub("Acc", " Accelerometer", names(all_data))  #Acc  into Accelerometer
names(all_data)<-gsub("Gyro", " Gyroscope", names(all_data))     #Acc  into Accelerometer
names(all_data)<-gsub("Jerk", "  Jerk", names(all_data))     #what is this?
names(all_data)<-gsub("Mag", " Mag", names(all_data)) #what is this?
names(all_data)<-gsub("^t", "Time ", names(all_data))        #t into time 
names(all_data)<-gsub("^f", "Frequency ", names(all_data))   #f into Frequency
names(all_data)<-gsub("BodyBody", "Body", names(all_data))  #clear the double body 
names(all_data)<-gsub("meanFreq", "mean", names(all_data))  #freq is arleady included
names(all_data)<-gsub("angle", "angle ", names(all_data))  #add space to angle 
names(all_data)<-gsub("tBody", "Time body", names(all_data))  #manual edit for some values
names(all_data)<-gsub(",gravityMean", "gravity Mean", names(all_data))  #manual edit for some values
names(all_data)<-gsub("JerkMean", "Jerk Mean", names(all_data))  #manual edit for some values
names(all_data)<-gsub("mean", " Mean", names(all_data))  #manual edit for some values
names(all_data)<-gsub("gravity", " gravity", names(all_data))  #manual edit for some values
names(all_data)<-gsub("GyroscopeMean", "Gyroscope Mean", names(all_data))  #manual edit for some values
names(all_data)<-gsub("AccelerometerMean", "Accelerometer Mean", names(all_data))  #manual edit for some values

names(all_data)<-gsub("  ", " ", names(all_data))  #clear the double space problem if exists
#names(all_data) #recheck

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject
#i found that if i didnt as.factor the Activity and the Subject i lose them in the agreegation
all_data$Activity <- as.factor(all_data$Activity)
all_data$Subject <- as.factor(all_data$Subject)
data.class(all_data)
dim(all_data)

data_table <- data.table(all_data)
tidy_data <- aggregate(. ~Subject + Activity, data_table, mean)
data.class(data_table)
dim(data_table)

write.table(tidy_data, file = "tidydata.txt", row.names = FALSE)
