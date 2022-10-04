# Getting and Cleaning Data

------------------------------------------------------------------------

## What is included in this directory?

-   README.md (This document)

-   run_analysis.R (Assignment of [this course](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project))

-   tidyData.txt (The output of this assignment)

-   CodeBook.md (The codebook of tidyData.txt)

-   UCI HAR Dataset (The dataset of this assignment)

-   getdata_projectfiles_UCI HAR Dataset.zip (original zip file)

------------------------------------------------------------------------

## What packages am I used?

In this assignment, I used below packages. If you haven't installed all of them yet, please install them before you execute my R file.

-   dplyr

-   data.table

------------------------------------------------------------------------

## How the script works?

I can separate the script into three section, loading libraries, loading and manipulating dataset.

### Loading libraries

As I mentioned above the description, I used dplyr and data.table. data.table is used for accelerating processing speed of each data file. dplyr is used for summarizing tidy data.

### Loading dataset

In this section, I loaded data files named

-   [features.txt](./UCI%20HAR%20Dataset/features.txt)

-   [X_test.txt](./UCI%20HAR%20Dataset/test/X_test.txt)

-   [y_test.txt](./UCI%20HAR%20Dataset/test/y_test.txt)

-   [subject_test.txt](./UCI%20HAR%20Dataset/test/subject_test.txt)

-   [X_train.txt](./UCI%20HAR%20Dataset/train/X_train.txt)

-   [y_train.txt](./UCI%20HAR%20Dataset/train/y_train.txt)

-   [subject_train.txt](./UCI%20HAR%20Dataset/train/subject_train.txt)

-   [activity_labels.txt](./UCI%20HAR%20Dataset/activity_labels.txt)

And then I combined each file.

### Manipulating dataset

First of all, I combined the rows of both test and train data. And then I changed the column names to appropriate names along the instruction of the course project. At the last, I used two variables, activity and subject to group the dataset and calculate average values of each columns, then output txt.file as [tidyData.txt](./tidyData.txt).
