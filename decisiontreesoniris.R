iris
str(iris)
library(rpart)
fit=rpart(Species~.,data=iris)
fit
library(rpart.plot)
rpart.plot(fit)

pred=predict(fit,iris[,1:4],type='class')

cbind(iris[,5],pred)

table(iris[,5],pred)
