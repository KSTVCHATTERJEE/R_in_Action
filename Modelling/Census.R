census <- read.csv(file.choose(),header=TRUE)
str(census)
summary(census)

set.seed(3000)
library(caTools)
spl=sample.split(census$over50k,SplitRatio=0.6)
Train <- subset(census,spl==TRUE)
dim(Train)
str(Train)

Test <- subset(census,spl==FALSE)
dim(Test)
str(Test)

dim(census)

library(rpart)
CART1 <- rpart(over50k~.,data=Train,method="class")
library(rpart.plot)
prp(CART1)
CART1

predictCART1 <- predict(CART1, newdata=Test, type="class")
table(Test$over50k,predictCART1)
(9117+1676)/(9117+596+1402+1676)

library(caret)
confusionMatrix(predictCART1,Test$over50k)

predictCART2 <- predict(CART1, newdata=Test)
library(pROC)
roc <- roc(response=Test$over50k, predictor = predictCART2[,2],level=rev(levels(Test$over50k)))

plot(roc)



set.seed(3000)
spl = sample.split(census$over50k, SplitRatio = 0.6)
Train_1 = subset(census, spl==TRUE)
dim(Train_1)
str(Train_1)

Test_1<- subset(census, spl==FALSE)
dim(Test_1)
str(Test_1)

library(randomForest)
PredictForest1 <- randomForest(over50k~., data=Train_1)
PredictForest1

predForest1 <- predict(PredictForest1, newdata=Test_1, type="class")
table(Test_1$over50k, predForest1)
(9678+838)/(9678+35+2240+838)

confusionMatrix(predForest1,Test_1$over50k)

vu <- varUsed(PredictForest1,count=TRUE)
vusorted = sort(vu, decreasing = FALSE, index.return = TRUE)
dotchart(vusorted$x, names(PredictForest1$forest$xlevels[vusorted$ix]), main = "Variable Importance Chart_Splitting")

varImpPlot(PredictForest1, main = "Variable Importance Chart_Impurity Red")
