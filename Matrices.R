x=matrix(1:12,nrow=4,byrow=T)#new matrix made, elements added row-wise
x
x[2,2]
x[,c(1,2)]
x[c(1,4),2]
class(x)
dim(x)#dimensions of x
x[-2,-3]
colnames(x)=c("sub1","sub2","sub3")
x
rownames(x)=paste("R",1:4,sep='')
x
x[5]
m=c(20,30,40,50)
cbind(x,m)#joins a new column to the existing matrix
m2=c(10,20,30)
rbind(x,m2)#joins a new row to the existing matrix
t(x)#transpose of x
z=c(x)#Deconstruct : convert matrix to vector
z
x[,2]>5
x[x[,2]]>5
