# CourseraGettingAndCleaningData
Repository hosting my project for the Coursera "Getting and Cleaning Data" course by Johns Hopkins University

#####Repository content:
1. README.md: This document
2. CookBook.md: Contain information about the variables contained in the file "AveragesTidyDataSet.txt"
3. run_analysis.R: Script that, applied on the source dataset, will return the file "AveragesTidyDataSet.txt"
4. AveragesTidyDataSet.txt: results file.

#####Experiment and data introduction

The dataset and the experiment is explained in the next URL:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The source data can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#####How to read AveragesTidyDataSet.txt

To read the final results file in R is recommended to use the next sentece:  
`read.table("AveragesTidyDataSet.txt",header=TRUE)`

The file must be in the WorkingDirectory or it will be necessary to change the path in the sentence.

#####R script   

To run the script is not necessary to download the data first. If all necessary files aren't in the working directory, the script will download an unzip the files in the working directory.

The files used by the script are located in the "UCI HAR Dataset" folder. This is the list of needed files:  
`train/X_train.txt`
`train/y_train.txt`
`train/subject_train.tx`
`test/X_test.txt`
`test/y_test.txt`
`test/subject_test.txt`
`features.txt`
`activity_labels.txt`

The script read the source data into differents dataframe and perform five main steps:

1. Merges the training and the test sets to create one data set.  
  This is done using `rbind` to join the rows in the train files with the rows in the test files in a data frame.
2. Extracts only the measurements on the mean and standard deviation for each measurement.   
  The script will extract the index of the variables which name has "mean()" or "std()".
  It will not consider like mean measures the names which contain mean (like angle(Z,gravityMean)) or meanFreq (fBodyAccMag-meanFreq()).
  `grep` will be used for this task
3. Uses descriptive activity names to name the activities in the data set.  
  The names contained in activity_labels.txt will be used to name the activities in the data set and the variable will be labeled as "activity".
4. Appropriately labels the data set with descriptive variable names.  
  The script will use the names contained in features.txt and will apply some changes to these names:
  * "-mean()" will be replaced by "Mean"
  * "-std()" will be replaced by "Std"
  * "-" will be deleted
  * The first "t" will be replaced by "time"
  * The first "f" will be replaced by "frequency"
5. Creates a file named "AveragesTidyDataSet.txt" with the average of each variable for each activity and each subject.  
  For this, a final data frame is created fusing all the dataframe (variables dataframe, subject dataframe and activities dataframe) with `cbind`. This data frame will be grouped by activity and subject and will be calculated the mean of each variable for each subject-activity pair (the library `(dplyr)` will be used for this).
