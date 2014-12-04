# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 
#
# using the fread() command load the data into an R object
#  DT 
#
# Which of the following is the fastest way to calculate the average value of the variable
#  pwgtp15 
# broken down by sex using the data.table package?

DT <- fread("getdata-data-ss06pid.csv")
#system.time(mean(DT$pwgtp15,by=DT$SEX))
#system.time(rowMeans(DT)[DT$SEX==1]) + system.time(rowMeans(DT)[DT$SEX==2])
# too slow: system.time(mean(DT[DT$SEX==1,]$pwgtp15)) + system.time(mean(DT[DT$SEX==2,]$pwgtp15))

# wrong: mean(DT$pwgtp15,by=DT$SEX)
# wrong: rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
# too slow: mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)

count_exec_time <- function(func) {
    repeats <- 1000
    
    total <- 0
    for (i in 1:repeats) {
        time <- system.time(func)
        total <- total + time
    }
    total
}

count_exec_time(sapply(split(DT$pwgtp15,DT$SEX),mean))
count_exec_time(DT[,mean(pwgtp15),by=SEX])
count_exec_time(system.time(tapply(DT$pwgtp15,DT$SEX,mean)))

#DT[,mean(pwgtp15),by=SEX]
total <- 0
for (i in 1:repeats) {
    time <- system.time(DT[,mean(pwgtp15),by=SEX])
    total <- total + time
}
total

#tapply(DT$pwgtp15,DT$SEX,mean)
total <- 0
for (i in 1:repeats) {
    time <- system.time(system.time(tapply(DT$pwgtp15,DT$SEX,mean)))
    total <- total + time
}
total
