state.x77
str(state.x77)
class(state.x77)
head(state.x77)
states = as.data.frame(state.x77[,c('Murder','Population','Illiteracy','Income','Frost')])
fit1 = lm(Murder ~ Population+Illiteracy+Income+Frost,data=states)
fit2 = lm(Murder ~ Population + Illiteracy, data=states)
fit1
fit2
summary(fit1)
anova(fit2,fit1)
str(states)
str(state.x77)
state.x77
