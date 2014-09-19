---
author: MGH
date: "17 September 2014"
institution: "Coursera / Johns Hopkins University"
instructors: "Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD"
output: html_document
title: "Getting & Cleaning Data Course Project"
---

***
### Background
This described the approach take to create a tidy dataset from the data files provided in the project assignment 
 For details see: [link]https://class.coursera.org/getdata-007/human_grading/view/courses/972585/assessments/3/submissions
 
The experiment from which the data was generated divided its subjects into two categories - test and train. The recorded
data is according placed in the correspondingly named folders. 

Each of these folders also contain an sub-folder named *Inertial Signals/*. The files in these folders contain raw data
which were sampled at 50 HZ with some noise reduction filters applied. 

The solution to the assignment ignores these files and instead uses the files in the higher level *test/* and *train/* folders. These files are *subject_train.txt*, *X_train.txt*, *y_train.txt*, *subject_test.txt*, *X_test.txt*, *y_test.txt*.


***
### Summary
The features of interest are those that represent the mean, and standard deviation of the raw measurements. These are identified by the presence of 'mean', 'std', and 'meanFreq' in the column names. Measurements have been made over time domain (time series) and the frequency domain of the experiment. 79 such columns have been identified. 

> A file, *colmappings.csv*, has also been provided that contains the mappings from the column names in the provided data set to, what is hopefully, a more human-readable and comprehensible variation.

See codebook [markdown](CodeBook.md), or as [html](CodeBook.html) for details
 

***
### Description of steps in the R script
The sequence of steps followed is slightly different from the list in the statement of the assignment. This was done to deal with memory constraints on my machine. 
Instead of merging the data sets and then extracting the columns that represented the measurements of interest, the columns of interest were first extracted from
the data files and these tables were then merged. 

The following is the flow of the logic in the submitted R script.

* Downloads (and unzips) the data file from the remote location URL to a subfolder *data/* of the working directory
* The measurements of interest are extracted from features.txt. 
* Two data tables, for test and training, are created from the corresponding files (*X_train.txt* & *X_test.txt*), with only the measurements (those indicating mean or std) extracted from the files, and three columns which indicate the subject, activity, and source (test or training) are added to these data tables. 
* The tidied up data frame is writted to [*mergedTidyDataSet.txt*](mergedTidyDataSet.txt), and the data frame with the computed means is writted to [*computedMeansTidyDataSet.txt*](computedMeansTidyDataSet.txt) in the current working directory


***
### Summary
The merged tidy dataset has the subjectid, activity, feature statistic and its values as the columns -  each row contains the corresponding measured or derived feature statistic for each subject by activity. This dataset has 813621 row entries.
The computed means tidy dataset has as columns, the subjectid, activity, feature statistic, and its computed mean. This dataset has 14220 row entries.


