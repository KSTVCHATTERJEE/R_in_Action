dataset = read.csv(file.choose())
str(dataset)
summary(dataset)

statedata_ctn<-subset(dataset, select = c(Population,Income,Illiteracy,Life.Exp,Murder,HS.Grad,Frost,Area,state.area,x,y))
statedata_cat<-subset(dataset, select = -c(Population,Income,Illiteracy,Life.Exp,Murder,HS.Grad,Frost,Area,state.area,x,y))

library(pastecs)
options(scipen=100)
options(digits=2)

stat.desc(statedata_ctn)

#Categorical Variables
as.matrix(sort(table(statedata_cat$state.division), decreasing = TRUE))
as.matrix(sort(table(statedata_cat$state.name), decreasing = TRUE))
as.matrix(sort(table(statedata_cat$state.region), decreasing = TRUE))

#Data Visualisation
plot(dataset$x,dataset$y, xlab = "longtitude of centres", ylab = "latitude of centres", main = "PLOT OF STATE CENTRES")

# About Highest Median High School Graduation Rate

boxplot(dataset$HS.Grad ~ dataset$state.region, xlab = "Region of USA", ylab = "High School Graduation Rate", main = "Distribution of High School Graduation Rate")

dataset$state.region<-as.factor(dataset$state.region)
dataset$state.division<-as.factor(dataset$state.division)
dataset$state.name<-as.factor(dataset$state.name)

Model1 <- lm(Life.Exp ~ Population+Income+Illiteracy+Murder+HS.Grad+Frost+Area+x+y+state.division+state.region,data=dataset)

summary(Model1)

Model2 <- lm(Life.Exp ~ Population + Income + Illiteracy + Murder + HS.Grad + Frost + Area + x + y,data=dataset)

summary(Model2)

Model3 <- lm(Life.Exp ~ Population + Income + Illiteracy + Murder + HS.Grad + Area + x + y,data=dataset)

summary(Model3)

Model4 <- lm(Life.Exp ~ Population + Income + Murder + HS.Grad + Area + x + y,data=dataset)

summary(Model4)

Model5 <- lm(Life.Exp ~ Population + Income + Murder  + Area + x + y,data=dataset)

summary(Model5)

Model6 <- lm(Life.Exp ~ Population + Income + Murder + x + y,data=dataset)

summary(Model6)

Model7 <- lm(Life.Exp ~ Population + Murder + x + y,data=dataset)

summary(Model7)

Model8 <- lm(Life.Exp ~ Population + Murder + HS.Grad + Frost, data=dataset)
summary(Model8)
