
##-----------------------------------------##
##-----------------------------------------##
##Step 1 <<Start>>
##Merges the training and the test sets to create one data set

## Creates Files if it doesn't exist
## Download file from url and unzip it 
if(!file.exists("./SamsungData")){dir.create("./SamsungData")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./SamsungData/Dataset.zip")
unzip(zipfile="./SamsungData/Dataset.zip",exdir="./SamsungData")

## Load tables to working environment
## Name Columns to combine/merge tables
x_train <- read.table("./SamsungData/UCI HAR dataset/train/X_train.txt")
y_train <- read.table("./SamsungData/UCI HAR dataset/train/y_train.txt")
subject_train <- read.table("./SamsungData/UCI HAR dataset/train/subject_train.txt")

x_test <- read.table("./SamsungData/UCI HAR dataset/test/X_test.txt")
y_test <- read.table("./SamsungData/UCI HAR dataset/test/y_test.txt")
subject_test <- read.table("./SamsungData/UCI HAR dataset/test/subject_test.txt")

features <- read.table('./SamsungData/UCI HAR dataset/features.txt')

act_labels = read.table('./SamsungData/UCI HAR dataset/activity_labels.txt')

colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(act_labels) <- c('activityId','activityType')


##Merges the training and the test sets to create one data set
train_full <- cbind(y_train, subject_train, x_train)
test_full <- cbind(y_test, subject_test, x_test)
All_data <- rbind(train_full, test_full)
##Step 1 <<End>>  
##-----------------------------------------##
##-----------------------------------------##

##-----------------------------------------##
##-----------------------------------------##
##Step 2 <<Start>>
## Extracts only the measurements on the mean and standard deviation for each measurement 
col_names <- colnames(All_data)
subset_col_names <- (grepl("activityId" , col_names) | 
                      grepl("subjectId" , col_names) | 
                      grepl("mean.." , col_names) | 
                      grepl("std.." , col_names)
                    )


##extract only subset needed
All_data_subset <- All_data[ ,subset_col_names == TRUE]

##Step 2 <<End>>  
##-----------------------------------------##
##-----------------------------------------##


##-----------------------------------------##
##-----------------------------------------##
##Step 3 <<Start>>
##Uses descriptive activity names to name the activities in the data set
## Merge data set with activity labels to get activity names
All_data_subset <- merge(All_data_subset, act_labels,
                         by='activityId',
                         all.x=TRUE)

##Step 3 <<End>>
##-----------------------------------------##
##-----------------------------------------##

##-----------------------------------------##
##-----------------------------------------##
##Step 4 <<Start>>
##Appropriately labels the data set with descriptive variable names.
names(All_data_subset)<- gsub("^t","Time", names(All_data_subset))
names(All_data_subset)<- gsub("^f","Frequency", names(All_data_subset))
names(All_data_subset)<- gsub("Acc","Accelerometer", names(All_data_subset))
names(All_data_subset)<- gsub("Gyro","Gyroscope", names(All_data_subset))
names(All_data_subset)<- gsub("Mag","Magnitude", names(All_data_subset))
names(All_data_subset)<- gsub("BodyBody","Body", names(All_data_subset))
##Step 4 <<End>>
##-----------------------------------------##
##-----------------------------------------##


##-----------------------------------------##
##-----------------------------------------##
##Step 5 <<Start>>
##From the data set in step 4, creates a second, 
##independent tidy data set with the average of each variable
##for each activity and each subject.
## Apply order to columns
All_data_subset <- All_data_subset[,c(82,(1:81))]
All_data_subset_2 <- aggregate(. ~activityType + subjectId , All_data_subset, mean)
## Write txt from final result

write.table(All_data_subset_2, "TiddyDoc_project.txt", row.name=FALSE)
##Step 5 <<End>>
##-----------------------------------------##
##-----------------------------------------##
