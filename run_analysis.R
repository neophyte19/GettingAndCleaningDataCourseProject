
#read activity lables
temp = read.table("UCI HAR Dataset/activity_labels.txt", sep="")
activitylabels = temp$V2
#read attributes
temp = read.table("UCI HAR Dataset/features.txt", sep="")
features = temp$V2

#read X-train and add attributes as column names
X_train <- read.table("UCI HAR Dataset/train/X_train.txt",sep = "" )
names(X_train) = features

#read Y-train and add activity names for the corresponding activity codes
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt",sep = "" )
names(Y_train) = "Activity"
Y_train$Activity = as.factor(Y_train$Activity)
levels(Y_train$Activity) = activitylabels

#read subject-train data and add Subject as column name
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",sep = "" )
names(subject_train) = "Subject"
subject_train$Subject = as.factor(subject_train$Subject)

#combine all three files to form the "training" data
training <- cbind(X_train, subject_train, Y_train)

#read X-test and add attributes as column names
X_test <- read.table("UCI HAR Dataset/test/X_test.txt",sep = "" )
names(X_test) = features

#read Y-test and add activity names for the corresponding activity codes
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt",sep = "" )
names(Y_test) = "Activity"
Y_test$Activity = as.factor(Y_test$Activity)
levels(Y_test$Activity) = activitylabels

#read subject-test data and add Subject as column name
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",sep = "" )
names(subject_test) = "Subject"
subject_test$Subject = as.factor(subject_test$Subject)

#combine all three files to form the "test" data
test <- cbind(X_test, subject_test, Y_test)

#combine training and test data
mergeddata = rbind(training, test)

#read only mean and std measures
needed <- mergeddata[,grep("mean\\(\\)|std\\(\\)|Subject|Activity", names(mergeddata), value=TRUE)]

#aggregate data to create tidy dataset
tidy = aggregate(needed, by=list(activity = needed$Activity, subject=needed$Subject), mean)
tidy$Activity <- NULL
tidy$Subject <- NULL

#write tidy data to disk
write.table(tidy, "tidy.txt", sep=",",row.names=FALSE)
