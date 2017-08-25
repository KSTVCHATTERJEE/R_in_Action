x=matrix(1:12,nrow=4,byrow=T)#new matrix made, elements added row-wise
x
x[2,2]#(2,2)th element of x
x[,c(1,2)]#prints elemnts of all rows with 1st and 2nd column
x[c(1,4),2]#prints 1st & 4th row with 2nd column
class(x)#prints class of xdim(x)#dimensions of x
x[-2,-3]#removes elements of 2nd row and 3rd column
colnames(x)=c("sub1","sub2","sub3")#changes column names to sub1, sub2 & sub3
x
rownames(x)=paste("R",1:4,sep='')#changes row names to R1-R4
x
x[5]#prints 5th element of x whle counting column-wise
m=c(20,30,40,50)
cbind(x,m)#joins a new column to the existing matrix
m2=c(10,20,30)
rbind(x,m2)#joins a new row to the existing matrix
t(x)#transpose of x
z=c(x)#Deconstruct : convert matrix to vector
z
x[,2]>5#checks whetehr elements of all rows and 2nd column is greater than 5
x[x[,2]]>5#same as above
