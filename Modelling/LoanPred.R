data2=read.csv(file.choose())
str(data2)
colSums(is.na(data2))
data2$LoanAmount[is.na(data2$LoanAmount)]=mean(data2$LoanAmount,na.rm=T)
data2$Loan_Amount_Term
data2$Loan_Amount_Term[is.na(data2$Loan_Amount_Term)]=median(data2$Loan_Amount_Term,na.rm=T)
data2$Credit_History=as.factor(data2$Credit_History)
table(data2$Credit_History)
data2$Credit_History[is.na(data2$Credit_History)]='1'
fit=glm(Loan_Status~Gender+Dependents+Education+Self_Employed+ApplicantIncome
        +CoapplicantIncome+LoanAmount+Loan_Amount_Term+Credit_History+Property_Area,data=data2,family=binomial)
summary(fit)
library(MASS)
fit2=stepAIC(fit)
fit3=glm(Loan_Status ~ Married + CoapplicantIncome + Credit_History + 
           Property_Area,data=data2, family=binomial)
summary(fit3)
pred=predict(fit3,data=data2)
pred
pred2=ifelse(pred>0.5,'Y','N')
pred2
table(pred2,data2$Loan_Status)


data3=read.csv(file.choose())

colSums(is.na(data3))
data3$LoanAmount[is.na(data3$LoanAmount)]=mean(data3$LoanAmount,na.rm=T)
data3$Credit_History=as.factor(data3$Credit_History)
data3$Loan_Amount_Term[is.na(data3$Loan_Amount_Term)]=median(data3$Loan_Amount_Term,na.rm=T)
table(data3$Credit_History)
data3$Credit_History[is.na(data3$Credit_History)]='1'

pred3=predict(fit3,newdata=data3)
pred4=ifelse(pred3>0.5,"Y","N")
pred4

write.csv(predrf,file.choose())

library(randomForest)
rf=randomForest(Loan_Status~Gender+Dependents+Education+Self_Employed+ApplicantIncome
             +CoapplicantIncome+LoanAmount+Loan_Amount_Term+Credit_History+Property_Area,data=data2)
(85+403)/(192+422)
predrf=predict(rf,newdata=data3,method='class')
predrf
anyNA(predrf)
