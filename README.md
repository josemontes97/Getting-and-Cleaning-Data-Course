# Getting-and-Cleaning-Data-Course
Getting-and-Cleaning-Data-Course files

Run_Analysis. file is the principal file in wich the variables were renamed as follow:

t         = Time
f         = Frequency
ACC       = Accelerometer
Gyro      = Gyroscope
Mag       = Magnitude
BodyBody  = Body

    names(All_data_subset)<- gsub("^t","Time", names(All_data_subset)) 
    names(All_data_subset)<- gsub("^f","Frequency", names(All_data_subset))
    names(All_data_subset)<- gsub("Acc","Accelerometer", names(All_data_subset))
    names(All_data_subset)<- gsub("Gyro","Gyroscope", names(All_data_subset))
    names(All_data_subset)<- gsub("Mag","Magnitude", names(All_data_subset))
    names(All_data_subset)<- gsub("BodyBody","Body", names(All_data_subset))
