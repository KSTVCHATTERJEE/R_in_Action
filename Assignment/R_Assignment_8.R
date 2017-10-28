#Assignment - 8 ----
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
plot(faithful$eruptions,faithful$waiting,main="Scatterplot of eruptions and waiting")
hist(faithful$eruptions,main="Histogram of eruption durations of faithful data set")
boxplot(faithful$eruptions,main='Boxplot of eruption durations of faithful dataset')
?boxplot

attach(InsectSprays)
str(InsectSprays)

(Spray_A <- InsectSprays$count[which(InsectSprays$spray=='A')])
(Spray_B <- InsectSprays$count[which(InsectSprays$spray=='B')])
(Spray_C <- InsectSprays$count[which(InsectSprays$spray=='C')])
(Spray_D <- InsectSprays$count[which(InsectSprays$spray=='D')])
(Spray_E <- InsectSprays$count[which(InsectSprays$spray=='E')])
(Spray_F <- InsectSprays$count[which(InsectSprays$spray=='F')])

par(mfrow=c(2,3))
boxplot(Spray_A,main='Spray A')
boxplot(Spray_B,main='Spray B')
boxplot(Spray_C,main='Spray C')
boxplot(Spray_D,main='Spray D')
boxplot(Spray_E,main='Spray E')
boxplot(Spray_F,main='Spray F')

cov(faithful$eruptions,faithful$waiting)
cor(faithful$eruptions,faithful$waiting)
