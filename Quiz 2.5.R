# Read this data set into R and report the sum of the numbers in the fourth of the nine columns. 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for 
#
# Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for 
#
# (Hint this is a fixed width file format)

all.lines <- read.fortran("getdata-wksst8110.for",
                          format = c("1I1", "1A9", "1I5", "2F4.0", "1I5", "2F4.0"), skip = 4)
# remove columms with NA
all.lines <- all.lines <- all.lines[,c(-1,-3,-6)]
# summary
colSums(all.lines[4])
