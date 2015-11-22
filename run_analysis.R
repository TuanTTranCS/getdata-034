#getdata-034 - Course Project
#Tuan Tran

library(plyr)
library(dplyr)
library(reshape)

#Retrieve all data info into data frames
activitiesLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE)
trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE)
columnClasses <- c("NULL","NULL",rep("numeric",561))
trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt")

testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")


# merge Train & Test Data sets
mergedSubjects <- rbind(trainSubjects, testSubjects)
mergedLabels <- rbind(trainLabels,testLabels)
mergedSet <- rbind(trainSet, testSet)

#find selected features:
selectedFeatures <- features[grep("mean\\(\\)|std\\(\\)",features$V2),]

#extract features from full merged data set
extractedDataSet <- mergedSet[,selectedFeatures$V1]

#set feature names for columns
names(extractedDataSet) <- selectedFeatures$V2

#map activities labels
mergedLabelsWithNames <- merge(mergedLabel, activitiesLabels, by.x = "V1", by.y = "V1", all = TRUE)

#Create final dataset
finalDataSet <- cbind(mergedSubjects$V1,mergedLabelsWithNames$V2,extractedDataSet)

names(finalDataSet)[1:2] <- c("subject","activity")

#Step5: Summary Table to get outputTable
finalDataSet$subject <- as.factor(finalDataSet$subject)
outputTable <- aggregate(finalDataSet,list(finalDataSet$subject,finalDataSet$activity), mean)
outputTable <- select(outputTable,-(subject:activity))

#rename the first 2 columns
names(outputTable)[1:2] <- c("subject","activity")
outputTable <- arrange(outputTable, subject,activity)

#Write output table to file
write.table(outputTable,"output_data.txt",row.names = FALSE)
