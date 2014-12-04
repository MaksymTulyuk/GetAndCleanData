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
# Match the data based on the country shortcode. Of the countries for which the end of the fiscal year is available, how many end in June? 

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

get.countries <- function() {
    # read data from CSV file
    countries <- read.csv("getdata-data-EDSTATS_Country.csv", stringsAsFactors = FALSE)
    # set columns as factors
    countries$Income.Group <- as.factor(countries$Income.Group)
    countries$Region <- as.factor(countries$Region)
    countries$Lending.category <- as.factor(countries$Lending.category)
    countries
}

quiz4 <- function(merged) {
    end.fiscal.year <- grep('Fiscal year end', merged$Special.Notes)
    fiscal.year <- merged[c(end.fiscal.year), "Special.Notes"]
    length(grep('June', fiscal.year))
}

countries <- get.countries()
gdp <- get.gdp()
merged <- merge(gdp, countries)
quiz4(merged)
