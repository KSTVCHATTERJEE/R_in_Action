x = c(45,47,50,52,48,47,49,53,51)
mean(x)
t.test(x,alternative="two.sided",mu=47.5,conf.level=.95)

(t=(49.111-47.5)/(sd(x)/sqrt(8)))
