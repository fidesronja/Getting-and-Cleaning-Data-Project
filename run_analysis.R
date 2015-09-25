## loading required packages
library(dplyr)
##reading in data
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
##clipping 
subject_y_test<-cbind(subject_test,y_test)
subject_y_x_test<-cbind(subject_y_test,x_test)
subject_y_train<-cbind(subject_train,y_train)
subject_y_x_train<-cbind(subject_y_train,x_train)
subject_y_x<-rbind(subject_y_x_test,subject_y_x_train)
str(subject_y_x)
names(subject_y_x)
## labeling variables
subj_names<-c("subject","activity_id")
feature_names<-make.names(features$V2)
var_names<-c(subj_names,feature_names)
names(subject_y_x)<-var_names
names(activity_labels)<-c("id","activity")
##merging with activity names
full_data<-merge(subject_y_x, activity_labels, by.x="activity_id", by.y="id", suffixes = c(".l",".r"))
##selecting columns
selected_data <- full_data[, grep("mean|std|subject|activity", names(full_data))]
##summarizing with means per specified groups
tidy_data<-selected_data %>% 
        group_by(subject, activity, activity_id) %>%
        summarize_each(funs(mean)) %>%
        print
## rename the data with readable columnames
names_readable<-c("subject","activity","activity_id","time_body_accelerometer_mean_x_avg","time_body_accelerometer_mean_y_avg","time_body_accelerometer_mean_z_avg","time_body_accelerometer_std_x_avg","time_body_accelerometer_std_y_avg","time_body_accelerometer_std_z_avg","time_gravity_accelerometer_mean_x_avg","time_gravity_accelerometer_mean_y_avg","time_gravity_accelerometer_mean_z_avg","time_gravity_accelerometer_std_x_avg","time_gravity_accelerometer_std_y_avg","time_gravity_accelerometer_std_z_avg","time_body_accelerometer_jerk_mean_x_avg","time_body_accelerometer_jerk_mean_y_avg","time_body_accelerometer_jerk_mean_z_avg","time_body_accelerometer_jerk_std_x_avg","time_body_accelerometer_jerk_std_y_avg","time_body_accelerometer_jerk_std_z_avg","time_body_gyroscope_mean_x_avg","time_body_gyroscope_mean_y_avg","time_body_gyroscope_mean_z_avg","time_body_gyroscope_std_x_avg","time_body_gyroscope_std_y_avg","time_body_gyroscope_std_z_avg","time_body_gyroscope_jerk_mean_x_avg","time_body_gyroscope_jerk_mean_y_avg","time_body_gyroscope_jerk_mean_z_avg","time_body_gyroscope_jerk_std_x_avg","time_body_gyroscope_jerk_std_y_avg","time_body_gyroscope_jerk_std_z_avg","time_body_accelerometer_magnitude_mean_avg","time_body_accelerometer_magnitude_std_avg","time_gravity_accelerometer_magnitude_mean_avg","time_gravity_accelerometer_magnitude_std_avg","time_body_accelerometer_jerk_magnitude_mean_avg","time_body_accelerometer_jerk_magnitude_std_avg","time_body_gyroscope_magnitude_mean_avg","time_body_gyroscope_magnitude_std_avg","time_body_gyroscope_jerk_magnitude_mean_avg","time_body_gyroscope_jerk_magnitude_std_avg","frequency_body_accelerometer_mean_x_avg","frequency_body_accelerometer_mean_y_avg","frequency_body_accelerometer_mean_z_avg","frequency_body_accelerometer_std_x_avg","frequency_body_accelerometer_std_y_avg","frequency_body_accelerometer_std_z_avg","frequency_body_accelerometer_meanfrequency_x_avg","frequency_body_accelerometer_meanfrequency_y_avg","frequency_body_accelerometer_meanfrequency_z_avg","frequency_body_accelerometer_jerk_mean_x_avg","frequency_body_accelerometer_jerk_mean_y_avg","frequency_body_accelerometer_jerk_mean_z_avg","frequency_body_accelerometer_jerk_std_x_avg","frequency_body_accelerometer_jerk_std_y_avg","frequency_body_accelerometer_jerk_std_z_avg","frequency_body_accelerometer_jerk_meanfrequency_x_avg","frequency_body_accelerometer_jerk_meanfrequency_y_avg","frequency_body_accelerometer_jerk_meanfrequency_z_avg","frequency_body_gyroscope_mean_x_avg","frequency_body_gyroscope_mean_y_avg","frequency_body_gyroscope_mean_z_avg","frequency_body_gyroscope_std_x_avg","frequency_body_gyroscope_std_y_avg","frequency_body_gyroscope_std_z_avg","frequency_body_gyroscope_meanfrequency_x_avg","frequency_body_gyroscope_meanfrequency_y_avg","frequency_body_gyroscope_meanfrequency_z_avg","frequency_body_accelerometer_magnitude_mean_avg","frequency_body_accelerometer_magnitude_std_avg","frequency_body_accelerometer_magnitude_meanfrequency_avg","frequency_bodybody_accelerometer_jerk_magnitude_mean_avg","frequency_bodybody_accelerometer_jerk_magnitude_std_avg","frequency_bodybody_accelerometer_jerk_magnitude_meanfrequency_avg","frequency_bodybody_gyroscope_magnitude_mean_avg","frequency_bodybody_gyroscope_magnitude_std_avg","frequency_bodybody_gyroscope_magnitude_meanfrequency_avg","frequency_bodybody_gyroscope_jerk_magnitude_mean_avg","frequency_bodybody_gyroscope_jerk_magnitude_std_avg","frequency_bodybody_gyroscope_jerk_magnitude_meanfrequency_avg")
names(tidy_data)<-names_readable
write.table(tidy_data,"tidy_data.txt",row.names=F)

