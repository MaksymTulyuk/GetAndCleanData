# The sqldf package allows for execution of SQL commands on R data frames.
# We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL.
# Download the American Community Survey data and load it into an R object called
#  acs
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 
#
# Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?

acs <- read.csv("getdata-data-ss06pid.csv")
# SQL command
result1 <- sqldf("select pwgtp1 from acs where AGEP < 50")
# R command
result2 <- acs[acs$AGEP < 50,]["pwgtp1"]
# compare results we got via different methods
all(result1 == result2)
table(result1 == result2)
all.equal(result1, result2, check.attributes = FALSE)
