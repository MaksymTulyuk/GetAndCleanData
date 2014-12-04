# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
#
#  and load the data into R. The code book, describing the variable names is here: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
#
# 1. How many properties are worth $1,000,000 or more?
#
# 2. Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate?

survey <- data.frame(read.csv("getdata-data-ss06hid.csv"))
vals1m <- survey[survey$VAL == 24, "VAL"]
length(vals1m[!is.na(vals1m)])
