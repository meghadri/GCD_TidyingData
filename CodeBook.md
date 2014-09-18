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
Tidy Name                                   |	Raw Name
--------------------------------------------|-------------------------
mean.BodyAccel.Xaxis.OverTime	            |	tBodyAcc-mean()-X
mean.BodyAccel.Yaxis.OverTime	            |	tBodyAcc-mean()-Y
mean.BodyAccel.Zaxis.OverTime           	|	tBodyAcc-mean()-Z
stddev.BodyAccel.XAxis.OverTime	            |	tBodyAcc-std()-X
stddev.BodyAccel.YAxis.OverTime	            |	tBodyAcc-std()-Y
stddev.BodyAccel.ZAxis.OverTime	            |	tBodyAcc-std()-Z
mean.GravAccel.XAxis.OverTime           	|	tGravityAcc-mean()-X
mean.GravAccel.YAxis.OverTime           	|	tGravityAcc-mean()-Y
mean.GravAccel.ZAxis.OverTime           	|	tGravityAcc-mean()-Z
stddev.GravAccel.XAxis.OverTime         	|	tGravityAcc-std()-X
stddev.GravAccel.YAxis.OverTime	            |	tGravityAcc-std()-Y
stddev.GravAccel.ZAxis.OverTime	            |	tGravityAcc-std()-Z
mean.BodyAccelJerk.XAxis.OverTime        	|	tBodyAccJerk-mean()-X
mean.BodyAccelJerk.YAxis.OverTime       	|	tBodyAccJerk-mean()-Y
mean.BodyAccelJerk.ZAxis.OverTime       	|	tBodyAccJerk-mean()-Z
stddev.BodyAccelJerk.XAxis.OverTime	        |	tBodyAccJerk-std()-X
stddev.BodyAccelJerk.YAxis.OverTime	        |	tBodyAccJerk-std()-Y
stddev.BodyAccelJerk.YAxis.OverTime	        |	tBodyAccJerk-std()-Z
mean.BodyGyro.XAxis.OverTime            	|	tBodyGyro-mean()-X
mean.BodyGyro.YAxis.OverTime              	|	tBodyGyro-mean()-Y
mean.BodyGyro.ZAxis.OverTime            	|	tBodyGyro-mean()-Z
stddev.BodyGyro.XAxis.OverTime          	|	tBodyGyro-std()-X
stddev.BodyGyro.YAxis.OverTime          	|	tBodyGyro-std()-Y
stddev.BodyGyro.ZAxis.OverTime          	|	tBodyGyro-std()-Z
mean.BodyGyroJerk.XAxis.OverTime        	|	tBodyGyroJerk-mean()-X
mean.BodyGyroJerk.YAxis.OverTime        	|	tBodyGyroJerk-mean()-Y
mean.BodyGyroJerk.ZAxis.OverTime        	|	tBodyGyroJerk-mean()-Z
stddev.BodyGyroJerk.XAxis.OverTime      	|	tBodyGyroJerk-std()-X
stddev.BodyGyroJerk.YAxis.OverTime      	|	tBodyGyroJerk-std()-Y
stddev.BodyGyroJerk.ZAxis.OverTime	        |	tBodyGyroJerk-std()-Z
mean.BodyAccel.Magnitude.OverTime	        |	tBodyAccMag-mean()
stddev.BodyAccel.Magnitude.OverTime	        |	tBodyAccMag-std()
mean.GravAccel.Magnitude.OverTime   	    |	tGravityAccMag-mean()
stddev.GravAcces.Magnitude.OverTime     	|	tGravityAccMag-std()
mean.BodyAccelJerk.Magnitude.OverTime    	|	tBodyAccJerkMag-mean()
stddev.BodyAccelJerk.Magnitude.OverTime	    |	tBodyAccJerkMag-std()
mean.BodyGyro.Magnitude.OverTime        	|	tBodyGyroMag-mean()
stddev.BodyGyro.Magnitude.OverTime      	|	tBodyGyroMag-std()
mean.BodyGyroJerk.Magnitude.OverTime	    |	tBodyGyroJerkMag-mean()
stddev.BodyGyroJerk.Magnitude.OverTime	    |	tBodyGyroJerkMag-std()
mean.BodyAccel.Xaxis.OverFreq	            |	fBodyAcc-mean()-X
mean.BodyAccel.Yaxis.OverFreq	            |	fBodyAcc-mean()-Y
mean.BodyAccel.Zaxis.OverFreq	            |	fBodyAcc-mean()-Z
stddev.BodyAccel.Xaxis.OverFreq	            |	fBodyAcc-std()-X
stddev.BodyAccel.Yaxis.OverFreq	            |	fBodyAcc-std()-Y
stddev.BodyAccel.Zaxis.OverFreq	            |	fBodyAcc-std()-Z
meanFreq.BodyAccel.Xaxis.OverFreq	        |	fBodyAcc-meanFreq()-X
meanFreq.BodyAccel.Yaxis.OverFreq	        |	fBodyAcc-meanFreq()-Y
meanFreq.BodyAccel.Zaxis.OverFreq	        |	fBodyAcc-meanFreq()-Z
mean.BodyAccelJerk.Xaxis.OverFreq	        |	fBodyAccJerk-mean()-X
mean.BodyAccelJerk.Yaxis.OverFreq	        |	fBodyAccJerk-mean()-Y
mean.BodyAccelJerk.Zaxis.OverFreq	        |	fBodyAccJerk-mean()-Z
stddev.BodyAccelJerk.Xaxis.OverFreq	        |	fBodyAccJerk-std()-X
stddev.BodyAccelJerk.Yaxis.OverFreq	        |	fBodyAccJerk-std()-Y
stddev.BodyAccelJerk.Zaxis.OverFreq	        |	fBodyAccJerk-std()-Z
meanFreq.BodyAccelJerk.Xaxis.OverFreq	    |	fBodyAccJerk-meanFreq()-X
meanFreq.BodyAccelJerk.Yaxis.OverFreq	    |	fBodyAccJerk-meanFreq()-Y
meanFreq.BodyAccelJerk.Zaxis.OverFreq   	|	fBodyAccJerk-meanFreq()-Z
mean.BodyGyro.Xaxis.OverFreq	            |	fBodyGyro-mean()-X
mean.BodyGyro.Yaxis.OverFreq	            |	fBodyGyro-mean()-Y
mean.BodyGyro.Zaxis.OverFreq	            |	fBodyGyro-mean()-Z
stddev.BodyGyro.Xaxis.OverFreq	            |	fBodyGyro-std()-X
stddev.BodyGyro.Yaxis.OverFreq	            |	fBodyGyro-std()-Y
stddev.BodyGyro.Zaxis.OverFreq	            |	fBodyGyro-std()-Z
meanFreq.BodyGyro.Xaxis.OverFreq	        |	fBodyGyro-meanFreq()-X
meanFreq.BodyGyro.Yaxis.OverFreq            |	fBodyGyro-meanFreq()-Y
meanFreq.BodyGyro.Zaxis.OverFreq	        |	fBodyGyro-meanFreq()-Z
mean.BodyAccel.Magnitude.OverFreq	        |	fBodyAccMag-mean()
stddev.BodyAccel.Magnitude.OverFreq	        |	fBodyAccMag-std()
meanFreq.BodyAccel.Magnitude.OverFreq	    |	fBodyAccMag-meanFreq()
mean.BodyAccelJerk.Magnitude.OverFreq	    |	fBodyBodyAccJerkMag-mean()
stddev.BodyAccelJerk.Magnitude.OverFreq	    |	fBodyBodyAccJerkMag-std()
meanFreq.BodyAccelJerk.Magnitude.OverFreq	|	fBodyBodyAccJerkMag-meanFreq()
mean.BodyGyro.Magnitude.OverFreq	        |	fBodyBodyGyroMag-mean()
stddev.BodyGyro.Magnitude.OverFreq      	|	fBodyBodyGyroMag-std()
meanFreq.BodyGyro.Magnitude.OverFreq	    |	fBodyBodyGyroMag-meanFreq()
mean.BodyGyroJerk.Magnitude.OverFreq	    |	fBodyBodyGyroJerkMag-mean()
stddev.BodyGyroJerk.Magnitude.OverFreq  	|	fBodyBodyGyroJerkMag-std()
meanFreq.BodyGyroJerk.Magnitude.OverFreq	|	fBodyBodyGyroJerkMag-meanFreq()