m1 <- matrix(1:16,nrow=4)
m1
for(i in 1:nrow(m1)){
  print(paste0('Mean of row ',i,' is ',mean(m1[i,])))
  print(paste0('Mean of col ',i,' is ',mean(m1[,i])))
}
rowMeans(m1)
colMeans(m1)

addmargins(m1,c(1,2),FUN=mean)

apply(m1,1,mean)
apply(m1,2,mean)

a1 <- array(1:24,dim=c(3,4,2))
a1

apply(a1,1,sum)
apply(a1,2,sum)
apply(a1,3,sum)
apply(a1,c(1,2),sum)
apply(a1,c(2,3),sum)
apply(a1,c(1,2,3),sum)
apply(a1,c(1,3),sum)


(l1 <- list(a=1,b=1:3,c=10:100))
lapply(l1,FUN=length)
lapply(l1,FUN=sum)

sapply(l1,FUN=sum)

#lapply gives the output in list form
#sapply gives the output in vector form

sapply(1:5,function(x) rnorm(3,x)) #rnorm(3,x)is the func body of function(X)

sapply(1:5,function(x) matrix(x,2,2))

Q2 <- mapply(rep,1:4,4)
Q2

mapply(function(x,y) x^y,x=c(2,4),y=c(3,2))
mapply(function(x,y) {x^y},x=c(a=2,b=4),y=c(A=3,B=2))

mapply(function(x,y) x^y,x=c(2:10),y=c(3:5))

mapply(function(x,y,z,k){(x+k)^(y+z)},x=c(a=2,b=3),y=c(A=3,B=4),z=c(1,1),k=c(2,2))
#MoreArgs(list(1,2))