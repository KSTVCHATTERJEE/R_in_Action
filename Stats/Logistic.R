library(AER)
Affairs
?Affairs
mydata=Affairs
summary(mydata)
dim(mydata)
x=mydata$affairs
table(x)
round(prop.table(table(x))*100,1)
x2=mydata$gender
table(x2)
prop.table(table(x2))
round(prop.table(table(x2))*100,1)
x3=mydata$children
round(prop.table(table(x3))*100,1)
mydata$ynaffair[mydata$affairs > 0] = 1
mydata$ynaffair[mydata$affairs == 0] = 0
mydata$ynaffair=factor(mydata$ynaffair,levels=c(0,1),labels=c('No','Yes'))
table(mydata$ynaffair)


