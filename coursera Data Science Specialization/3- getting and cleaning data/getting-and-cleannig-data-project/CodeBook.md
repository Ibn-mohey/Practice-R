## The codebook for Getting and Cleaning Data Project
this codebook contains the final Tidydata that our code results to

## Initial data for research
the Initial can be found here
[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
the code it self contain the Downloadable link for it but the site contains more information about it

## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING
* wearing a smartphone (Samsung Galaxy S II) on the waist.

Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  
The experiments have been video-recorded to label the data manually.  
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).    
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity.   
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.   
From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  
Check the README.txt file for further details about this dataset.    

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Web Link](https://www.youtube.com/watch?v=XOEN9W05_4A).  
An updated version of this dataset can be found at [Web Link](http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions). It includes labels of postural transitions between activities and also the full raw inertial signals instead of the ones pre-processed into windows.

### Attribute Information
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

#The final Tidydata set provided contains the following

### more information
the Tidydata set is the average of each variable for each activity and each subject.

### Identifiers

- subject - The ID of the test subject
- activity - The type of activity performed when the corresponding measurements were taken
### Measurements

- Time Body Accelerometer Mean X
- Time Body Accelerometer Mean Y
- Time Body Accelerometer Mean Z
- Time Body Accelerometer std X
- Time Body Accelerometer std Y
- Time Body Accelerometer std Z
- Time Gravity Accelerometer Mean X
- Time Gravity Accelerometer Mean Y
- Time Gravity Accelerometer Mean Z
- Time Gravity Accelerometer std X
- Time Gravity Accelerometer std Y
- Time Gravity Accelerometer std Z
- Time Body Accelerometer Jerk Mean X
- Time Body Accelerometer Jerk Mean Y
- Time Body Accelerometer Jerk Mean Z
- Time Body Accelerometer Jerk std X
- Time Body Accelerometer Jerk std Y
- Time Body Accelerometer Jerk std Z
- Time Body Gyroscope Mean X
- Time Body Gyroscope Mean Y
- Time Body Gyroscope Mean Z
- Time Body Gyroscope std X
- Time Body Gyroscope std Y
- Time Body Gyroscope std Z
- Time Body Gyroscope Jerk Mean X
- Time Body Gyroscope Jerk Mean Y
- Time Body Gyroscope Jerk Mean Z
- Time Body Gyroscope Jerk std X
- Time Body Gyroscope Jerk std Y
- Time Body Gyroscope Jerk std Z
- Time Body Accelerometer Mag Mean
- Time Body Accelerometer Mag std
- Time Gravity Accelerometer Mag Mean
- Time Gravity Accelerometer Mag std
- Time Body Accelerometer Jerk Mag Mean
- Time Body Accelerometer Jerk Mag std
- Time Body Gyroscope Mag Mean
- Time Body Gyroscope Mag std
- Time Body Gyroscope Jerk Mag Mean
- Time Body Gyroscope Jerk Mag std
- Frequency Body Accelerometer Mean X
- Frequency Body Accelerometer Mean Y
- Frequency Body Accelerometer Mean Z
- Frequency Body Accelerometer std X
- Frequency Body Accelerometer std Y
- Frequency Body Accelerometer std Z
- Frequency Body Accelerometer Mean X
- Frequency Body Accelerometer Mean Y
- Frequency Body Accelerometer Mean Z
- Frequency Body Accelerometer Jerk Mean X
- Frequency Body Accelerometer Jerk Mean Y
- Frequency Body Accelerometer Jerk Mean Z
- Frequency Body Accelerometer Jerk std X
- Frequency Body Accelerometer Jerk std Y
- Frequency Body Accelerometer Jerk std Z
- Frequency Body Accelerometer Jerk Mean X
- Frequency Body Accelerometer Jerk Mean Y
- Frequency Body Accelerometer Jerk Mean Z
- Frequency Body Gyroscope Mean X
- Frequency Body Gyroscope Mean Y
- Frequency Body Gyroscope Mean Z
- Frequency Body Gyroscope std X
- Frequency Body Gyroscope std Y
- Frequency Body Gyroscope std Z
- Frequency Body Gyroscope Mean X
- Frequency Body Gyroscope Mean Y
- Frequency Body Gyroscope Mean Z
- Frequency Body Accelerometer Mag Mean
- Frequency Body Accelerometer Mag std
- Frequency Body Accelerometer Mag Mean
- Frequency Body Accelerometer Jerk Mag Mean
- Frequency Body Accelerometer Jerk Mag std
- Frequency Body Accelerometer Jerk Mag Mean
- Frequency Body Gyroscope Mag Mean
- Frequency Body Gyroscope Mag std
- Frequency Body Gyroscope Mag Mean
- Frequency Body Gyroscope Jerk Mag Mean
- Frequency Body Gyroscope Jerk Mag std
- Frequency Body Gyroscope Jerk Mag Mean
- angle Time body Accelerometer Mean, gravity
- angle Time body Accelerometer Jerk Mean gravity Mean
- angle Time body Gyroscope Mean gravity Mean
- angle Time body Gyroscope Jerk Mean gravity Mean
- angle X gravity Mean
- angle Y gravity Mean
- angle Z gravity Mean
