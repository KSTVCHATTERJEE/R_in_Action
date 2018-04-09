ad_org_train=read.csv("F:/R_in_Action/Vidooly/ad_org_train.csv",stringsAsFactors = FALSE)
ad_org_test=read.csv("F:/R_in_Action/Vidooly/ad_org_test.csv",stringsAsFactors = FALSE)
str(ad_org_train)
str(ad_org_test)
summary(ad_org_train)
colSums(is.na(ad_org_train))
fix(ad_org_train)

for (i in 1:14999){
  for(j in 2:6){
  if(ad_org_train[i,j]=='F'){
    ad_org_train[i,j]=NA;
}
}
}

for (k in 3:6){
  ad_org_train[,k]=as.integer(ad_org_train[,k])
}

ad_org_train$views[is.na(ad_org_train$views)]=median(ad_org_train$views,na.rm=T)
ad_org_train$likes[is.na(ad_org_train$likes)]=median(ad_org_train$likes,na.rm=T)
ad_org_train$dislikes[is.na(ad_org_train$dislikes)]=median(ad_org_train$dislikes,na.rm=T)
ad_org_train$comment[is.na(ad_org_train$comment)]=median(ad_org_train$comment,na.rm=T)

for (i in 1:nrow(ad_org_train))
{
if((grepl('H',ad_org_train$duration[i])==TRUE) & (grepl('M',ad_org_train$duration[i])==TRUE) & (grepl('S',ad_org_train$duration[i])==TRUE))
{
ad_org_train$hour[i]=substr(ad_org_train$duration[i],regexpr('T',ad_org_train$duration[i])+1,regexpr('H',ad_org_train$duration[i])-1);
ad_org_train$min[i]=substr(ad_org_train$duration[i],regexpr('H',ad_org_train$duration[i])+1,regexpr('M',ad_org_train$duration[i])-1);
ad_org_train$sec[i]=substr(ad_org_train$duration[i],regexpr('M',ad_org_train$duration[i])+1,regexpr('S',ad_org_train$duration[i])-1);
}
      
else if((grepl('H',ad_org_train$duration[i])==FALSE) & (grepl('M',ad_org_train$duration[i])==TRUE) & (grepl('S',ad_org_train$duration[i])==TRUE))
{
ad_org_train$hour[i]=0;
ad_org_train$min[i]=substr(ad_org_train$duration[i],regexpr('T',ad_org_train$duration[i])+1,regexpr('M',ad_org_train$duration[i])-1);
ad_org_train$sec[i]=substr(ad_org_train$duration[i],regexpr('M',ad_org_train$duration[i])+1,regexpr('S',ad_org_train$duration[i])-1);
}
else if((grepl('H',ad_org_train$duration[i])==FALSE) & (grepl('M',ad_org_train$duration[i])==FALSE) & (grepl('S',ad_org_train$duration[i])==TRUE))
{
ad_org_train$hour[i]=0;
ad_org_train$min[i]=0;
ad_org_train$sec[i]=substr(ad_org_train$duration[i],regexpr('T',ad_org_train$duration[i])+1,regexpr('S',ad_org_train$duration[i])-1);
}
else if((grepl('H',ad_org_train$duration[i])==TRUE) & (grepl('M',ad_org_train$duration[i])==TRUE) & (grepl('S',ad_org_train$duration[i])==FALSE))
{
ad_org_train$hour[i]=substr(ad_org_train$duration[i],regexpr('T',ad_org_train$duration[i])+1,regexpr('H',ad_org_train$duration[i])-1);
ad_org_train$min[i]=substr(ad_org_train$duration[i],regexpr('H',ad_org_train$duration[i])+1,regexpr('M',ad_org_train$duration[i])-1);
ad_org_train$sec[i]=0;
}
else if((grepl('H',ad_org_train$duration[i])==TRUE) & (grepl('M',ad_org_train$duration[i])==FALSE) & (grepl('S',ad_org_train$duration[i])==FALSE))
{
ad_org_train$hour[i]=substr(ad_org_train$duration[i],regexpr('T',ad_org_train$duration[i])+1,regexpr('H',ad_org_train$duration[i])-1);
ad_org_train$min[i]=0;
ad_org_train$sec[i]=0;
}
else if((grepl('H',ad_org_train$duration[i])==FALSE) & (grepl('M',ad_org_train$duration[i])==TRUE) & (grepl('S',ad_org_train$duration[i])==FALSE))
{
ad_org_train$hour[i]=0;
ad_org_train$min[i]=substr(ad_org_train$duration[i],regexpr('T',ad_org_train$duration[i])+1,regexpr('M',ad_org_train$duration[i])-1);
ad_org_train$sec[i]=0;
}
else if((grepl('H',ad_org_train$duration[i])==TRUE) & (grepl('M',ad_org_train$duration[i])==FALSE) & (grepl('S',ad_org_train$duration[i])==TRUE))
{
ad_org_train$hour[i]=substr(ad_org_train$duration[i],regexpr('T',ad_org_train$duration[i])+1,regexpr('H',ad_org_train$duration[i])-1);
ad_org_train$min[i]=0;
ad_org_train$sec[i]=substr(ad_org_train$duration[i],regexpr('H',ad_org_train$duration[i])+1,regexpr('S',ad_org_train$duration[i])-1);
}
}
head(ad_org_train)

ad_org_train$durationnew=(ad_org_train$hour*3600)+(ad_org_train$min*60)+(ad_org_train$sec)
str(ad_org_train)

for (j in 10:12){
  ad_org_train[,j]=as.integer(ad_org_train[,j])
}
ad_org_train$durationnew

cor(ad_org_train[,c(2,3,4,5,6,13)])

ad_org_train$category=as.factor(ad_org_train$category)

train=ad_org_train
fix(train)
str(train)
boxplot(train$views)
boxplot(train$likes)
boxplot(train$dislikes)
boxplot(train$comment)
boxplot(train$durationnew)
str(train)
V=c(3,4,5,6,13)
for(j in c(3,4,5,6,13))
{
out1=(quantile(train[,j],0.25))-(1.5*IQR(train[,j]))
out2=(quantile(train[,j],0.75))+(1.5*IQR(train[,j]))
for (i in 1:nrow(train))
{
if((train[i,j]<out1) | (train[i,j]>out2))
{
train[i,j]=median(train[,j])
}
}
}
train$views
boxplot(train$views)
boxplot(train$likes)
boxplot(train$dislikes)
boxplot(train$comment)
boxplot(train$durationnew)

fit=lm(adview~views+likes+dislikes+comment+durationnew,data=train)
summary(fit)
plot(train$adview,ylim=c(0,5000),xlim=c(0,15000))
head(train$adview)
str(train)
for (i in c(3,4,5,6,13))
{
train[,i]=as.integer(train[,i])
}

library(randomForest)
rf=randomForest(adview~views,data=train,nodesize=5)
colSums(is.na(train))
str(train)
train$category=as.factor(train$category)

train$views
summary(train$views)

cbind(train,views2)
rm(train$views2)
train = train[,-c(14,15)]
str(train)
for (i in 1:nrow(train))
{
if((train[i,3]>=49) & (train[i,3]<=282943))
{
  train[i,14]=1;
}
if((train[i,3]>=282944) & (train[i,3]<=565837))
{
  train[i,14]=2;
}
if((train[i,3]>=565838) & (train[i,3]<=848731))
{
  train[i,14]=3;
}
if((train[i,3]>=848732) & (train[i,3]<=1131625))
{
  train[i,14]=4;
}
if((train[i,3]>=1131626) & (train[i,3]<=1414521))
{
  train[i,14]=5;
}
}
fix(train)
train$views2=factor(train$views2,levels=c(1,2,3,4,5))
train$views2

library(rpart)
library(rpart.plot)
fit1=rpart(adview~views2+category,data=train)
summary(fit1)
rpart.plot(fit1)
