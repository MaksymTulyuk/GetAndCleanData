# You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices for publicly traded companies on the NASDAQ and NYSE.
# Use the following code to download data on Amazon's stock price and get the times the data was sampled.
#
#  library(quantmod)
#  amzn = getSymbols("AMZN",auto.assign=FALSE)
#  sampleTimes = index(amzn) 
#
# How many values were collected in 2012? How many values were collected on Mondays in 2012?

library(quantmod)
library(plyr)
library(lubridate)

quiz5  <- function(company = "amzn", year = "2012", weekday = "Mon") {
    # get row names from data frame
    sampleTimes = index(company)
    # how many samples in 2012
    per.year <- summary(year(sampleTimes) == year)
    # how manu samples on Monday in 2012
    on.day <- summary(wday(sampleTimes, label = TRUE) == weekday & year(sampleTimes) == year)
    c(per.year, on.day)
}

amzn = getSymbols("AMZN", auto.assign=FALSE)
quiz5(amzn, "2012", "Mon")
