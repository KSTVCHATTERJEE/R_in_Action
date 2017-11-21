mtcars

################## forward selection
mtcars.lm=lm(mpg~1,data=mtcars)
add1(mtcars.lm,mtcars,test="F")
?add1
mtcars.lm=lm(mpg~wt,data=mtcars)
summary(mtcars.lm)
add1(mtcars.lm,mtcars,test="F")
mtcars.lm=lm(mpg~wt+cyl,data=mtcars)
add1(mtcars.lm,mtcars,test="F")

summary(mtcars.lm)


############### backward selection

fit.full=lm(mpg~.,data=mtcars)
drop1(fit.full,test="F")
drop1(update(fit.full,~.-drat),test="F")
drop1(update(fit.full,~.-drat-carb),test="F")
drop1(update(fit.full,~.-drat-carb-vs),test="F")
drop1(update(fit.full,~.-drat-carb-vs-cyl),test="F")




################### anova

fit1=lm(mpg~wt,data=mtcars)
fit2=lm(mpg~wt+cyl,mtcars)
anova(fit1,fit2)  # p <0.05,reject null hypoy, fit1 is not better than fit2

######### AIC
AIC(fit1,fit2)  # fit2 Aic < fit1 aic...fit 2 is better


coefficients(fit2)
confint(fit2,level=0.95)
fitted(fit2)
mtcars$mpg
residuals(fit2)
anova(fit2)
cbind(mtcars$mpg,fitted(fit2),residuals(fit2))


vcov(fit2)
?vcov
influence(fit2)


library(MASS)
fit=lm(mpg~wt+cyl+hp+am,data=mtcars)
step=stepAIC(fit,direction="both")
step$anova
library(leaps)
leaps <- regsubsets(mpg~wt+cyl+hp+am,data=mtcars,nbest=10)
summary(leaps)
plot(leaps,scale="r2")
library(car)
subsets(leaps,statistic="rsq")

library(relaimpo)
calc.relimp(fit,type=c("lmg","last","first","pratt"),rela=TRUE)
boot <- boot.relimp(fit,b=1000,type=c("lmg","last","first","pratt"),rank=TRUE,diff=TRUE,rela=TRUE)
booteval.relimp(boot)
plot(booteval.relimp(boot,sort=TRUE))

#Logistic on mtcars ----
mtcars
str(mtcars)
names(mtcars)
dim(mtcars)
table(mtcars$am)
(t=table(mtcars$am))
(amt=addmargins(t))
(ppt=prop.table(t))
(base=glm(am~1,data=mtcars,family=binomial()))

exp(-0.3795)
(odds=exp(-0.3795))
odds/(odds+1)

summary(base)

(fit1 <- glm(am~mpg+disp+hp+wt,data=mtcars,family=binomial()))

summary(fit1)
plot(fit1)
anova(fit1)

(fit2 <- glm(am~mpg+hp+wt,data=mtcars,family=binomial()))

summary(fit2)

(fit3 <- glm(am~mpg+disp+wt,data=mtcars,family=binomial()))


(fit4 <- glm(am~mpg+wt,data=mtcars,family=binomial()))

summary(base)

prob_pred <- predict(fit2,type="response",newdata=mtcars[c('mpg','wt','hp')])
prob_pred
y_pred = ifelse(prob_pred>0.2,1,0)
y_pred
cm=table(mtcars$am,y_pred)
cm

(fit5 <- glm(am~hp+wt,data=mtcars,family=binomial()))

fit5

newdata=data.frame(wt=2,hp=150)
y_star = 18.86630 + (150*0.03626) + (2*-8.08348)
y_star
p = exp(y_star)/(exp(y_star)+1)
p

predict(fit5,newdata,type='response')

newdata2=data.frame(wt=2.780,hp=109)
predict(fit5,newdata=newdata2,type='response')

newdata3=data.frame(wt=3.845,hp=175)
predict(fit5,newdata=newdata3,type='response')

(p1 = predict(fit5,newdata = mtcars[c('wt','hp')],type='response'))
(p1 = round(p1,2))
(p1a = ifelse(p1 > 0.5,1,0))
cbind(mtcars$am,mtcars$wt,mtcars$hp,p1,p1a)
(xtab = table(mtcars$am,p1a))
caret::confusionMatrix(xtab)

car::vif(fit5)
sqrt(car::vif(fit5))>2
