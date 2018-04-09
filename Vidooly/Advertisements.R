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

boxplot(train$views)
boxplot(train$likes)
boxplot(train$dislikes)
boxplot(train$comment)
boxplot(train$durationnew)

str(train)
for (i in c(3,4,5,6,13))
{
train[,i]=as.integer(train[,i])
}

colSums(is.na(train))
str(train)
train$category=as.factor(train$category)

train$views
summary(train$views)

#views2
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
#duration2
for (i in 1:nrow(train))
{
  if((train[i,13]>=0) & (train[i,13]<=308))
  {
    train[i,15]=1;
  }
  if((train[i,13]>=309) & (train[i,13]<=617))
  {
    train[i,15]=2;
  }
  if((train[i,13]>=618) & (train[i,13]<=926))
  {
    train[i,15]=3;
  }
  if((train[i,13]>=927) & (train[i,13]<=1235))
  {
    train[i,15]=4;
  }
  if((train[i,13]>=1236) & (train[i,13]<=1541))
  {
    train[i,15]=5;
  }
}
str(train)

#likes2
for (i in 1:nrow(train))
{
  if((train[i,4]>=0) & (train[i,4]<=881))
  {
    train[i,16]=1;
  }
  if((train[i,4]>=882) & (train[i,4]<=1763))
  {
    train[i,16]=2;
  }
  if((train[i,4]>=1764) & (train[i,4]<=2645))
  {
    train[i,16]=3;
  }
  if((train[i,4]>=2646) & (train[i,4]<=3527))
  {
    train[i,16]=4;
  }
  if((train[i,4]>=3528) & (train[i,4]<=4403))
  {
    train[i,16]=5;
  }
}
#dislikes2
summary(train$dislikes)
for (i in 1:nrow(train))
{
  if((train[i,5]>=0) & (train[i,5]<=81))
  {
    train[i,17]=1;
  }
  if((train[i,5]>=82) & (train[i,5]<=163))
  {
    train[i,17]=2;
  }
  if((train[i,5]>=164) & (train[i,5]<=245))
  {
    train[i,17]=3;
  }
  if((train[i,5]>=246) & (train[i,5]<=327))
  {
    train[i,17]=4;
  }
  if((train[i,5]>=328) & (train[i,5]<=404))
  {
    train[i,17]=5;
  }
}
fix(train)
#comments2
summary(train$comment)
for (i in 1:nrow(train))
{
  if((train[i,6]>=0) & (train[i,6]<=105))
  {
    train[i,18]=1;
  }
  if((train[i,6]>=106) & (train[i,6]<=211))
  {
    train[i,18]=2;
  }
  if((train[i,6]>=212) & (train[i,6]<=317))
  {
    train[i,18]=3;
  }
  if((train[i,6]>=318) & (train[i,5]<=423))
  {
    train[i,18]=4;
  }
  if((train[i,6]>=424) & (train[i,6]<=525))
  {
    train[i,18]=5;
  }
}
colnames(train)[14]="views2"
colnames(train)[15]="duration2"
colnames(train)[16]="likes2"
colnames(train)[17]="dislikes2"
colnames(train)[18]="comment2"
for(i in 14:18)
{
  train[,i]=factor(train[,i],levels=c(1,2,3,4,5))
}
str(train)
train$category=factor(train$category)
save(train,file="train.RDS")
library(randomForest)
fit=randomForest(adview~views2+duration2+likes2+dislikes2+comment2,data=train)
fit
summary(fit)

pred=predict(fit,data=train)
pred
s=varImpPlot(fit)

fit2=DAAG::cv.lm(adview~views2+duration2+likes2+dislikes2+comment2,data=train)
summary(fit2)
pred2=predict(fit,newdata=test)
pred3=predict(fit,newdata=train)
pred2
cbind(train$adview,pred3)
