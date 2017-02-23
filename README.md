 # Getting-and-Cleaning-Data-Course
  Getting-and-Cleaning-Data-Course files		  Getting-and-Cleaning-Data-Course files
  		  
 -Run_Analysis. file is the principal file in wich the variables were renamed as follow:		 +the Run_anlysis will perform the following activities:
 +
 +1.Merges the training and the test sets to create one data set.
 +2.Extracts only the measurements on the mean and standard deviation for each measurement.
 +3.Uses descriptive activity names to name the activities in the data set
 +4.Appropriately labels the data set with descriptive variable names.
 +the following criteria was used to change the varable names:
 +    t         = Time
 +    f         = Frequency
 +    ACC       = Accelerometer
 +    Gyro      = Gyroscope
 +    Mag       = Magnitude
 +    BodyBody  = Body
 +
 +        names(All_data_subset)<- gsub("^t","Time", names(All_data_subset)) 
 +        names(All_data_subset)<- gsub("^f","Frequency", names(All_data_subset))
 +        names(All_data_subset)<- gsub("Acc","Accelerometer", names(All_data_subset))
 +        names(All_data_subset)<- gsub("Gyro","Gyroscope", names(All_data_subset))
 +        names(All_data_subset)<- gsub("Mag","Magnitude", names(All_data_subset))
 +        names(All_data_subset)<- gsub("BodyBody","Body", names(All_data_subset))
 +
 +5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
