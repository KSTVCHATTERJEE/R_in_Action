tweets=read.csv("F:/R_in_Action/MS2.csv",header=FALSE,stringsAsFactors = FALSE)
tweets

fix(tweets)
colnames(tweets)[1]="Info"
colnames(tweets)[2]="Text"
colnames(tweets)[3]="Sentiment"

library(tm)
corpus <- Corpus(VectorSource(tweets$Text))
corpus$content
str(corpus)
corpus$content[1]
library(SnowballC)
library(wordcloud)
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, stemDocument)
corpus <- tm_map(corpus, removeWords,stopwords("english"))
rmlist = c("paytm","paytmmall","paytmcare","https.*","daniell","wyatt",
           "scorecard.*","t20i","england","indveng","@.*","paytmcar","women","vijayshekhar",
           "4X6","6X6")
corpus <- tm_map(corpus, removeWords,rmlist)

corpus[[1]]$meta

corpus[1]$content

wordcloud(corpus)
dtm = DocumentTermMatrix(corpus,control=list(weighting=weightTfIdf, minWordLength=2, minDocFreq=5))
dim(dtm)
(sparse <- removeSparseTerms(dtm, 0.99))
as.matrix(sparse)

pos=scan("F:/R_in_Action/positive-words.txt",what='character')
neg=scan("F:/R_in_Action/negative-words.txt",what='character')

sentcalc=vector(mode='numeric',length=102)
v=c('bewar','servic','charg','solv','updat','receiv','recharg','respons','issu','balanc',
    'provid','suprem','complet','updat')
for(i in 1:102)
{
tweet=corpus$content[i]
library(stringr)
wordlist=str_split(tweet,'\\s+')
word=unlist(wordlist)
for(i in length(word))
{
if((word[i] == v[1]) | (word[i] == v[2]) | (word[i] == v[3]) | (word[i] == v[4]) | 
   (word[i] == v[5])|(word[i] == v[6])|(word[i] == v[7])|(word[i] == v[8])|(word[i] == v[9])|
   (word[i] == v[10])|(word[i] == v[11])|(word[i] == v[12])|(word[i] == v[13])|(word[i] == v[14]))

{
word[i]=paste0(word[i],'e')
}
}
posmatches=match(word,pos)
negmatches=match(word,neg)
posmatches=!is.na(posmatches)
negmatches=!is.na(negmatches)
score=sum(posmatches)-sum(negmatches)
print(score)
sentcalc[i]=score
}
sentcalc
sent2=vector(mode='character',length=102)
for(j in 1:102)
{
if(sentcalc[j]==1)
{
sent2[j]='Positive'
}
else if(sentcalc[j]==-1)
{
sent2[j]='Negative'
}
else
{
sent2[j]='Neutral'  
}
}
sent2
sentiment=data.frame(cbind(tweets$Text,tweets$Sentiment,sent2))
sentiment
table(tweets$Sentiment,sent2)
