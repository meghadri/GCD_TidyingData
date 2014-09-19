---
author: MGH
date: "17 September 2014"
institution: "Coursera / Johns Hopkins University"
instructors: "Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD"
output: html_document
title: "Getting & Cleaning Data Course Project: Codebook"
---

Creating the merged tidy data set.

Two of the provided files, *X_train.txt*, and *X_test.txt* are used as the source of data for this analysis. The features of interested are extracted by the presence of 'mean' or 'std' in their names. The names of these features have been renamed to a more human readable variant. 

The renaming scheme combines two naming conventions commonly used in R - the lowerCamelCase variant as proposed in Bioconductor and the period separated one which is widely used in R. The new names for the columns in the tidied data set following the following convention

> {statistic}.{experiment variable}.{Axis of measure, or **Magnitude**}.{**OverTime** or **OverFreq**}, corresponding to whether the feature was in the time or frequency domain
 
Thus the raw feature name, **tBodyAcc-mean()-X** maps to **mean.BodyAccel.Xaxis.OverTime**
 
Body measurements are indicated by 'Body'. Gravity by 'Grav'. 

### Mapping of new tidied feature names to 'raw' names
Tidy Name                                   |	Raw Name                        | Meas. Domain  |
--------------------------------------------|-----------------------------------|---------------|
mean.BodyAccel.Xaxis.OverTime	            |	tBodyAcc-mean()-X               |   Time        |
mean.BodyAccel.Yaxis.OverTime	            |	tBodyAcc-mean()-Y               |   Time        |
mean.BodyAccel.Zaxis.OverTime           	|	tBodyAcc-mean()-Z               |   Time        |
stddev.BodyAccel.XAxis.OverTime	            |	tBodyAcc-std()-X                |   Time        |
stddev.BodyAccel.YAxis.OverTime	            |	tBodyAcc-std()-Y                |   Time        |
stddev.BodyAccel.ZAxis.OverTime	            |	tBodyAcc-std()-Z                |   Time        |
mean.GravAccel.XAxis.OverTime           	|	tGravityAcc-mean()-X            |   Time        |
mean.GravAccel.YAxis.OverTime           	|	tGravityAcc-mean()-Y            |   Time        |
mean.GravAccel.ZAxis.OverTime           	|	tGravityAcc-mean()-Z            |   Time        |
stddev.GravAccel.XAxis.OverTime         	|	tGravityAcc-std()-X             |   Time        |
stddev.GravAccel.YAxis.OverTime	            |	tGravityAcc-std()-Y             |   Time        |
stddev.GravAccel.ZAxis.OverTime	            |	tGravityAcc-std()-Z             |   Time        |
mean.BodyAccelJerk.XAxis.OverTime        	|	tBodyAccJerk-mean()-X           |   Time        |
mean.BodyAccelJerk.YAxis.OverTime       	|	tBodyAccJerk-mean()-Y           |   Time        |
mean.BodyAccelJerk.ZAxis.OverTime       	|	tBodyAccJerk-mean()-Z           |   Time        |
stddev.BodyAccelJerk.XAxis.OverTime	        |	tBodyAccJerk-std()-X            |   Time        |
stddev.BodyAccelJerk.YAxis.OverTime	        |	tBodyAccJerk-std()-Y            |   Time        |
stddev.BodyAccelJerk.YAxis.OverTime	        |	tBodyAccJerk-std()-Z            |   Time        |
mean.BodyGyro.XAxis.OverTime            	|	tBodyGyro-mean()-X              |   Time        |
mean.BodyGyro.YAxis.OverTime              	|	tBodyGyro-mean()-Y              |   Time        |
mean.BodyGyro.ZAxis.OverTime            	|	tBodyGyro-mean()-Z              |   Time        |
stddev.BodyGyro.XAxis.OverTime          	|	tBodyGyro-std()-X               |   Time        |
stddev.BodyGyro.YAxis.OverTime          	|	tBodyGyro-std()-Y               |   Time        |
stddev.BodyGyro.ZAxis.OverTime          	|	tBodyGyro-std()-Z               |   Time        |
mean.BodyGyroJerk.XAxis.OverTime        	|	tBodyGyroJerk-mean()-X          |   Time        |
mean.BodyGyroJerk.YAxis.OverTime        	|	tBodyGyroJerk-mean()-Y          |   Time        |
mean.BodyGyroJerk.ZAxis.OverTime        	|	tBodyGyroJerk-mean()-Z          |   Time        |
stddev.BodyGyroJerk.XAxis.OverTime      	|	tBodyGyroJerk-std()-X           |   Time        |
stddev.BodyGyroJerk.YAxis.OverTime      	|	tBodyGyroJerk-std()-Y           |   Time        |
stddev.BodyGyroJerk.ZAxis.OverTime	        |	tBodyGyroJerk-std()-Z           |   Time        |
mean.BodyAccel.Magnitude.OverTime	        |	tBodyAccMag-mean()              |   Time        |
stddev.BodyAccel.Magnitude.OverTime	        |	tBodyAccMag-std()               |   Time        |
mean.GravAccel.Magnitude.OverTime   	    |	tGravityAccMag-mean()           |   Time        |
stddev.GravAcces.Magnitude.OverTime     	|	tGravityAccMag-std()            |   Time        |
mean.BodyAccelJerk.Magnitude.OverTime    	|	tBodyAccJerkMag-mean()          |   Time        |
stddev.BodyAccelJerk.Magnitude.OverTime	    |	tBodyAccJerkMag-std()           |   Time        |
mean.BodyGyro.Magnitude.OverTime        	|	tBodyGyroMag-mean()             |   Time        |
stddev.BodyGyro.Magnitude.OverTime      	|	tBodyGyroMag-std()              |   Time        |
mean.BodyGyroJerk.Magnitude.OverTime	    |	tBodyGyroJerkMag-mean()         |   Time        |
stddev.BodyGyroJerk.Magnitude.OverTime	    |	tBodyGyroJerkMag-std()          |   Time        |
mean.BodyAccel.Xaxis.OverFreq	            |	fBodyAcc-mean()-X               |   Frequency   |
mean.BodyAccel.Yaxis.OverFreq	            |	fBodyAcc-mean()-Y               |   Frequency   |
mean.BodyAccel.Zaxis.OverFreq	            |	fBodyAcc-mean()-Z               |   Frequency   |
stddev.BodyAccel.Xaxis.OverFreq	            |	fBodyAcc-std()-X                |   Frequency   |
stddev.BodyAccel.Yaxis.OverFreq	            |	fBodyAcc-std()-Y                |   Frequency   |
stddev.BodyAccel.Zaxis.OverFreq	            |	fBodyAcc-std()-Z                |   Frequency   |
meanFreq.BodyAccel.Xaxis.OverFreq	        |	fBodyAcc-meanFreq()-X           |   Frequency   |
meanFreq.BodyAccel.Yaxis.OverFreq	        |	fBodyAcc-meanFreq()-Y           |   Frequency   |
meanFreq.BodyAccel.Zaxis.OverFreq	        |	fBodyAcc-meanFreq()-Z           |   Frequency   |
mean.BodyAccelJerk.Xaxis.OverFreq	        |	fBodyAccJerk-mean()-X           |   Frequency   |
mean.BodyAccelJerk.Yaxis.OverFreq	        |	fBodyAccJerk-mean()-Y           |   Frequency   |
mean.BodyAccelJerk.Zaxis.OverFreq	        |	fBodyAccJerk-mean()-Z           |   Frequency   |
stddev.BodyAccelJerk.Xaxis.OverFreq	        |	fBodyAccJerk-std()-X            |   Frequency   |
stddev.BodyAccelJerk.Yaxis.OverFreq	        |	fBodyAccJerk-std()-Y            |   Frequency   |
stddev.BodyAccelJerk.Zaxis.OverFreq	        |	fBodyAccJerk-std()-Z            |   Frequency   |
meanFreq.BodyAccelJerk.Xaxis.OverFreq	    |	fBodyAccJerk-meanFreq()-X       |   Frequency   |
meanFreq.BodyAccelJerk.Yaxis.OverFreq	    |	fBodyAccJerk-meanFreq()-Y       |   Frequency   |
meanFreq.BodyAccelJerk.Zaxis.OverFreq   	|	fBodyAccJerk-meanFreq()-Z       |   Frequency   |
mean.BodyGyro.Xaxis.OverFreq	            |	fBodyGyro-mean()-X              |   Frequency   |
mean.BodyGyro.Yaxis.OverFreq	            |	fBodyGyro-mean()-Y              |   Frequency   |
mean.BodyGyro.Zaxis.OverFreq	            |	fBodyGyro-mean()-Z              |   Frequency   |
stddev.BodyGyro.Xaxis.OverFreq	            |	fBodyGyro-std()-X               |   Frequency   |
stddev.BodyGyro.Yaxis.OverFreq	            |	fBodyGyro-std()-Y               |   Frequency   |
stddev.BodyGyro.Zaxis.OverFreq	            |	fBodyGyro-std()-Z               |   Frequency   |
meanFreq.BodyGyro.Xaxis.OverFreq	        |	fBodyGyro-meanFreq()-X          |   Frequency   |
meanFreq.BodyGyro.Yaxis.OverFreq            |	fBodyGyro-meanFreq()-Y          |   Frequency   |
meanFreq.BodyGyro.Zaxis.OverFreq	        |	fBodyGyro-meanFreq()-Z          |   Frequency   |
mean.BodyAccel.Magnitude.OverFreq	        |	fBodyAccMag-mean()              |   Frequency   |
stddev.BodyAccel.Magnitude.OverFreq	        |	fBodyAccMag-std()               |   Frequency   |
meanFreq.BodyAccel.Magnitude.OverFreq	    |	fBodyAccMag-meanFreq()          |   Frequency   |
mean.BodyAccelJerk.Magnitude.OverFreq	    |	fBodyBodyAccJerkMag-mean()      |   Frequency   |
stddev.BodyAccelJerk.Magnitude.OverFreq	    |	fBodyBodyAccJerkMag-std()       |   Frequency   |
meanFreq.BodyAccelJerk.Magnitude.OverFreq	|	fBodyBodyAccJerkMag-meanFreq()  |   Frequency   |
mean.BodyGyro.Magnitude.OverFreq	        |	fBodyBodyGyroMag-mean()         |   Frequency   |
stddev.BodyGyro.Magnitude.OverFreq      	|	fBodyBodyGyroMag-std()          |   Frequency   |
meanFreq.BodyGyro.Magnitude.OverFreq	    |	fBodyBodyGyroMag-meanFreq()     |   Frequency   |
mean.BodyGyroJerk.Magnitude.OverFreq	    |	fBodyBodyGyroJerkMag-mean()     |   Frequency   |
stddev.BodyGyroJerk.Magnitude.OverFreq  	|	fBodyBodyGyroJerkMag-std()      |   Frequency   |
meanFreq.BodyGyroJerk.Magnitude.OverFreq	|	fBodyBodyGyroJerkMag-meanFreq() |   Frequency   |