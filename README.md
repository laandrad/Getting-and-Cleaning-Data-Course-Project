# Getting and Cleaning Smartphones Dataset

## Running run_analysis.R
1. Download "run_analysis.R", "extract_file.R", and "cachedownload.R"). 
2. Point your working directory to this folder. Open "run_analysis.R" and run the script. This file contains a link to the Samsung data, when ran, it will download the data from the URL and put it in a temporal file (note: this might take some time depending on the connection). 
3. The script will automatically extract the mean and standard deviation for each feature and create a summary table for each average feature by subject by activity.

## Variables Measured
For each record it is provided the means and standard deviations for the following variables:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Data Files
The dataset includes the following files:
- 'wearables.txt': This files includes the following variables

 [1] "subject" (a participant identifier) <br />
 [2] "condition" (whether participant was assigned to the training or the test group) <br />
 [3] "activity_label" (a factor variable with labels 1 = WALKING, 2 = WALKING_UPSTAIRS, 3 = WALKING_DOWNSTAIRS, 4 = SITTING, 5 = STANDING, 6 = LAYING) <br />
 [4] "x_mean" (mean of feature set per participant) <br />
 [5] "x_sd" (sd of feature set per participant)<br />
 [6] "body_acc_x_mean" [7] "body_acc_x_sd" The mean and standard deviation of the body acceleration signal obtained by subtracting the gravity from the total acceleration. The same description applies for the 'body_acc_y' and 'body_acc_z' for the Y and Z axis.) <br />
 [8] "body_acc_y_mean" <br />
 [9] "body_acc_y_sd" <br />  
[10] "body_acc_z_mean" <br />
[11] "body_acc_z_sd" <br />
[12] "body_gyro_x_mean" [13] "body_gyro_x_sd" (The mean and standard deviation of the angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. The same description applies for the Y and Z axis.) <br />
[14] "body_gyro_y_mean" <br />
[15] "body_gyro_y_sd"  <br />
[16] "body_gyro_z_mean" <br />
[17] "body_gyro_z_sd" <br />
[18] "total_acc_x_mean" [19] "total_acc_x_sd" (The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows the mean or standard deviation of a 128 element vector. The same description applies for the Y and Z axis.) <br />
[20] "total_acc_y_mean" <br />
[21] "total_acc_y_sd"  <br />
[22] "total_acc_z_mean" "total_acc_z_sd"  <br />

- 'wearables_summary.txt': This files includes the average of each variable for each activity and each subject.
