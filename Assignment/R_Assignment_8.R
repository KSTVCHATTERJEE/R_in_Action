attach(faithful)
str(faithful)
faithful$eruptions
mean(faithful$eruptions)
median(faithful$eruptions)
quantile(faithful$eruptions)
quantile(faithful$eruptions,c(0.32,0.57,0.98))
range(faithful$eruptions)
IQR(faithful$eruptions)
sd(faithful$eruptions)
var(faithful$eruptions)
library(moments)
skewness(faithful$eruptions) #-0.415 negatively skewed
kurtosis(faithful$eruptions) #1.4994 platykurtic, because <3
stem(faithful$eruptions)
plot(faithful$eruptions,faithful$waiting)
hist(faithful$eruptions)
boxplot(faithful$eruptions)


attach(InsectSprays)
str(InsectSprays)

boxplot(InsectSprays$count)
table(InsectSprays)

cov(faithful$eruptions,faithful$waiting)
cor(faithful$eruptions,faithful$waiting)
