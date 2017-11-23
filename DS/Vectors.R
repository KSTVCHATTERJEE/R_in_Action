vec1=c(1,4,6,8,10)#a vector
vec1
vec2=c(1:100)#a vector printing all natural numbers from 1 to 100
vec2
vec3=c(vec1,0,vec2)#concatenating vec1, vec2 and 0
vec3
vec1[5]#5th element of vec1
vec1[3]#3rd element of vec1
vec1[3]=12#replaces the 3rd value of vec1 by 12
vec1
vec4=seq(from=0,to=1,by=0.25)#sequence of 0 to 1 in steps of 0.25
vec4
vec5=1/vec1# adding vec1 and vec5
vec5
vec6=vec1+vec5
vec6
length(vec6)#length of vec6
vec1[vec1>2]#will print those elemets which are greater than 2
vector("numeric",5)#will create a blank numeric vector
u=c(10,20,30)
v=c(1,2,3,4,5,6,7,8,9)
u+v#recycling
u[-3]#will remove 3rd element of u
u[10]#will come NA 
s=c("aa","bb","cc","dd","ee")
L=c(FALSE,TRUE,FALSE,TRUE,FALSE)
s[L]#will return those elements corresponfing to which L is TRUE
vec1[L]#Same as above
v=c("Mary","Sue")#character vector
v
names(v)=c("First","Last")#indexing of v
v
v["First"]
v[c("Last","First")]  
x1=c("first"=3,"second"=0,"third"=9)#indexing of numeric vector
x1
names(x1)
x1["second"]
x1[c("first","third")]
x2="Kaustav"
substr(x2,1,3)#prints 1st to 3rd elements of x2
vec2
vec2 <- NULL#deletes a vector
vec2
sort(vec1)#ascending order
sort(vec1,decreasing=TRUE)#descending order
vec1
order(vec1)#order of sorted elements
vec3
vec1[c(1,2,3)]
vec1[order(vec1)]
v2=seq(1,100,2)#1 to 100 in steps of 2
v2
v3=rep(2,5)#prints 2 5 times
v3
v4=rep[c(1,2,3),3]# prints the sequence 1,2,3 thrice
x5=c(1:3)
x5
y5=rep(x5,3)
y5
y6=rep(x5,c(1,2,3))# 1 once, 2 twice, 3 thrice
y6
v8=paste(1:3,3:5,sep="&")#prints 1&3, 2&4, 3&5
v8
v10=paste("Student",1:10,sep="-")#prints STudent-1, Student-2, etc.
v10
