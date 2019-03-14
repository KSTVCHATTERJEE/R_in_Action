dataset2 = read.csv(file.choose())
str(dataset2)
dataset3=dataset2

dataset3$MarketID = as.factor(dataset3$MarketID)

fit1 <- lm(SalesInThousands ~ I(MarketID==2) +I(MarketID==3) +I(MarketID==4) +I(MarketID==5) 
         + I(MarketID==6) + I(MarketID==7) +I(MarketID==8) +I(MarketID==9) +I(MarketID==10)+ Promotion , data=dataset3)
summary(fit1)

dataset3$SalesInThousands = dataset3$sales

str(dataset3)

fit2<- lm(SalesInThousands ~ I(MarketID==2) +I(MarketID==3) +I(MarketID==4) +I(MarketID==5) 
         + I(MarketID==7) +I(MarketID==8) +I(MarketID==9) +I(MarketID==10) , data=dataset3)

summary(fit2)

fit3=lm(SalesInThousands ~ MarketSize,data=dataset2)
summary(fit3)