Getting And Cleaning Data:  CourseProject
===================================

Introduction :
---------------

This repository contains the code I have written to perform the specified analysis task on the UCI HAR Dataset for the course project for the coursera course - Getting and Cleaning Data. 

About Raw Data : 
-----------------

The raw data contains both test and training data set from the experiment carried out on 30 subjects for various activities like Walking , Standing etc wearing smartphone and measurements for acceleration etc are catprued. 

Pre-requisite to run the code:
------------------------------

  Download and extract the source data from the URL : "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  Extract the downloaded Zip to working directory and you should have a folder named UCI HAR Dataset with the test and    training folders inside for running the code

  Sample R code to do the above : 
  -------------------------------
  #download data
  url<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url,"UCI HAR Dataset.zip")
  unzip("UCI HAR Dataset.zip",exdir="UCI HAR Dataset")

About the code :
----------------

The R script reads and extracts test and training data set. It combines them into a single data set and extracts only mean and std measurements for all subjects and activities. The tidy data set contains aggregated value for the mean and std measurements for all subjects and activities and is written to disk.

The tidy data set can be viewed in excel by modifying the extention to csv(as it is created using ',' as seperator for enabling easy readability)

Steps: 
------

1. The code read the training data sets X-training, Y-training and subject-training files. 
2. It assigns the column names Subject , Activity , Measurements from the features.txt and activity.txt files.
3. Then the data from all three files are combined into one "Training" data set.
4. The step 1,2,3 is performed for the test data set also.
5. The training and test data sets are combined into one data set (named as "mergeddata").
6. The requirement is to extract only mean and std measurements and this is done by extracting only meand and std columns from combined test and training data and the data set named "needed" is created.
7. The tidy dataset is created by calculating the aggredated data from this "needed" data set for each subject and activity and the two unwanted column at the last is removed.
8. At last , the resultant "tidy" data set is written to disk with ',' seperator for enabling easy readabilty(using excel)

About the codebook:
--------------------

Codebook explains about the resultant data.
