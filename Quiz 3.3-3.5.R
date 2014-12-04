# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
#
# Load the educational data from this data set: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
#
# Original data sources: 
# http://data.worldbank.org/data-catalog/GDP-ranking-table 
# http://data.worldbank.org/data-catalog/ed-stats
#
# 3. Match the data based on the country shortcode.
# How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame? 
#
# 4. What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
#
# 5. Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?

library(stringr)

get.countries <- function() {
    # read data from CSV file
    countries <- read.csv("getdata-data-EDSTATS_Country.csv", stringsAsFactors = FALSE)
    # set columns as factors
    countries$Income.Group <- as.factor(countries$Income.Group)
    countries$Region <- as.factor(countries$Region)
    countries$Lending.category <- as.factor(countries$Lending.category)
    countries
}

get.gdp <- function() {
    gdp <- read.csv("getdata-data-GDP.csv", stringsAsFactors = FALSE,
                    na.strings = ".. Not available.  ", skip = 3)
    # change the name of the column
    names(gdp)[1] <- "CountryCode"
    names(gdp)[5] <- "GDP"
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

quiz3 <- function(merged) {
    merged[order(merged$Ranking, decreasing = TRUE),][13,seq(1:4)]
}

quiz4 <- function(merged) {
    # select OECD rating 
    oecd.rating <- merged[merged$Income.Group == "High income: OECD", 2]
    
    # select non OECD rating
    nonoecd.rating <- merged[merged$Income.Group == "High income: nonOECD", 2]
    # remove all NAs
    nonoecd.rating <- nonoecd.rating[!is.na(nonoecd.rating)]

    # return averages
    c(ave(oecd.rating)[1], ave(nonoecd.rating)[1])
}

quiz5 <- function(merged) {
    merged$GDPgroups <- as.factor(cut(merged$GDP, breaks = quantile(merged$GDP, seq(0,1,0.2))))
    table(merged$Income.Group, merged$GDPgroups)[5,5]
}
countries <- get.countries()
gdp <- get.gdp()
merged <- merge(gdp, countries)

