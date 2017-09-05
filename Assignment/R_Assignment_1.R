#Q1
marks_Q1 <- rep(c(10,20,30,10,40,50),c(3,5,2,2,4,4))
marks_Q1
table(marks_Q1)
cbind(table(marks_Q1))
mean(marks_Q1)

#Q2_part1
marks_Q2 <- c(10,12,13,14,17)
marks_Q2
mean_Q2_1 <- mean(marks_Q2)
mean_Q2_1
obs=paste("Obs",1:5,sep='-')
obs
barplot(marks_Q2,xlab='Observations', ylab='Marks',names.arg = obs)

#Q2_part2
no_of_students <- c(5,7,9,8,4)
no_of_students
freq_obs_Q2 <- marks_Q2*no_of_students
freq_obs_Q2
sum(freq_obs_Q2)
sum(no_of_students)
mean_Q2_2 <- sum(freq_obs_Q2)/sum(no_of_students)
mean_Q2_2
barplot(no_of_students,names.arg = marks_Q2,xlab='Marks',ylab='No. of students')
#text = (x=bb,y = students....., )

#Q2_part3
marks_lowerlimit <- c(10,20,30,40)
marks_lowerlimit
marks_upperlimit <- c(20,30,40,50)
marks_upperlimit
marks_midpoint <- (marks_upperlimit+marks_lowerlimit)/2
marks_midpoint
no_of_students_Q2_3 <- c(5,7,9,8)
no_of_students_Q2_3
freq_obs_Q2_3 <- marks_midpoint*no_of_students_Q2_3
freq_obs_Q2_3
mean_Q2_3 <- sum(freq_obs_Q2_3)/sum(no_of_students_Q2_3)
mean_Q2_3
x_lab <- paste(marks_lowerlimit,marks_upperlimit,sep='-')
x_lab
barplot(no_of_students_Q2_3,names.arg = x_lab,xlab='Marks',ylab='No. of students')


#Q3

marks_Q3 <- c(12,63,61,63,87,65,1,24,67,52,70,55,29,93,30,84,29,27,19,
           24,32,31,16,4,22,82,53,92,84,5,46,27,31,51,19,76,21,26,
           100,81,56,65,32,63,33,51,68,49,25,77)
marks_Q3
range(marks_Q3)
breaks <- seq(0,100,by=10)
breaks
marks_Q3.cut <- cut(marks_Q3,breaks,include.lowest = FALSE, right=TRUE)
marks_Q3.cut
marks_Q3.table <- table(marks_Q3.cut)
marks_Q3.table
cbind(marks_Q3.table)


