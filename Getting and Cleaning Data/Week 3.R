set.seed(13435)
x <- data.frame('var1' = sample(1:5), 'var2' = sample(6:10), 'var3' = sample(11:15))
x <- x[sample(1:5), ]
x$var2[c(1, 3)] <- NA

library(data.table)
y <- setDT(x)
str(x)
str(y)

x[, 1]
y[, 1, with = F]

x[, 'var1']
y[, 'var1', with = F]
y[, var1]

x[1:2, 'var2']
y[1:2, var2]

x[(x$var1 <= 3 & x$var3 > 11), ]
y[(y$var1 <= 3 & y$var3 > 11), ]

x[which(x$var2 > 6), ]

sort(x$var1)
sort(x$var2, na.last = T)

x[order(x$var1), ]
x[order(x$var1, x$var3), ]
 
library(plyr)
arrange(x, var1)

x$var4 <- rnorm(5)
x <- cbind(x, rnorm(5))

fileUrl <- 'https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD'
download.file(fileUrl, destfile = 'restaurant2.csv', method = 'curl')
rest <- read.csv('restaurants.csv')

head(rest)
summary(rest)
str(rest)

quantile(rest$councilDistrict, na.rm = T)
table(rest$zipCode, useNA = 'ifany')
prop.table(table(rest$zipCode))

table(rest$councilDistrict, rest$zipCode)

is.na(rest$councilDistrict)
colSums(is.na(rest))
colSums(rest)

table(rest$zipCode %in% c('21212'))
rest[rest$zipCode %in% c('21212'), ]

data(UCBAdmissions)
df <- as.data.frame(UCBAdmissions)
str(df)
summary(df)
xt <- xtabs(Freq ~ Gender + Admit, data = df)
xt

rest$nearme <- NA
rest$nearme <- rest$neighborhood %in% c('Roland Park', 'Homeland')
str(rest)
table(rest$nearme)

rest$zipGroups <- cut(rest$zipCode, breaks = quantile(rest$zipCode))
table(rest$zipGroups)

