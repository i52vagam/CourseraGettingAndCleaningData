

#CodeBook

This document explains the variables contained in the file "AveragesTidyDataSet.txt"

There are two main groups of variables:

######1. activity/subject:  
  The file is grouped by these variables, so each row has an unique value for the pair activity/subject.  
  There is 30 differents subjects and 6 differents activities, so we will have 180 (30x6) rows.  
    * **subject**: Indicates the subject (person) from which measurements were taken.  
        Values: There are 30 volunteers so the variable will have 30 diferrents values (from 1 to 30)    
        
    * **activity**: Show the state of the subject (the action that the subject was performing) when the measurements were taken.  
    
        Values: it can take 6 differents values:
          * WALKING.  
          * WALKING_UPSTAIRS  
          * WALKING_DOWNSTAIRS  
          * SITTING  
          * STANDING  
          * LAYING    

######2. Measurements:    

  Each variable name indicate the kind of measurement taken and the function applied to them (only mean and standard deviation measurements were taken from the original data).    

  The values show the mean of the values for each pair subject/activity.  

  The names have 4 main parts:  
    1. **Domain**: "time" or "frequency"  
    2. **Measurement target**: "BodyAcc", "GravityAcc", "BodyAccJerk", "BodyGyro", "BodyGyroJerk", "BodyAccMag", "GravityAccMag", "BodyAccJerkMag", "BodyGyroMag", "BodyGyroJerkMag", "BodyBodyAccJerkMag", "BodyBodyGyroMag" or "BodyBodyGyroJerkMag"  
    3. **Function applied**: "Mean" or "Std"  
    4. **Axis**: "X", "Y", "Z" or ""(null)  

    Variable list:
      timeBodyAccMeanX  
      timeBodyAccMeanY
      timeBodyAccMeanZ
      timeBodyAccStdX
      timeBodyAccStdY
      timeBodyAccStdZ
      timeGravityAccMeanX
      timeGravityAccMeanY
      timeGravityAccMeanZ
      timeGravityAccStdX
      timeGravityAccStdY
      timeGravityAccStdZ
      timeBodyAccJerkMeanX
      timeBodyAccJerkMeanY
      timeBodyAccJerkMeanZ
      timeBodyAccJerkStdX
      timeBodyAccJerkStdY
      timeBodyAccJerkStdZ
      timeBodyGyroMeanX
      timeBodyGyroMeanY
      timeBodyGyroMeanZ
      timeBodyGyroStdX
      timeBodyGyroStdY
      timeBodyGyroStdZ
      timeBodyGyroJerkMeanX
      timeBodyGyroJerkMeanY
      timeBodyGyroJerkMeanZ
      timeBodyGyroJerkStdX
      timeBodyGyroJerkStdY
      timeBodyGyroJerkStdZ
      timeBodyAccMagMean
      timeBodyAccMagStd
      timeGravityAccMagMean
      timeGravityAccMagStd
      timeBodyAccJerkMagMean
      timeBodyAccJerkMagStd
      timeBodyGyroMagMean
      timeBodyGyroMagStd
      timeBodyGyroJerkMagMean
      timeBodyGyroJerkMagStd
      frequencyBodyAccMeanX
      frequencyBodyAccMeanY
      frequencyBodyAccMeanZ
      frequencyBodyAccStdX
      frequencyBodyAccStdY
      frequencyBodyAccStdZ
      frequencyBodyAccJerkMeanX
      frequencyBodyAccJerkMeanY
      frequencyBodyAccJerkMeanZ
      frequencyBodyAccJerkStdX
      frequencyBodyAccJerkStdY
      frequencyBodyAccJerkStdZ
      frequencyBodyGyroMeanX
      frequencyBodyGyroMeanY
      frequencyBodyGyroMeanZ
      frequencyBodyGyroStdX
      frequencyBodyGyroStdY
      frequencyBodyGyroStdZ
      frequencyBodyAccMagMean
      frequencyBodyAccMagStd
      frequencyBodyBodyAccJerkMagMean
      frequencyBodyBodyAccJerkMagStd
      frequencyBodyBodyGyroMagMean
      frequencyBodyBodyGyroMagStd
      frequencyBodyBodyGyroJerkMagMean
      frequencyBodyBodyGyroJerkMagStd
      subject
      activity
