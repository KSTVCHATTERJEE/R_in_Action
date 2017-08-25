#2 coys ; Each coy has 3 depts ; Each dept has 4 salesmen
company <- c('coy1', 'coy2')
department <- c('dept1','dept2','dept3')
salesman <- c('salesman1','salesman2','salesman3','salesman4')
company;department;salesman
set.seed(1234)
sales <- ceiling(runif(2*3*4,50,100))
sales
mean(sales)
cat(sales)
sales;length(sales)
salesarray <- array(sales,c(4,3,2),list(salesman,department,company))
salesarray
?array
colnames(salesarray)
rownames(salesarray)
dimnames(salesarray)
dimnames(salesarray)[[3]]
length(salesarray)
nrow(salesarray)
ncol(salesarray)
dim(salesarray)
class(salesarray)
salesarray[3,2,1]
salesarray[1,1,1]
salesarray[1,,]
salesarray[,,1]
apply(salesarray,c(1),sum)
apply(salesarray,c(2),sum)
apply(salesarray,c(3),sum)
apply(salesarray,c(1,2,3),length)
