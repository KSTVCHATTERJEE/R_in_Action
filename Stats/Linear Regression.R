library(MASS)
library(ISLR)

names(Boston)
plot(medv~lstat,Boston)
fit1 <- lm(medv~lstat,Boston)
fit1
summary(fit1)
abline(fit1,col="red")
confint(fit1)
predict(fit1,data.frame(lstat=c(5,10,15)),interval = "confidence")

#Multiple Linear Regression ----
fit2 <- lm(medv~lstat+age,data=Boston)
summary(fit2)

fit3 <- lm(medv~.,data=Boston)
summary(fit3)

par(mfrow=c(2,2))
plot(fit3)

fit4 <- update(fit3,~.-age,-indus)
summary(fit4)

#Nonlinear terms and interaction
fit5 <- lm(medv~lstat*age,Boston)
summary(fit5)

fit6 <- lm(medv~lstat+I(lstat^2),Boston)
summary(fit6)
