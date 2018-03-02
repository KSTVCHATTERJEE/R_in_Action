library(arules)
library(arulesViz)
library(datasets)

data(Groceries)

itemFrequencyPlot(Groceries,topN=20, type="absolute")
inspect(Groceries)

itemFrequencyPlot(Groceries,topN=20, type="relative")
inspect(Groceries[1:5])

frequentItems <- eclat(Groceries, parameter = list(supp= 0.07, maxlen=15))
frequentItems
inspect(frequentItems)

itemFrequencyPlot(Groceries, topN=10, type='absolute')

rules <-apriori(Groceries, parameter=list(supp = 0.001,conf=0.5))
rules
quality(rules)

head(quality(rules))

inspect(rules[1:5])

rules <- sort(rules, by="confidence", decreasing=TRUE)

rules = apriori(data=Groceries, parameter=list(supp=0.001,conf=0.08),appearance=list(default="lhs",rhs="whole milk"),control=list(verbose=F))

inspect(rules[1:20])

rules = apriori(data=Groceries, parameter=list(supp=0.001,conf=0.08),appearance=list(lhs="whole milk",default="rhs"),control=list(verbose=F))

library(arulesViz)

plot(rules, method='graph',engine='interactive',shading=NA)