#Q1

qtr <- c('Q1','Q2','Q3','Q4') # quarters 
qtr
sales <- c(10000,13000,12000,15000)# sales
sales
df <- data.frame(qtr,sales, stringsAsFactors = F) # suitable data structure for the given data
df
#we will be using barplot for the given data
barplot(df$sales,names.arg=df$qtr,
        xlab='quarters',ylab='sales',main='Sales of Coy',sub='For each quarter')
df$qtr[df$sales>11000] # returns the quarters for which sales > 11000
df$sales[df$qtr=='Q3'] # returns the sales of quarter 3

#Q2

attendance <- factor(sample(c('A','P'), size=30, replace=T, prob = c(0.3,0.7))) #sample data is created
attendance
table(attendance)

#Q3

set.seed(1000)
data <- runif(50,30,100) # random data from uniform dist is created 
data
scores <- ceiling(matrix(data,nrow=10,byrow=T)) #data stored in matrix form
scores
colnames(scores) <- c(paste('P',1:5,sep='-'))
rownames(scores) <- c(paste('M',1:10,sep='-'))
scores
ceiling(colMeans(scores,1*5)) #Player-wise averages
ceiling(rowMeans(scores,1*10)) #Match-wise averages


#Q4

guests <- c('Achal','Apoorva','Lalit','Goldie') #'guests' vector
course <- c('BSc','LLB','MSc') #'course' vector
school <- c('Animation','Law','Data Science') #'school' vector
nos <- c(50,20,24) #'nos' vector
male <- c(25,10,12) #'male' vector
female <- c(25,10,12) #'female' vector
hosts <- data.frame(course,school,nos,male,female) #'nos', 'male', 'female' fused to 'hosts' dataframe
guests;hosts
amts <- c(100,300,400,500,230,500,200,150,400,700) #'amts' vector
bills <- matrix(amts,nrow=2,byrow=T) #'bills' matrix
rownames(bills) <- c('Food','Decorations')
colnames(bills) <- c(paste('B',1:5,sep='-'))
bills #matrix modified with lables 'Food', 'Decorations' and bill nos.
freshers <- list(guests=guests,hosts=hosts,bills=bills) #'freshers' list is created
freshers
rowSums(freshers$bills,1:2) #sum of 'Food' and 'Decorations'
males_among_hosts <- freshers$hosts$male
males_among_hosts #no. of males in each school/course
females_among_hosts <- freshers$hosts$female
females_among_hosts #no. of females in each schol/course
no_of_guests <- length(freshers$guests)
no_of_guests #no. of guests

#Q5

School <- c('DS', 'Law')
Courses <- c('Graduate', 'PG', 'Diploma')
Student <- c('S1','S2','S3','S4','S5')
set.seed(1234)
Scholarship <- ceiling(runif(30,1000,2000))
scharray <- array(Scholarship,c(5,3,2),list(Student,Courses,School))
scharray
str(scharray)
#Student 5th student of ds-pg course"
scharray[5,2,1]
#Student 1st sudent of law-dip course
scharray[1,3,2] 
#Average of all scholarship of students
#: School vs Course
ceiling(apply(scharray,c(2,3),mean))
#studentwise sum
apply(scharray,c(1),sum)
#Average of Student vs Courses
ceiling(apply(scharray,c(1,2),mean))
#coursewise sum
apply(scharray,c(2),sum)
#schoolwise sum
apply(scharray,c(3),sum)

#Q6

Students <- c('S1', 'S2', 'S3', 'S4', 'S5') #'Students' vector
Gender <- c('M', 'F', 'M', 'M', 'F') #'Gender' vector
Age <- c(23, 22, 21, 25, 22) #'Age' vector
City <- c('Delhi', 'Noida', 'Lucknow', 'Delhi', 'Noida') #'City' vector
Cat <- c('Gen', 'OBC', 'Gen', 'SCST', 'Gen') #'Cat' vector
Students;Gender;Age;City;Cat
stinfo <- data.frame(Students,Gender,Age,City,Cat) #data frame is created
stinfo
table(stinfo$Cat) #No. of students category-wise
table(stinfo$Gender) #No. of students gender-wise
stinfo$Students <- factor(
  c('Student1','Student2','Student3','Student4','Student5'))
stinfo #'Students'column changed