data=read.csv(file.choose())
data
str(data)
data$Outlet_Establishment_Year=as.factor(data$Outlet_Establishment_Year)
colSums(is.na(data))
data$Item_Weight
data$Item_Weight[is.na(data$Item_Weight)]=mean(data$Item_Weight,na.rm=T)
colSums(is.na(data))
fit=lm(Item_Outlet_Sales~Item_Weight+Item_Fat_Content+Item_Visibility+Item_Type+Item_MRP+
         Outlet_Establishment_Year+Outlet_Size+Outlet_Location_Type+Outlet_Type,data=data)
summary(fit)
library(MASS)
fit2=stepAIC(fit)

fit3=lm(Item_Outlet_Sales ~ Item_MRP + Outlet_Establishment_Year + Outlet_Size + 
        Outlet_Type,data=data)
summary(fit3)

test=read.csv(file.choose())
pred=predict(fit3,newdata=data)
str(test)

cbind(data$Item_Identifier,pred,test$Item_Outlet_Sales)
pred2=predict(fit3,newdata=test)
round(pred2,0)

write.csv(round(pred2,0),file.choose())

RMSE=sqrt(mean((data$Item_Outlet_Sales-pred)^2))
RMSE

str(test)
colSums(is.na(test))
test$Item_Weight[is.na(test$Item_Weight)]=mean(test$Item_Weight,na.rm=T)
colSums(is.na(test))
fix(test)
fit3=lm(Item_Outlet_Sales ~ Item_MRP + Outlet_Establishment_Year + Outlet_Size + 
          Outlet_Type,data=data)
pred2=predict(fit3,newdata=test)
round(pred2,0)
pred2_1=ifelse(pred2<0,abs(pred2),pred2)
pred2_1
round(pred2_1,0)

write.csv(round(pred2_1,0),file.choose())
