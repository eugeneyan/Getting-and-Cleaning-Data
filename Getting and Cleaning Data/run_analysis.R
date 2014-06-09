##################################################################
# 1. Merges the training and the test sets to create one data set.
##################################################################

# read training data
train_data <- read.table('./Project/X_train.txt')
train_label <- read.table('./Project/y_train.txt')
train_subject <- read.table('./Project/subject_train.txt')

# read test data
test_data <- read.table('./Project/X_test.txt')
test_label <- read.table('./Project/y_test.txt')
test_subject <- read.table('./Project/subject_test.txt')

# read headers: feature and activity label
feature <- read.table('./Project/features.txt')
activity <- read.table('./Project/activity_labels.txt')

# assign proper column names
colnames(train_data) <- feature[,2]
colnames(train_label) <- 'activity_id'
colnames(train_subject) <- 'subject_id'
colnames(test_data) <- feature[,2]
colnames(test_label) <- 'activity_id'
colnames(test_subject) <- 'subject_id'
colnames(activity) <- c('activity_id', 'activity_name')

# merge train_data, train_label, and train_subject to create train_set
train_set <- cbind(train_label, train_subject, train_data)

# merge test_data, test_label, and test_subject to create test_set
test_set <- cbind(test_label, test_subject, test_data)

# merge train_set and test_data to create all_data
all_data <- rbind(train_set, test_set)

##################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##################################################################

# keep activity_id, subject_id, mean, and sd
all_data2 <- all_data[c('activity_id', 'subject_id')]
all_data2 <- cbind(all_data2, all_data[grep('mean\\(\\)|std\\(\\)', colnames(all_data))])

str(all_data2)

##################################################################
# 3. Uses descriptive activity names to name the activities in the data set
##################################################################




##################################################################
# 4. Appropriately labels the data set with descriptive variable names. 
##################################################################




##################################################################
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##################################################################