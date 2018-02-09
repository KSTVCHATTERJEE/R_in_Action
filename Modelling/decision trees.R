train1 <- data.frame(rollno=c(1,2,3), gender=c('M','M','F'),play=c('Play','NoPlay','Play'))
train1

library(rpart)
mytree1 <- rpart(play~gender, data=train1, method='class')
mytree1

train2 <- data.frame(rollno=c(1,2,3,4), gender=c('M','M','F','F'),play=c('NoPlay','NoPlay','Play','Play'))
rpart(play~gender,data=train2,method='class')
mytree2 <- rpart(play~gender,data=train2,method='class',minsplit=1,minbucket=1)
train2

train3 <- data.frame(rollno=c(1,2,3,4,5,6,7),gender=c('M','M','F','M','F','F','M'),play=c('Play','Play','NoPlay','Play','Play','NoPlay','Play'))
train3
mytree3<- rpart(play~gender,data=train3,method='class',minsplit=2,minbucket=1)
mytree3

library(rattle)
library(rpart.plot)
library(RColorBrewer)
fancyRpartPlot(mytree3)

train3

mytree1b <- rpart(play~gender,data=train1, method='class',minsplit=2, minbucket=1, cp=-1)
mytree1b

train3$married <- c('Married','Single','Married','Married','Married','Single','Single')
train3
mytree4b <- rpart(play~gender+married, data=train3, method='class',minsplit=2,minbucket=1)
mytree4b
fancyRpartPlot(mytree4b)

mytree4c <- rpart(play~gender+married, data=train3, method='class',minsplit=2,minbucket=1,cp=-1)
fancyRpartPlot(mytree4c)

mytree4b$where
mytree4b
train3

mytree4c<- rpart(play~gender,data=train3, method='class',weights=c(.3,.1,.1,.1,.1,.1,.2),minsplit=2,minbucket=1)
fancyRpartPlot(mytree4c)

predict(mytree4b, newdata=data.frame(gender='M',married='Single'))
printcp(mytree4b)
 

rollno <- paste('S',1:30,sep='')
rollno
set.seed(1)
gender <- sample(x=c('Male','Female'), size=30,replace=T, prob=c(0.5,0.5))
gender
table(gender)
set.seed(1)
play<- sample(x=c('Yes','No'), size=30, replace=T, prob=c(15/30,15/30))
play
table(play)
students1 <- data.frame(gender,play)
rownames(students1)= rollno
students1
table(students1)

#Model1
library(rpart)
fit1<- rpart(play~gender, data=students1)
fit1
print(fit1)

library(rpart.plot)
rpart.plot(fit1, main='Classification Treee')

predict(fit1, newdata=data.frame(gender='Male'))
