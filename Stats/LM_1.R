X = c(1.7,1.6,2.8,5.6,1.3,2.2,1.3,1.1,3.2,1.5,5.2,4.6,5.8,3)				
Y= c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1)
X;Y
df=data.frame(X,Y)
df
length(X)
sum(X)
mean(X)
sum(Y)
mean(Y)
cov(X,Y)
cor(X,Y)
cor.test(X,Y)
plot(X,Y,main='Plot between X and Y')
abline(lm(Y~X),col='red')
fit=lm(Y~X)
fit
text(x=X,y=Y,labels=paste0('(',X,',',Y,')'),cex=.7,col='red')
text(x=4,y=10,'Kaustav',cex=1.5)

df$x = round(X-mean(X),2)
df$y = round(Y-mean(Y),2)
df
df$xy = round(df$x*df$y,2)
df
df$x2 = round(df$x^2,2)
df
SSxy = sum(df$xy)
SSxy
(SSx2 = sum(df$x2))
b1 = SSxy/SSx2
b1
b0 = mean(y)-(b1*mean(x))
b0
df$Yh = round(fitted(fit),2)
df

df$residuals = round(df$Y - df$Yh,2)
df

summary(df$residuals)

df$SSr = round((df$Yh - mean(Y))^2,2)
df$SSe = round((df$Y - df$Yh)^2,2)
df
colSums(df)

R2 = round(sum(df$SSr)/(sum(df$SSe)+sum(df$SSr)),2)
R2
n=length(X)
stderror = sqrt(sum((df$SSe)/(n-2)))
stderror

SSR = sum(df$SSr)
SSE = sum(df$SSe)
p = 1 #no of IV
(MSR=SSR/p)
(MSE=SSE/(n-p-1))
(Fstats = MSR/MSE)
summary(fit)




women
attach(women)
cor.test(weight,height)
fit2 = lm(weight~height,data=women)
fit2

plot(x=height,y=weight)
abline(fit2,col='blue')

summary(fit2)

fitted(fit2)

fit3 <- lm(weight~height+I(height^2),data=women)
fit3
lines(women$height,fitted(fit3))
str(women)
summary(women)

fit4 <- lm(weight~height+I(height^2)+I(height^3),data=women)
fit4
lines(women$height,fitted(fit4))
summary(fit4)

car::scatterplot(weight~height,data=women,spread=FALSE, 
                 lty.smooth=2,pch=19,main="Women age 30-39", xlab="Height(inches)",
                 ylab="Weight (lbs)")

women
str(women)
fit=lm(weight~height,data=women)
fit
df1 = data.frame(h=women$height,w=women$weight,W=round(fitted(fit),2),R=round(residuals(fit),2))
df1
plot(fit)
plot(y=weight,x=height)
abline(fit,col="red")
fit2 = lm(weight~height+I(height^2))
fit2
plot(fit2)