attach(iris)
library(randomForest)
fit1=randomForest(Species~.,data=iris)
fit1
