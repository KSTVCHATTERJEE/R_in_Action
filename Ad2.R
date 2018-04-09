ad_org_test=read.csv("F:/R_in_Action/Vidooly/ad_org_test.csv",stringsAsFactors = FALSE)
ad_org_test
colSums(is.na(ad_org_test))

for (i in 1:nrow(ad_org_test)){
  for(j in 2:5){
    if(ad_org_test[i,j]=='F'){
      ad_org_test[i,j]=NA;
    }
  }
}
str(ad_org_test)
for (k in 2:5){
  ad_org_test[,k]=as.numeric(ad_org_test[,k])
}

ad_org_test$views[is.na(ad_org_test$views)]=median(ad_org_test$views,na.rm=T)
ad_org_test$likes[is.na(ad_org_test$likes)]=median(ad_org_test$likes,na.rm=T)
ad_org_test$dislikes[is.na(ad_org_test$dislikes)]=median(ad_org_test$dislikes,na.rm=T)
ad_org_test$comment[is.na(ad_org_test$comment)]=median(ad_org_test$comment,na.rm=T)

for (i in 1:nrow(ad_org_test))
{
  if((grepl('H',ad_org_test$duration[i])==TRUE) & (grepl('M',ad_org_test$duration[i])==TRUE) & (grepl('S',ad_org_test$duration[i])==TRUE))
  {
    ad_org_test$hour[i]=substr(ad_org_test$duration[i],regexpr('T',ad_org_test$duration[i])+1,regexpr('H',ad_org_test$duration[i])-1);
    ad_org_test$min[i]=substr(ad_org_test$duration[i],regexpr('H',ad_org_test$duration[i])+1,regexpr('M',ad_org_test$duration[i])-1);
    ad_org_test$sec[i]=substr(ad_org_test$duration[i],regexpr('M',ad_org_test$duration[i])+1,regexpr('S',ad_org_test$duration[i])-1);
  }
  
  else if((grepl('H',ad_org_test$duration[i])==FALSE) & (grepl('M',ad_org_test$duration[i])==TRUE) & (grepl('S',ad_org_test$duration[i])==TRUE))
  {
    ad_org_test$hour[i]=0;
    ad_org_test$min[i]=substr(ad_org_test$duration[i],regexpr('T',ad_org_test$duration[i])+1,regexpr('M',ad_org_test$duration[i])-1);
    ad_org_test$sec[i]=substr(ad_org_test$duration[i],regexpr('M',ad_org_test$duration[i])+1,regexpr('S',ad_org_test$duration[i])-1);
  }
  else if((grepl('H',ad_org_test$duration[i])==FALSE) & (grepl('M',ad_org_test$duration[i])==FALSE) & (grepl('S',ad_org_test$duration[i])==TRUE))
  {
    ad_org_test$hour[i]=0;
    ad_org_test$min[i]=0;
    ad_org_test$sec[i]=substr(ad_org_test$duration[i],regexpr('T',ad_org_test$duration[i])+1,regexpr('S',ad_org_test$duration[i])-1);
  }
  else if((grepl('H',ad_org_test$duration[i])==TRUE) & (grepl('M',ad_org_test$duration[i])==TRUE) & (grepl('S',ad_org_test$duration[i])==FALSE))
  {
    ad_org_test$hour[i]=substr(ad_org_test$duration[i],regexpr('T',ad_org_test$duration[i])+1,regexpr('H',ad_org_test$duration[i])-1);
    ad_org_test$min[i]=substr(ad_org_test$duration[i],regexpr('H',ad_org_test$duration[i])+1,regexpr('M',ad_org_test$duration[i])-1);
    ad_org_test$sec[i]=0;
  }
  else if((grepl('H',ad_org_test$duration[i])==TRUE) & (grepl('M',ad_org_test$duration[i])==FALSE) & (grepl('S',ad_org_test$duration[i])==FALSE))
  {
    ad_org_test$hour[i]=substr(ad_org_test$duration[i],regexpr('T',ad_org_test$duration[i])+1,regexpr('H',ad_org_test$duration[i])-1);
    ad_org_test$min[i]=0;
    ad_org_test$sec[i]=0;
  }
  else if((grepl('H',ad_org_test$duration[i])==FALSE) & (grepl('M',ad_org_test$duration[i])==TRUE) & (grepl('S',ad_org_test$duration[i])==FALSE))
  {
    ad_org_test$hour[i]=0;
    ad_org_test$min[i]=substr(ad_org_test$duration[i],regexpr('T',ad_org_test$duration[i])+1,regexpr('M',ad_org_test$duration[i])-1);
    ad_org_test$sec[i]=0;
  }
  else if((grepl('H',ad_org_test$duration[i])==TRUE) & (grepl('M',ad_org_test$duration[i])==FALSE) & (grepl('S',ad_org_test$duration[i])==TRUE))
  {
    ad_org_test$hour[i]=substr(ad_org_test$duration[i],regexpr('T',ad_org_test$duration[i])+1,regexpr('H',ad_org_test$duration[i])-1);
    ad_org_test$min[i]=0;
    ad_org_test$sec[i]=substr(ad_org_test$duration[i],regexpr('H',ad_org_test$duration[i])+1,regexpr('S',ad_org_test$duration[i])-1);
  }
}
head(ad_org_test)

for (j in 9:11){
  ad_org_test[,j]=as.numeric(ad_org_test[,j])
}
ad_org_test$durationnew=(ad_org_test$hour*3600)+(ad_org_test$min*60)+(ad_org_test$sec)
str(ad_org_test)

ad_org_test$category=as.factor(ad_org_test$category)

test=ad_org_test
fix(test)
str(test)
boxplot(test$views)
boxplot(test$likes)
boxplot(test$dislikes)
boxplot(test$comment)
boxplot(test$durationnew)
str(test)
V=c(2,3,4,5,12)
for(j in V)
{
  out1=(quantile(test[,j],0.25))-(1.5*IQR(test[,j]))
  out2=(quantile(test[,j],0.75))+(1.5*IQR(test[,j]))
  for (i in 1:nrow(test))
  {
    if((test[i,j]<out1) | (test[i,j]>out2))
    {
      test[i,j]=median(test[,j])
    }
  }
}

boxplot(test$views)
boxplot(test$likes)
boxplot(test$dislikes)
boxplot(test$comment)
boxplot(test$durationnew)

str(test)
for (i in c(3,4,5,6,13))
{
  test[,i]=as.integer(test[,i])
}

colSums(is.na(test))
test$category=as.factor(test$category)

#views2
summary(test$views)
for (i in 1:nrow(test))
{
  if((test[i,2]>=27) & (test[i,2]<=287495))
  {
    test[i,13]=1;
  }
  if((test[i,2]>=287496) & (test[i,2]<=574964))
  {
    test[i,13]=2;
  }
  if((test[i,2]>=574965) & (test[i,2]<=862433))
  {
    test[i,13]=3;
  }
  if((test[i,2]>=862434) & (test[i,2]<=1149902))
  {
    test[i,13]=4;
  }
  if((test[i,2]>=1149903) & (test[i,2]<=1437368))
  {
    test[i,13]=5;
  }
}
test$V13
#duration2
summary(test$durationnew)
for (i in 1:nrow(test))
{
  if((test[i,12]>=5) & (test[i,12]<=302))
  {
    test[i,14]=1;
  }
  if((test[i,12]>=303) & (test[i,12]<=599))
  {
    test[i,14]=2;
  }
  if((test[i,12]>=600) & (test[i,12]<=897))
  {
    test[i,14]=3;
  }
  if((test[i,12]>=898) & (test[i,12]<=1195))
  {
    test[i,14]=4;
  }
  if((test[i,12]>=1196) & (test[i,12]<=1486))
  {
    test[i,14]=5;
  }
}
str(test)

#likes2
summary(test$likes)
for (i in 1:nrow(test))
{
  if((test[i,3]>=0) & (test[i,3]<=896))
  {
    test[i,15]=1;
  }
  if((test[i,3]>=897) & (test[i,3]<=1793))
  {
    test[i,15]=2;
  }
  if((test[i,3]>=1794) & (test[i,3]<=2690))
  {
    test[i,15]=3;
  }
  if((test[i,3]>=2691) & (test[i,3]<=3587))
  {
    test[i,15]=4;
  }
  if((test[i,3]>=3588) & (test[i,3]<=4478))
  {
    test[i,15]=5;
  }
}
#dislikes2
summary(test$dislikes)
for (i in 1:nrow(test))
{
  if((test[i,4]>=0) & (test[i,4]<=80))
  {
    test[i,16]=1;
  }
  if((test[i,4]>=81) & (test[i,4]<=161))
  {
    test[i,16]=2;
  }
  if((test[i,4]>=162) & (test[i,4]<=242))
  {
    test[i,16]=3;
  }
  if((test[i,4]>=243) & (test[i,4]<=323))
  {
    test[i,16]=4;
  }
  if((test[i,4]>=324) & (test[i,4]<=402))
  {
    test[i,16]=5;
  }
}
fix(test)
#comments2
summary(test$comment)
for (i in 1:nrow(test))
{
  if((test[i,5]>=0) & (test[i,5]<=109))
  {
    test[i,17]=1;
  }
  if((test[i,5]>=110) & (test[i,5]<=219))
  {
    test[i,17]=2;
  }
  if((test[i,5]>=220) & (test[i,5]<=329))
  {
    test[i,17]=3;
  }
  if((test[i,5]>=330) & (test[i,5]<=439))
  {
    test[i,17]=4;
  }
  if((test[i,5]>=440) & (test[i,5]<=545))
  {
    test[i,17]=5;
  }
}
colnames(test)[13]="views2"
colnames(test)[14]="duration2"
colnames(test)[15]="likes2"
colnames(test)[16]="dislikes2"
colnames(test)[17]="comment2"
for(i in 13:17)
{
  test[,i]=factor(test[,i],levels=c(1,2,3,4,5))
}
save(test,file="test.RDS")

colSums(is.na(test))
test$dislikes2
test$dislikes
summary(test$dislikes)
