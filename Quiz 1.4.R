# Read the XML data on Baltimore restaurants from here: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 
#
# How many restaurants have zipcode 21231?

url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
restaurants <- xmlTreeParse(data, useInternal = TRUE)
rootNode <- xmlRoot(restaurants)
xmlName(rootNode)
zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
length(zipcodes[zipcodes == "21231"])
