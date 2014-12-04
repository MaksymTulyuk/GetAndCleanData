# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
#
# Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table
#
# 2. Remove the commas from the GDP numbers in millions of dollars and average them. What is the average? 
#
# 3. what is a regular expression that would allow you to count the number of countries whose name begins with "United"? Assume that the variable with the country names in it is named countryNames.
# How many countries begin with United?

library(stringr)

get.gdp <- function() {
    gdp <- read.csv("getdata-data-GDP.csv", stringsAsFactors = FALSE, encoding = "UTF-8",
                    na.strings = ".. Not available.  ", skip = 3)
    # change the name of the column
    names(gdp)[c(1, 4, 5)] <- c("CountryCode", "CountryName", "GDP")
    # leave just the columns 1, 2, 4, 5
    gdp <- gdp[c(1, 2, 4, 5)]
    # get rows with countries only
    gdp <- gdp[c(2:191),]
    # renumber rows
    row.names(gdp) <- NULL
    # set column types: numbers
    gdp$Ranking <- as.numeric(gdp$Ranking)
    gdp$GDP <- as.numeric(gsub(",","",gdp$GDP))
    gdp
}

quiz3 <- function(gdp) {
    mean(gdp$GDP)
}
quiz4 <- function(gdp) {
    grep("^United", gdp$CountryName)
}

gdp <- get.gdp()
quiz3(gdp)
quiz4(gdp)
