sup1 = c(18.5,24,17.2,19.9,18)
sup2 = c(26.3,25.3,24,21.2,24.5)
sup3 = c(20.6,25.2,20.8,24.7,22.9)
sup4 = c(25.4,19.9,22.6,17.5,20.4)
df=data.frame(sup1,sup2,sup3,sup4)
df
colMeans(df)
round((addmargins(as.matrix(df),c(1,2),FUN=list(list(mean,sd),list(mean)))),1)
dfstack = stack(df)
str(dfstack)
aggregate(dfstack$values,by=list(dfstack$ind),FUN=mean)
aggregate(dfstack$values,by=list(dfstack$ind),FUN=sd)
fit1w = aov(values~ind,data=dfstack)
summary(fit1w)
qf(0.95,3,16)
boxplot(dfstack$values)
boxplot(df)
boxplot(values~ind,data=dfstack)

gplots::plotmeans(values~ind,data=dfstack)
abline(h=colMeans(df))

TukeyHSD(fit1w)
plot(TukeyHSD(fit1w))

library(multcomp)

tuk = glht(fit1w, linfct = mcp(ind='Tukey'))
plot(cld(tuk,level=0.05))

car::qqPlot(fit1w,simulate=T,labels=F)

bartlett.test(values~ind,data=dfstack)

car::outlierTest(fit1w)
