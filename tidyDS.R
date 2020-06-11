#1...Merges the training and the test sets to create one data set.
# 1.1 load the train data and the test data
X_train <- read.table("C:/Users/Coquin/Documents/R Scripts/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/Coquin/Documents/R Scripts/UCI HAR Dataset/train/y_train.txt")
X_test <- read.table("C:/Users/Coquin/Documents/R Scripts/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C:/Users/Coquin/Documents/R Scripts/UCI HAR Dataset/test/y_test.txt")
# 1.2 use rbind
#3...Uses descriptive activity names to name the activities in the data set
#----- change the names of the X set with the names given by features.txt file
feature_names <- read.table("C:/Users/Coquin/Documents/R Scripts/UCI HAR Dataset/features.txt")
names(X) <- feature_names$V2
X <- rbind(X_train, X_test)
#2...Extracts only the measurements on the mean and standard deviation for each measurement.
#----- only take de column names that have "mean" or "std" keywords
X_mean_std <- X[,grepl("mean", names(X)) | grepl("std", names(X))]

#4...Appropriately labels the data set with descriptive variable names.
y <- rbind(y_train, y_test)
Xy <- cbind(X_mean_std, y)
#5...From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
grouped <- Xy %>% group_by(V1) %>% summarise(
    all_means = sapply(mean))