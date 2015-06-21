library(dplyr)

#Before get to work, we are going to check if we have the necessary files in the correct folder.
#If we don't have them, we will download and unzip the data files.

#file paths
dataset.path <- paste(getwd(), "UCI HAR Dataset",sep = "/") #Path of the dataset folder

X_train.path <- paste(dataset.path,"train/X_train.txt",sep = "/") 
y_train.path <- paste(dataset.path,"train/y_train.txt",sep = "/") 
subject_train.path <- paste(dataset.path,"train/subject_train.txt",sep = "/")

X_test.path <- paste(dataset.path,"test/X_test.txt",sep = "/") 
y_test.path <- paste(dataset.path,"test/y_test.txt",sep = "/") 
subject_test.path <- paste(dataset.path,"test/subject_test.txt",sep = "/")

features.path <- paste(dataset.path,"features.txt",sep = "/") 
activity_labels.path <- paste(dataset.path,"activity_labels.txt",sep = "/") 


#Checking files and getting its if necessary
if(!file.exists(X_train.path) | !file.exists(y_train.path) | !file.exists(subject_train.path) |
   !file.exists(X_test.path) | !file.exists(y_test.path) | !file.exists(subject_test.path) |
   !file.exists(features.path) | !file.exists(activity_labels.path) 
){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, "getdata_dataset.zip", method="curl")
  unzip("getdata_dataset.zip")
  remove(fileURL)
} 


#Extracting info from files to dataframes

X_train.data <- read.table(X_train.path)
y_train.data <- read.table(y_train.path)
subject_train.data <- read.table(subject_train.path)

X_test.data <- read.table(X_test.path) 
y_test.data <- read.table(y_test.path) 
subject_test.data <- read.table(subject_test.path)

features.data <- read.table(features.path) 
activity_labels.data <- read.table(activity_labels.path)

#removing path variables
remove(dataset.path,X_train.path,y_train.path,subject_train.path,X_test.path,y_test.path,subject_test.path,features.path,activity_labels.path)


#*****************************************************************
#HERE START COURSE PROJECT WORK **********************************
#****************************************************************


# 1. Merges the training and the test sets to create one data set.
#*****************************************************************

X.data <- rbind(X_train.data,X_test.data)
remove(X_train.data)
remove(X_test.data)

Y.data <- rbind(y_train.data, y_test.data)
remove(y_train.data)
remove(y_test.data)

subject.data <- rbind(subject_train.data,subject_test.data)
remove(subject_train.data)
remove(subject_test.data)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#*******************************************************************************************

#We will extract the index of the variables which name has "mean()" or "std()".
#We will not consider like mean measures the names which contain mean (like angle(Z,gravityMean)) or meanFreq (fBodyAccMag-meanFreq())
#Each row number match the features value of V1 so the extraction will be easier.

features.desired <- grep("(mean|std)\\(\\)", features.data[, 2])
X.SelectedFeatures <- X.data[,features.desired]
remove(X.data)


# 3. Uses descriptive activity names to name the activities in the data set
#***************************************************************************

#We will use the names contained in activity_labels.txt (activity_labels.data)
#and will set "activity" as variable name

Y.data[,1] <- activity_labels.data[Y.data[,1],2]
names(Y.data) <- "activity"
remove(activity_labels.data)


# 4. Appropriately labels the data set with descriptive variable names. 
#**********************************************************************
#We will use the names contained in features.txt (features.data)
#We will make the following changes:
# "-mean()" will be replaced by "Mean"
# "-std()" will be replaced by "Std"
# "-" will be deleted
# The first "t" will be replaced by "time"
# The first "f" will be replaced by "frequency"

names(X.SelectedFeatures) <- features.data[features.desired, 2]
names(X.SelectedFeatures) <- gsub("-mean\\(\\)","Mean",names(X.SelectedFeatures))
names(X.SelectedFeatures) <- gsub("-std\\(\\)","Std",names(X.SelectedFeatures))
names(X.SelectedFeatures) <- gsub("-","",names(X.SelectedFeatures))
names(X.SelectedFeatures) <- gsub("^t","time",names(X.SelectedFeatures))
names(X.SelectedFeatures) <- gsub("^f","frequency",names(X.SelectedFeatures))

#Now, we will label the variable from subjects dataset (subject.data)
names(subject.data) <- "subject"

#Now we are going to join all the dataframes
finalData <- cbind(X.SelectedFeatures,subject.data,Y.data)

remove(features.data)
remove(features.desired)
remove(X.SelectedFeatures)
remove(subject.data)
remove(Y.data)


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#***************************************************************************************************************************************************

DT.Tidy <- tbl_df(finalData)

result <- DT.Tidy %>%
            group_by(activity,subject) %>%
              summarise_each(funs(mean))


write.table(result, "AveragesTidyDataSet.txt",row.names = FALSE)

remove(DT.Tidy)
remove(finalData)
remove(result)

