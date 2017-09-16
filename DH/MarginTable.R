parties1 <- c('bjp','congress','sp','aap')
length(parties1)
states1 <- c('up','delhi','haryana','punjab','uk')
length(states1)
set.seed(1234)
mps=ceiling(runif(20,25,50))
mps
df=data.frame(parties1,states1,mps)
df


table(df$parties1)

#table does not work for data frame
ftable(df)
table(df[,c('parties1','states1')], dnn=list('Political Parties','States of India'))
str(df)
xtabs(mps~states1+parties1,data=df)
statesel = c('up','delhi')
xtabs(mps~parties1 + states1, data=df, subset=states1 %in% statesel)
xtabs(mps~parties1 + states1, data=df, subset=states1 %in% statesel,drop.unused.levels=T)

partysel <- c('bjp')
xtabs(mps~parties1+states1,data=df,subset=parties1 %in% partysel & states1 %in% statesel,drop.unused.levels=T)
ftable(df)
ftable(df$states1,df$parties1,df1$mps)
ftable(parties1~states1,data=df)
matresults <- xtabs(mps~parties1+states1, data=df)
matresults
str(matresults)
margin.table(matresults, margin=NULL)
sum(mps)
margin.table(matresults, margin=1)
margin.table(matresults, margin=2)
margin.table(matresults, margin=3)

round(prop.table(matresults,margin=NULL),2)
(p1 = round(prop.table(matresults, margin=1),2)) 
rowSums(p1)
addmargins(p1,2, sum)
(p2 = round(prop.table(matresults, margin=2),2)) 
rowSums(p2)
colSums(p2)
addmargins(p2,1,sum)

addmargins(p2)
addmargins(p2,1)
addmargins(p2,2)

