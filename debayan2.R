##Calling all required packages
library(boot) 
library(car)
library(QuantPsyc)
library(lmtest)
library(sandwich)
library(vars)
library(nortest)
library(MASS)

##Setting read directory
setwd("C:\\Users\\James\\Desktop\\Business Analytics\\R\\Project")

##Importing csv file from read directory set above
data <- read.csv("Debayan.csv")


##Checking the data imported
str(data)
summary(data) 
head(data)


## Check the missing value (if any)
sapply(data, function(x) sum(is.na(x)))


set.seed(123)
train <- sample(1:nrow(data), nrow(data)/2)
test <- -train
training <- data[train,]
testing <- data[test,]
test_clv <- testing$clv

str(training)
str(testing)

##Renaming the dep var column
names(data)[names(data) == "Customer.Lifetime.Value"] <- "clv"


##Graphical representation
boxplot(data$clv)


## Checking for outliers
quantile(data$clv, c(0,0.05,0.1,0.25,0.5,0.75,0.85,0.90,0.95,0.99,0.995,1))

##Removing outliers
d <- data[data$clv<14400,]
nrow(d)
boxplot(d$clv)


head(d)
names(d)

str(training)

model <- lm(clv ~ Coverage + 
              I(Education == "College") + 
              I(Education == "High School or Below") + 
              Effective.To.Date + 
              I(EmploymentStatus == "Unemployed") + 
              Income + Monthly.Premium.Auto + 
              Number.of.Open.Complaints + Number.of.Policies + 
              Renew.Offer.Type + I(Vehicle.Class == "Sports Car") + 
              I(Vehicle.Class == "SUV") , data=d)
summary(model)


model <- lm(clv ~ Coverage + 
              Effective.To.Date + 
              Income + 
              Number.of.Open.Complaints + Number.of.Policies + 
              Renew.Offer.Type + Vehicle.Class, data=d)


summary(model)
str(d)
d$Effective.To.Date = as.Date(d$Effective.To.Date)

library(caret)
varImpPlot(model)

range(d$clv)
## MAPE
d$pred <- fitted(model)


#Calculating MAPE
attach(d)
(sum((abs(clv-pred))/clv))/nrow(d)


#Check Vif, vif>2 means presence of multicollinearity
vif(model)

##################################### Checking of Assumption ############################################

# residuals should be uncorrelated ##Autocorrelation
# Null H0: residuals from a linear regression are uncorrelated. Value should be close to 2. 
#Less than 1 and greater than 3 -> concern
## Should get a high p value

durbinWatsonTest(model)
dwt(model)

################ Constant error variance ##########Heteroscedasticity


# Breusch-Pagan test
bptest(model)  # Null hypothesis -> error is homogenious (p value should be more than 0.05)


#Cook-Weisberg test
# hypothesis of constant error variance against the alternative that the error variance changes with the level of the  response 
# p value should be more than 0.05

ncvTest(model <- lm(clv ~ Coverage + I(Education == "College") + I(Education == "High School or Below") + I(Effective.To.Date == "1/14/11") + I(Effective.To.Date == "1/22/11") + I(Effective.To.Date == "1/27/11") + I(Effective.To.Date == "1/29/11") + I(Effective.To.Date == "2/25/11") + I(EmploymentStatus == "Unemployed") + Income + Monthly.Premium.Auto + Number.of.Open.Complaints + Number.of.Policies + Renew.Offer.Type + I(Vehicle.Class == "Sports Car") + I(Vehicle.Class == "SUV") , data=d)
)


## Normality testing Null hypothesis is data is normal.

resids <- model$residuals


ad.test(resids) #get Anderson-Darling test for normality 
cvm.test(resids) #get Cramer-von Mises test for normaility 
lillie.test(resids) #get Lilliefors (Kolmogorov-Smirnov) test for normality 
pearson.test(resids) #get Pearson chi-square test for normaility 
sf.test(resids) #get Shapiro-Francia test for normaility 

qqnorm(resids)
