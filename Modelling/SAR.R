# SAR Assignment

library(dplyr)  # for data manipulation
library(caTools) # for splitting data
library(rms)      # for regression
house=read.csv("./Data/home_data.csv")
str(house)

colSums(is.na(house)) # checking if any columns have NA values



# 1. zipcode with highest average house sale price. 

## finding average sales of each zipcode
meanzip=aggregate(house$price,by=list(house$zipcode),FUN=mean)
str(meanzip)
colnames(meanzip)=c("Zip Code","Average Sales")

highest=meanzip[meanzip$`Average Sales`==max(meanzip$`Average Sales`),]
highest  # zipcode with highest average sales

# highest = filter(meanzip,`Average Sales`==max(`Average Sales`))



#2. fraction of the all houses have ‘sqft_living’ between 2000 and 4000

new_house=house[house$sqft_living>2000 & house$sqft_living <= 4000,]
str(new_house)
ratio=(nrow(new_house)/nrow(house))

ratio # fraction of houses with ‘sqft_living’ between 2000 and 4000

#splitting into train and test dataset

set.seed(0)

split = sample.split(house$price, SplitRatio = 0.80)

training_set = subset(house, split == TRUE)
test_set = subset(house, split == FALSE)
str(training_set)
str(test_set)


# Regression model with " my_features"
my_features=lm(price~ bedrooms +bathrooms +sqft_living +sqft_lot + floors + zipcode,
               data=training_set)
summary(my_features)
price_pred1=predict(my_features,type="response",newdata=test_set)


# Regression model with "advanced features"

adv_features=lm(price~bedrooms+ bathrooms+ sqft_living + sqft_lot + floors +zipcode+
                  condition +grade+ waterfront + view + sqft_above+ 
                  sqft_basement + yr_built + yr_renovated + lat + long + sqft_living15 + 
                  sqft_lot15 , data=training_set)

summary(adv_features)

price_pred2=predict(adv_features,type="response",newdata=test_set) 
# rank-deficiet fit warning

#finding errors and RMSE

test_set$pred1=price_pred1
test_set$pred2=price_pred2
head(test_set[c("price","pred1","pred2")])  


RMSE1  = sqrt(mean((test_set$price-test_set$pred1)^2))  # RMSE for "my features"

RMSE2  = sqrt(mean((test_set$price-test_set$pred2)^2)) # RMSE for "advanced features"

# RMSE2 < RMSE 1





# comparing performance of both models for house id = 5309101200

p1= predict(my_features,type="response",newdata=house[house$id==5309101200,])
p2= predict(adv_features,type="response",newdata=house[house$id==5309101200,]) 

(error1=abs(house$price[house$id==5309101200] - p1) ) # error from "my features"
(error2=abs(house$price[house$id==5309101200] - p2 ) ) # error from "adv. features"

# error2 < error1, therefore "advanced features" model performs better




summary(adv_features)