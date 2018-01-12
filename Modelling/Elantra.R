dataset2 <- read.csv(file.choose())
dataset2
str(dataset2)
training_set=dataset2[which(dataset2$Year==2010 | dataset2$Year==2011 | dataset2$Year==2012),]
training_set
test_set=dataset2[which(dataset2$Year==2013 | dataset2$Year==2014),]
test_set
nrow(training_set)

#Q1 - 36

Model9 <- lm(ElantraSales~Unemployment+CPI_energy+CPI_all+Queries,data=training_set)
summary(Model9)

#Q2 - 0.4282

Model10 <- lm(ElantraSales~Month+Year+Unemployment+Queries+CPI_energy+CPI_all,data=training_set)
summary(Model10)
Model10

Model11 <- lm(ElantraSales~Month+Year+Queries+CPI_energy+CPI_all,data=training_set)
summary(Model11)

Model12 <- lm(ElantraSales~Month+Year+Queries+CPI_all,data=training_set)
summary(Model12)

Model13 <- lm(ElantraSales~Month+Year+Queries,data=training_set)
summary(Model13)

Model14 <- lm(ElantraSales~Year+Queries,data=training_set)
summary(Model14)

Model15 <- lm(ElantraSales~Unemployment+Queries+CPI_energy+CPI_all,data=training_set)
summary(Model15)

Model16 <- lm(ElantraSales~Month+Unemployment+CPI_all+CPI_energy+Queries,data=training_set)
summary(Model16)

#Q5 - 0.4344

training_set$Month <- factor(training_set$Month)
str(training_set)

Model16 <- lm(ElantraSales~Month+Unemployment+CPI_all+CPI_energy+Queries,data=training_set)
summary(Model16)

#Q6 - 0.8193

training_set$Year <- factor(training_set$Year)
str(training_set)

Model18 <- lm(ElantraSales~Month+Year+Unemployment+Queries+CPI_energy+CPI_all,data=training_set)
summary(Model18)
