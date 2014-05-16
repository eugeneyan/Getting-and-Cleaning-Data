#Qn 1
house <- read.csv('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv')
View(house)
summary(house$VAL)
table(house$VAL)
View(house[,house$VAL==24])

