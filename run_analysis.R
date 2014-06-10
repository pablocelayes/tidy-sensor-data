# Merges the training and the test sets to create one data set.
setwd("../UCI HAR Dataset/")
system("cp test/X_test.txt merged/X.txt")
system("cp test/y_test.txt merged/y.txt")
system("cat train/X_train.txt >> merged/X.txt")
system("cat train/y_train.txt >> merged/y.txt")

# Extracts only the measurements on the mean and standard deviation for each measurement. 
system("cat features.txt | grep 'mean()$\\|std()$' > tidy/features.txt")
inputFile <- "tidy/features.txt"
vars <- read.delim(file="tidy/features.txt", header=F, sep = " ")
fulldataset <- read.delim(file="merged/X.txt", header=F, sep = " ")
dataset <- fulldataset[, vars[[1]]]

# Appropriately labels the data set with descriptive variable names. 
colnames(dataset) <- vars[[2]]

# Uses descriptive activity names to name the activities in the data set


# Creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject. 
