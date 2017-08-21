==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================
Means and standard deviation for the following variables:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.md'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'wearables.csv': This files includes the following variables

 [1] "subject" (a participant identifier)
 [2] "condition" (whether participant was assigned to the training or the test group)
 [3] "activity_label" (a factor variable with labels 1 = WALKING, 2 = WALKING_UPSTAIRS, 3 = WALKING_DOWNSTAIRS, 4 = SITTING, 5 = STANDING, 6 = LAYING)
 [4] "x_mean" (mean of feature set per participant)
 [5] "x_sd" (sd of feature set per participant)
 [6] "body_acc_x_mean" [7] "body_acc_x_sd" The mean and standard deviation of the body acceleration signal obtained by subtracting the gravity from the total acceleration. The same description applies for the 'body_acc_y' and 'body_acc_z' for the Y and Z axis.)
 [8] "body_acc_y_mean"
 [9] "body_acc_y_sd"   
[10] "body_acc_z_mean"
[11] "body_acc_z_sd"
[12] "body_gyro_x_mean" [13] "body_gyro_x_sd" (The mean and standard deviation of the angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. The same description applies for the Y and Z axis.)
[14] "body_gyro_y_mean"
[15] "body_gyro_y_sd"  
[16] "body_gyro_z_mean"
[17] "body_gyro_z_sd"
[18] "total_acc_x_mean" [19] "total_acc_x_sd" (The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows the mean or standard deviation of a 128 element vector. The same description applies for the Y and Z axis.)
[20] "total_acc_y_mean"
[21] "total_acc_y_sd"  
[22] "total_acc_z_mean" "total_acc_z_sd"  

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
