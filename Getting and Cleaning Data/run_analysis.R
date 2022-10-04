# library
library(data.table)
library(dplyr)

# dataset -----------------------------------------------------------------
features <- fread("./UCI HAR Dataset/features.txt", header = FALSE)
names(features) <- c("colId", "colName")

# Test data
test <- fread("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
test_activity <- fread("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
test_subject <- fread("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
test <- cbind(test, test_activity, test_subject)
names(test) <- append(features$colName, c('activity', 'subject'))

# Train data
train <- fread("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
train_activity <- fread("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
train_subject <- fread("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
train <- cbind(train, train_activity, train_subject)
names(train) <- append(features$colName, c('activity', 'subject'))

# Activity labels
activity <- fread("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
names(activity) <- c("colId", "colName")


# manipulation --------------------------------------------------------------------
# combind the rows of train and test data
merged <- rbind(train, test)

# select the columns having the strings that includes mean, std, activity and subject
colBool <- grep(".*Mean.*|.*Std.*|activity|subject", names(merged), ignore.case = TRUE)
merged <- merged[, colBool, with=FALSE]

# replace activity column from no. to strings
for(i in seq_along(activity$colName)) {
    merged$activity <- gsub(i, activity[i, "colName"], merged$activity)
}

# change the column names to descriptive variable names
names(merged) <- gsub('^t', 'time', names(merged))
names(merged) <- gsub('^f', 'frequency', names(merged))
names(merged) <- gsub('Acc', 'Accelerometer', names(merged))
names(merged) <- gsub('Gyro', 'Gyroscope', names(merged))
names(merged) <- gsub('Mag', 'Magnitude', names(merged))
names(merged) <- gsub('angle', 'Angle', names(merged))
names(merged) <- gsub('gravity', 'Gravity', names(merged))
names(merged) <- gsub('-mean', 'Mean', names(merged), ignore.case = TRUE)
names(merged) <- gsub('-std', 'STD', names(merged), ignore.case = TRUE)
names(merged) <- gsub('-freq', 'Freq', names(merged), ignore.case = TRUE)

answer <- merged %>% 
    group_by(activity, subject) %>% 
    summarise_all(mean)

write.table(answer, file = "./tidyData.txt", row.names = FALSE)