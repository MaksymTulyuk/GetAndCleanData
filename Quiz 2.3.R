# The sqldf package allows for execution of SQL commands on R data frames.
# We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL.
# Download the American Community Survey data and load it into an R object called
#  acs
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 
#
# What is the equivalent function to unique(acs$AGEP)

acs <- read.csv("getdata-data-ss06pid.csv")
# SQL command
result1 <- sqldf("select distinct AGEP from acs")
# R command
result2 <- data.frame(unique(acs$AGEP))
# compare results we got via different methods
all(result1 == result2)
table(result1 == result2)
all.equal(result1, result2, check.attributes = FALSE)
