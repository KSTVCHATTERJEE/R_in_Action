train <- read.csv(file.choose(),header=TRUE,as.is=TRUE,na.strings=c(""))
test <- read.csv(file.choose(),header=TRUE,as.is=TRUE,na.strings=c(""))
str(train)
summary(train)
as.data.frame(colSums(is.na(train)))
library(Amelia)
missmap(train, main="Missing values vs Observed")
train_2 <- subset(train,select=-c(Cabin,PassengerId,Ticket,Name))
train_2
train_2$Age[is.na(train_2$Age)]<-mean(train_2$Age,na.rm=T)
train_2$Embarked=as.factor(train_2$Embarked)
train_2$Sex=as.factor(train_2$Sex)

contrasts(train_2$Sex)
contrasts(train_2$Embarked)

train_2 <- train_2[!is.na(train_2$Embarked),]
rownames(train_2)<-NULL
train_2

colSums(is.na(train_2))

library(caTools)
set.seed(113)
spl=sample.split(train_2$Survived,0.85)
train_t=subset(train_2,spl=TRUE)
train_v=subset(train_2,spl=FALSE)

Model1 <- glm(Survived~.,family=binomial(link='logit'),data=train_t)
summary(Model1)

Model2 <- glm(Survived~Pclass+Sex+Age+SibSp+Fare+Embarked,family=binomial(link='logit'),data=train_t)
summary(Model2)

Model3 <- glm(Survived~Pclass+Sex+Age+SibSp+Embarked,family=binomial(link='logit'),data=train_t)
summary(Model3)


Model4 <- glm(Survived~Pclass+Sex+Age+SibSp+I(Embarked=='S'),family=binomial(link='logit'),data=train_t)
summary(Model4)
