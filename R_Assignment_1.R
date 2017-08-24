#Q1
marks_Q1 <- rep(c(10,20,30,10,40,50),c(3,5,2,4,3,4))
marks_Q1
table(marks_Q1)
cbind(table(marks_Q1))

#Q2_part1
marks_Q2 <- c(10,12,13,14,17)
marks_Q2
mean_Q2_1 <- mean(marks_Q2)
mean_Q2_1

#Q2_part2
no_of_students <- c(5,7,9,8,4)
no_of_students
freq_obs_Q2 <- marks_Q2*no_of_students
freq_obs_Q2
sum(freq_obs_Q2)
sum(no_of_students)
mean_Q2_2 <- sum(freq_obs_Q2)/sum(no_of_students)
mean_Q2_2

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

#Q3

