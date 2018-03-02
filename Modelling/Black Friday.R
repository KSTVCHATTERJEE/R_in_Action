train=read.csv(file.choose())
str(train)
train$Marital_Status=as.factor(train$Marital_Status)
train$Stay_In_Current_City_Years=as.integer(train$Stay_In_Current_City_Years)
colSums(is.na(train))
dim(train)
train$Product_Category_3
train$Product_Category_2
str(train)
train1=train[,c(3,4,5,6,7,8,9,10,12)]
str(train1)
mean(train1$Product_Category_2,na.rm=T)
train1$Product_Category_2[is.na(train1$Product_Category_2)]=round(mean(train1$Product_Category_2,na.rm=T),0)
train1$Product_Category_2

colSums(is.na(train1))

fit1=lm(Purchase~.,data=train1)
summary(fit1)
str(train1)

fit2=lm(Purchase~Gender+Age+Occupation+City_Category+Marital_Status+Product_Category_1+Product_Category_2,data=train1)
summary(fit2)

library(randomForest)
PredictForest1 <- randomForest(Purchase~., data=train1)
PredictForest1
