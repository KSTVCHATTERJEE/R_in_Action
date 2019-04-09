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
setwd("C:\\Users\\Kaustav\\Documents\\GitHub\\R_in_Action")

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

##Graphical representation
boxplot(training$Customer.Lifetime.Value)
