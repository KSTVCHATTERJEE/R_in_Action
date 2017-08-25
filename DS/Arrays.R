#2 coys (companies) ; Each coy has 3 depts(departments) ; Each dept has 4 salesmen
company <- c('coy1', 'coy2')#company vector
department <- c('dept1','dept2','dept3')# department vector
salesman <- c('salesman1','salesman2','salesman3','salesman4')#salesman vector
company;department;salesman#shows all vectors together
set.seed(1234)#step to get a specific set of records
sales <- ceiling(runif(2*3*4,50,100))
#2*3*4 = 24 random values from uniform dist ranging from 50 to 100
#ceiling() rounds a number to next higher digit
#e.g. ceiling(3.2) = 4
sales#prints sales vector
mean(sales)#mean of sales
cat(sales)#removes line tag e.g. [1]
sales;length(sales)#prints sales and its length together
salesarray <- array(sales,c(4,3,2),list(salesman,department,company))
#a 3D array of coy,dept and sales
salesarray
?array
colnames(salesarray)#column names = dept1, dept2, dept3
rownames(salesarray)#row names = salesman1-salesman4
dimnames(salesarray)#dimension names = coy1, coy2
dimnames(salesarray)[[3]]#prints dimensions in order of outer to inner shell
length(salesarray)#length of array
nrow(salesarray)#number of rows of array
ncol(salesarray)#number of columns of array
dim(salesarray)#dimensions of array
class(salesarray)#prints the class of array i.e. 'array'
salesarray[3,2,1]#value corresponding to salesman3, dept2, coy1
salesarray[1,1,1]#value corresponding to salesman1, dept1, coy1
salesarray[1,,]#value corresponding to salesman1, all dept, all coys
salesarray[,,1]#value corresponding to all salesmen, all dept, coy1
apply(salesarray,c(1),sum)#sum of all salesman rows separately (whole array)
apply(salesarray,c(2),sum)#sum of all dept cols separately (whole array)
apply(salesarray,c(3),sum)#sum of all coy dims separately (whole array)
apply(salesarray,c(1,2,3),length)
#length corresponding to each salesman, dept and coy
