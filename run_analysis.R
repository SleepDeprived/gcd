# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="gcdFUCI_dataset.zip", method="curl")
library(plyr)
library(reshape2)

columns <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

test <- cbind(subjectTest, ytest, xtest)
colnames(test)[1:2] <- c("subject","activity")
train <- cbind(subjectTrain, ytrain, xtrain)
colnames(train)[1:2] <- c("subject","activity")

data <- rbind(test, train)

measurementMean <- rowMeans(data[,3:563], )
stdDev <- apply(data[,3:563], MARGIN = 1, sd)
activity <- factor(as.character(data$activity), labels = columns$V2)

allSubjectActivity <- data.frame(data$subject, activity, measurementMean, stdDev)
colnames(allSubjectActivity)[1] <- "subject"

m <- melt(allSubjectActivity, id = c("subject", "activity"), measure = c("measurementMean"))

tidyDataSet <- dcast(m, subject + activity ~ variable, mean)
