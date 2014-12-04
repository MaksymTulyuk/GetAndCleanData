# Download the Excel spreadsheet on Natural Gas Aquisition Program here: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 
#
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
#  dat 
# What is the value of:
#  sum(dat$Zip*dat$Ext,na.rm=T) 
#
# (original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)

dat <- read.xlsx("getdata-data-DATA.gov_NGAP.xlsx", sheetIndex = 1, header = TRUE, 
                 colIndex = c(7:15), rowIndex = c(18:23) )
sum(dat$Zip*dat$Ext,na.rm=T)
