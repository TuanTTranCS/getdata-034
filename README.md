# getdata-034
# R code for course project of Getting and Cleaning Data in Coursera - getdata-034
# Hugo Tran

I. Codebook - Column descriptions of "Output_data.csv":
	Column1: Subject - An identifier of the subject who carried out the experiment, totally 30 subjects
	Column2: Activity - The activities that was performed in the experiment, includes (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
	Column3-68: Mean value for each subject and activity, which contains mean and standar deviation of:
		Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
		Triaxial Angular velocity from the gyroscope.
	Feature Selection 
	=================

	The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

	Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

	Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

	These signals were used to estimate variables of the feature vector for each pattern:  
	'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
	
II. How does the code work
	1. Retrieve all data info into data frames: 
		activitiesLabels (activity_labels.txt)
		features (features.txt)
		trainSubjects (subject_train.txt)
		trainLabels (y_train.txt)
		trainSet (X_train.txt)
		testSubjects (subject_test.txt)
		testLabels (y_test.txt)
		testSet (X_test.txt)
		
	2. Merge all the subjects, labels and data records from test and train dataset into one set
		mergedSubjects <- rbind(trainSubjects, testSubjects)
		mergedLabels <- rbind(trainLabels,testLabels)
		mergedSet <- rbind(trainSet, testSet)
	3. From the full feature list, extract feature names that contain "mean()" or "std()", will yield 66 selected records

	4. Subset the merged data set with the selected index in step 3
	
	5. Set the feature names using the selected feature list
	
	6. Map the activity label in mergedLabels with the appropriate names in activitiesLabels
	
	7. Create final dataset by combind the mergedSubjects, Activity Names of mergedLabels together with the extracted labeled data set
	
	8. Summarize Table to get outputTable, using the aggregate funciton and group by Subject, activity columns, using "mean" function
	
	9. Remove non-neccessary column after summary and set correct names
	
	10. Write output table to txt file
	
	
	