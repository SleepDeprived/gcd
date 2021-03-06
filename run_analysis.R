# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="gcdFUCI_dataset.zip", method="curl")
library(plyr)
library(reshape2)


runPeerAnalysis <- function(){ 
  measurementData <- loadCombineData()

  subjectActivity <- extractMeanSd(measurementData)
  m <- melt(subjectActivity, id = c("subject", "activity"), measure = colnames(subjectActivity)[3:length(colnames(subjectActivity))])
  tidyDataSet <- dcast(m, subject + activity ~ variable, mean)

  write.table(tidyDataSet, file = "gcd_peer_tidy_data.txt", sep = "\t")
}

loadCombineData <- function(){
  features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, stringsAsFactors = FALSE)
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
  colnames(data)[3:563] <- features[,2]
  data
}

extractMeanSd <- function(data) {
  meanStdCols <- grep("mean()|std()", colnames(data))
  temp <-  data[,c(1, 2, meanStdCols)]
  meanStdData <- temp[,grep("meanFreq()", colnames(temp))*-1]
}
