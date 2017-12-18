df=read.csv("./Data/home_data.csv")
df
str(df)
colSums(is.na(df))

meanzip=aggregate(df$price,by=list(df$zipcode),FUN=mean)
meanzip
str(meanzip)
colnames(meanzip)=c("Zipcode","Price")
meanzip[meanzip$Price==max(meanzip$Price),]
str(df)
highest=df[which(df$zipcode=='98039'),3]
highest
mean(highest)
count=df[which(df$sqft_living>=2000 & df$sqft_living<=4000),]
length(df)
nrow(df)
nrow(count)
(fraction=nrow(count)/nrow(df))

my_features=c('bedrooms','bathrooms','sqft_living','sqft_lot','floors','zipcode')

library(caTools)
set.seed(1234)
split=sample.split(df$price,SplitRatio=0.8)
training_set=subset(df,split==TRUE)
test_set=subset(df,split==FALSE)

MF=lm(price~bedrooms+bathrooms+sqft_living+sqft_lot+floors+zipcode,data=training_set)
MF
summary(MF)

price_pred_1=predict(MF,type="response",newdata=test_set)
price_pred_1

colnames(df)
AF=lm(price~bedrooms+bathrooms+sqft_living+sqft_lot+floors+waterfront+view+condition+grade+sqft_above+sqft_basement+yr_built+yr_renovated+zipcode+lat+long+sqft_living15+sqft_lot15,data=training_set)
summary(AF)

price_pred_2=predict(AF,type="response",newdata=test_set)
test_set
price_pred_2

test_set$pred1=price_pred_1
test_set$pred2=price_pred_2
RMSE1=sqrt(mean((test_set$price-test_set$pred1)^2))
RMSE1
RMSE2=sqrt(mean((test_set$price-test_set$pred2)^2))
RMSE2

p1=predict(MF,type="response",newdata=df[df$id==5309101200,])
p2=predict(AF,type="response",newdata=df[df$id==5309101200,])
(error1=abs(df$price[df$id==5309101200]-p1))          
(error2=abs(df$price[df$id==5309101200]-p2))

step=stepAIC(MF,direction="backward")
library(MASS)
