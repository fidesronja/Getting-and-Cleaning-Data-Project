# codebook
## Information about the data
This tidy dataset provides a summary of a dataset received under http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
I merges the training and the test sets and created one data set and extracted only the measurements on the mean and standard deviation for each measurement. 
Then I extracted only the measurements on the mean and standard deviation for each measurement and calculated the average of each variable for each activity and each subject.

Here is a short excerpt of the information regarding the experiment, obtained from the README, provided by the authors:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 
2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using
a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore
a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and
frequency domain.

For more information about the raw dataset can be found under: www.smartlab.ws 

##Informations about the variables

The features (of course excluding the first three) were normalized and bounded within [-1,1], so they are all of the same unit.
###Variables:

1. subject:
 Each number identifies the subject who performed the activity. (1-30)

2.activity
performed activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

3.activity_id
links every activity to an id (1-WALKING 2-WALKING_UPSTAIRS 3-WALKING_DOWNSTAIRS 4-SITTING 5-STANDING 6-LAYING)

4.time_body_accelerometer_mean_x_avg

5.time_body_accelerometer_mean_y_avg

6.time_body_accelerometer_mean_z_avg

7.time_body_accelerometer_std_x_avg

8.time_body_accelerometer_std_y_avg

9.time_body_accelerometer_std_z_avg

10.time_gravity_accelerometer_mean_x_avg

11.time_gravity_accelerometer_mean_y_avg

12.time_gravity_accelerometer_mean_z_avg

13.time_gravity_accelerometer_std_x_avg

14.time_gravity_accelerometer_std_y_avg

15.time_gravity_accelerometer_std_z_avg

16.time_body_accelerometer_jerk_mean_x_avg

17.time_body_accelerometer_jerk_mean_y_avg

18.time_body_accelerometer_jerk_mean_z_avg

19.time_body_accelerometer_jerk_std_x_avg

20.time_body_accelerometer_jerk_std_y_avg

21.time_body_accelerometer_jerk_std_z_avg

22.time_body_gyroscope_mean_x_avg

23.time_body_gyroscope_mean_y_avg

24.time_body_gyroscope_mean_z_avg

25.time_body_gyroscope_std_x_avg

26.time_body_gyroscope_std_y_avg

27.time_body_gyroscope_std_z_avg 

28.time_body_gyroscope_jerk_mean_x_avg

29.time_body_gyroscope_jerk_mean_y_avg

30.time_body_gyroscope_jerk_mean_z_avg

31.time_body_gyroscope_jerk_std_x_avg 

32.time_body_gyroscope_jerk_std_y_avg

33.time_body_gyroscope_jerk_std_z_avg

34.time_body_accelerometer_magnitude_mean_avg 

35.time_body_accelerometer_magnitude_std_avg

36.time_gravity_accelerometer_magnitude_mean_avg 

37.time_gravity_accelerometer_magnitude_std_avg

38.time_body_accelerometer_jerk_magnitude_mean_avg

39.time_body_accelerometer_jerk_magnitude_std_avg

40.time_body_gyroscope_magnitude_mean_avg 

41.time_body_gyroscope_magnitude_std_avg

42.time_body_gyroscope_jerk_magnitude_mean_avg

43.time_body_gyroscope_jerk_magnitude_std_avg

44.frequency_body_accelerometer_mean_x_avg

45.frequency_body_accelerometer_mean_y_avg

46.frequency_body_accelerometer_mean_z_avg

47.frequency_body_accelerometer_std_x_avg

48.frequency_body_accelerometer_std_y_avg

49.frequency_body_accelerometer_std_z_avg

50.frequency_body_accelerometer_meanfrequency_x_avg

51.frequency_body_accelerometer_meanfrequency_y_avg

52.frequency_body_accelerometer_meanfrequency_z_avg

53.frequency_body_accelerometer_jerk_mean_x_avg

54.frequency_body_accelerometer_jerk_mean_y_avg

55.frequency_body_accelerometer_jerk_mean_z_avg

56.frequency_body_accelerometer_jerk_std_x_avg

57.frequency_body_accelerometer_jerk_std_y_avg

58.frequency_body_accelerometer_jerk_std_z_avg

59.frequency_body_accelerometer_jerk_meanfrequency_x_avg

60.frequency_body_accelerometer_jerk_meanfrequency_y_avg

61.frequency_body_accelerometer_jerk_meanfrequency_z_avg

62.frequency_body_gyroscope_mean_x_avg

63.frequency_body_gyroscope_mean_y_avg

64.frequency_body_gyroscope_mean_z_avg

65.frequency_body_gyroscope_std_x_avg

66.frequency_body_gyroscope_std_y_avg

67.frequency_body_gyroscope_std_z_avg

68.frequency_body_gyroscope_meanfrequency_x_avg

69.frequency_body_gyroscope_meanfrequency_y_avg

70.frequency_body_gyroscope_meanfrequency_z_avg

71.frequency_body_accelerometer_magnitude_mean_avg

72.frequency_body_accelerometer_magnitude_std_avg

73.frequency_body_accelerometer_magnitude_meanfrequency_avg

74.frequency_bodybody_accelerometer_jerk_magnitude_mean_avg

75.frequency_bodybody_accelerometer_jerk_magnitude_std_avg

76.frequency_bodybody_accelerometer_jerk_magnitude_meanfrequency_avg

77.frequency_bodybody_gyroscope_magnitude_mean_avg

78.frequency_bodybody_gyroscope_magnitude_std_avg

79.frequency_bodybody_gyroscope_magnitude_meanfrequency_avg

80.frequency_bodybody_gyroscope_jerk_magnitude_mean_avg

81.frequency_bodybody_gyroscope_jerk_magnitude_std_avg

82.frequency_bodybody_gyroscope_jerk_magnitude_meanfrequency_avg

###Variable Information:
The Information about the variables are taken from the README provided by the authors:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a
 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into
 body and gravity acceleration signals (Time Body Accelerometer - XYZ and Time Gravity Accelerometer - XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time Body Accelerometer Jerk - XYZ and Time Body Gyroscope Jerk - XYZ).
 Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Time Body Accelerometer Magnitude , Time Gravity Accelerometer Magnitude, 
 Time Body Accelerometer Jerk Magnitude,Time Body Gyroscope Magnitude, Time Body Gyroscope Jerk Magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing Frequency Body Accelerometer -XYZ, Frequency Body Accelerometer Jerk-XYZ, 
Frequency Body Gyroscope - XYZ, Frequency Body Accelerometer Jerk Magnitude, Frequency Body Gyroscope Magnitude , Frequency Body Gyroscope Jerk Magnitude. 
(Frequency indicates frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

