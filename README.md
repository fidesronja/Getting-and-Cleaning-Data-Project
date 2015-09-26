# How Does The Script "run_analysis.R" work?

##loading required packages
>library(dplyr)
this is the only package I use for the later analysis

##reading the data in
>subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt") 
is reading in information of the testing set subjects

>x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
is reading in the testing data set

>y_test<-read.table("./UCI HAR Dataset/test/y_test.txt") ## Labels 
is reading in the labels for the testing data set

>subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
is reading in information of the testing set subjects

>x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
is reading in the testing data set

>y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
is reading in the labels for the testing data set

>activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
is reading in the activity labels

>features<-read.table("./UCI HAR Dataset/features.txt")
is reading in the features (variable names)

##clipping 
Now I am clipping the variable together, since they are now still in the right order.

>subject_y_test<-cbind(subject_test,y_test)
clipping together the information of the testing set subjects and the labels for the testing data set to a new data set (subject_y_test)

>subject_y_x_test<-cbind(subject_y_test,x_test)
adding the testing data 

>subject_y_train<-cbind(subject_train,y_train)
clipping together the information of the training set subjects and the labels for the training data set to a new data set (subject_y_train)

>subject_y_x_train<-cbind(subject_y_train,x_train)
adding the training data

>subject_y_x<-rbind(subject_y_x_test,subject_y_x_train)
combining the complete testing data set with the training data set

## labeling variables
>subj_names<-c("subject","activity_id")
>feature_names<-make.names(features$V2)
>var_names<-c(subj_names,feature_names)
here I created in three steps a character vector containing the variable names that I now need to assign to the data set

>names(subject_y_x)<-var_names
here I am assigning the vector containing the variable names to the dataset as column names

>names(activity_labels)<-c("id","activity")
before I merge the activity labels with the data set I also name the variable adequately

##merging with activity names
>full_data<-merge(subject_y_x, activity_labels, by.x="activity_id", by.y="id", suffixes = c(".l",".r"))
now I am merging the activity labels with the data set

##selecting columns
>selected_data <- full_data[, grep("mean|std|subject|activity", names(full_data))]
I am selecting only the measurements on the mean and standard deviation for each measurement (including meanFreq() because it is a weighted average of the frequency components to obtain a mean frequency)

##summarizing with means per specified groups
>tidy_data<-selected_data %>% 
        group_by(subject, activity, activity_id) %>%
        summarize_each(funs(mean))
here I am calculating the average of each variable for each activity and each subject using the dplyr package

## rename the data with readable columnames
>names_readable<-c("subject","activity","activity_id","time_body_accelerometer_mean_x_avg","time_body_accelerometer_mean_y_avg","time_body_accelerometer_mean_z_avg","time_body_accelerometer_std_x_avg","time_body_accelerometer_std_y_avg","time_body_accelerometer_std_z_avg","time_gravity_accelerometer_mean_x_avg","time_gravity_accelerometer_mean_y_avg","time_gravity_accelerometer_mean_z_avg","time_gravity_accelerometer_std_x_avg","time_gravity_accelerometer_std_y_avg","time_gravity_accelerometer_std_z_avg","time_body_accelerometer_jerk_mean_x_avg","time_body_accelerometer_jerk_mean_y_avg","time_body_accelerometer_jerk_mean_z_avg","time_body_accelerometer_jerk_std_x_avg","time_body_accelerometer_jerk_std_y_avg","time_body_accelerometer_jerk_std_z_avg","time_body_gyroscope_mean_x_avg","time_body_gyroscope_mean_y_avg","time_body_gyroscope_mean_z_avg","time_body_gyroscope_std_x_avg","time_body_gyroscope_std_y_avg","time_body_gyroscope_std_z_avg","time_body_gyroscope_jerk_mean_x_avg","time_body_gyroscope_jerk_mean_y_avg","time_body_gyroscope_jerk_mean_z_avg","time_body_gyroscope_jerk_std_x_avg","time_body_gyroscope_jerk_std_y_avg","time_body_gyroscope_jerk_std_z_avg","time_body_accelerometer_magnitude_mean_avg","time_body_accelerometer_magnitude_std_avg","time_gravity_accelerometer_magnitude_mean_avg","time_gravity_accelerometer_magnitude_std_avg","time_body_accelerometer_jerk_magnitude_mean_avg","time_body_accelerometer_jerk_magnitude_std_avg","time_body_gyroscope_magnitude_mean_avg","time_body_gyroscope_magnitude_std_avg","time_body_gyroscope_jerk_magnitude_mean_avg","time_body_gyroscope_jerk_magnitude_std_avg","frequency_body_accelerometer_mean_x_avg","frequency_body_accelerometer_mean_y_avg","frequency_body_accelerometer_mean_z_avg","frequency_body_accelerometer_std_x_avg","frequency_body_accelerometer_std_y_avg","frequency_body_accelerometer_std_z_avg","frequency_body_accelerometer_meanfrequency_x_avg","frequency_body_accelerometer_meanfrequency_y_avg","frequency_body_accelerometer_meanfrequency_z_avg","frequency_body_accelerometer_jerk_mean_x_avg","frequency_body_accelerometer_jerk_mean_y_avg","frequency_body_accelerometer_jerk_mean_z_avg","frequency_body_accelerometer_jerk_std_x_avg","frequency_body_accelerometer_jerk_std_y_avg","frequency_body_accelerometer_jerk_std_z_avg","frequency_body_accelerometer_jerk_meanfrequency_x_avg","frequency_body_accelerometer_jerk_meanfrequency_y_avg","frequency_body_accelerometer_jerk_meanfrequency_z_avg","frequency_body_gyroscope_mean_x_avg","frequency_body_gyroscope_mean_y_avg","frequency_body_gyroscope_mean_z_avg","frequency_body_gyroscope_std_x_avg","frequency_body_gyroscope_std_y_avg","frequency_body_gyroscope_std_z_avg","frequency_body_gyroscope_meanfrequency_x_avg","frequency_body_gyroscope_meanfrequency_y_avg","frequency_body_gyroscope_meanfrequency_z_avg","frequency_body_accelerometer_magnitude_mean_avg","frequency_body_accelerometer_magnitude_std_avg","frequency_body_accelerometer_magnitude_meanfrequency_avg","frequency_bodybody_accelerometer_jerk_magnitude_mean_avg","frequency_bodybody_accelerometer_jerk_magnitude_std_avg","frequency_bodybody_accelerometer_jerk_magnitude_meanfrequency_avg","frequency_bodybody_gyroscope_magnitude_mean_avg","frequency_bodybody_gyroscope_magnitude_std_avg","frequency_bodybody_gyroscope_magnitude_meanfrequency_avg","frequency_bodybody_gyroscope_jerk_magnitude_mean_avg","frequency_bodybody_gyroscope_jerk_magnitude_std_avg","frequency_bodybody_gyroscope_jerk_magnitude_meanfrequency_avg")
here I am creating a character vector containing descriptive variable names 
>names(tidy_data)<-names_readable
and I am assigning it to the data

###write.table(tidy_data,"tidy_data.txt",row.names=F)
here I am writing the data set to a text file
###print(tidy_data)
and finally I am producing an output to the console