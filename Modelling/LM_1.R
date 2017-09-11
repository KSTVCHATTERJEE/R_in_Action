#Linear Regression

#myfit = lm(formula, data
data(women)
women
attach(women)
cov(height,weight)
cor(height,weight)
(weight.lm = lm(weight ~ height, data=women))
summary(weight.lm)
plot(height,weight)
abline(weight.lm,col='red')

