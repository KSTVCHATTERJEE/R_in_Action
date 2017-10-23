#Assignment - 5 ----
#Handling and Processing Strings in R ----
USArrests #dataset 
head(USArrests)
states=rownames(USArrests)
states
substr(x=states,start=1,stop=4)
states2 = abbreviate(states)
states2
names(states2) = NULL
states2
states2 = abbreviate(states,minlength=5)
states2
state_chars=nchar(states)
state_chars
states[which(state_chars==max(state_chars))]
grep(pattern='k',x=states,value=TRUE)
grep(pattern='w',x=states,value=TRUE)
grep(pattern="[wW]",x=states,value=TRUE)
grep(pattern="w",x=tolower(states),value=TRUE)
grep(pattern="W",x=toupper(states),value=TRUE)
grep(pattern="w",x=states,value=TRUE,ignore.case=TRUE)
hist(nchar(states),main="Histogram",xlab="number of characters in US state names")
#position of a's ----
(positions_a <- gregexpr(pattern="a",text=states,ignore.case=TRUE))
#how many a's ----
(num_a <- sapply(positions_a, function(x) ifelse(x[1] > 0, length(x), 0)))
library(stringr)
str_count(states,"a")
str_count(tolower(states),"a")
#vector of vowels ----
vowels <- c("a","e","i","o","u")
#vector for storing results ----
(num_vowels <- vector(mode="integer", length=5))
for(j in seq_along(vowels)) {
  num_aux <- str_count(tolower(states),vowels[j])
  num_vowels[j] <- sum(num_aux)
}
names(num_vowels) <- vowels
num_vowels
sort(num_vowels,decreasing=TRUE)
#barplot ----
barplot(num_vowels,main="Number of vowels in US states names", border=NA, ylim=c(0,80))


#empty_string
empty_str=""
empty_str
class(empty_str)
empty_chr = character(0)
empty_chr
class(empty_chr)

length(empty_str)
length(empty_chr)

(char_vector = character(5))

example=character(0)
example

length(example)

example[1] = "first"
example

length(example)

example[4] <- "fourth"
example
length(example)

a="test me"
b=8+9
is.character(a)
is.character(b)
class(a)
class(b)
#changing b from numeric to character ----
b=as.character(b)
b

c(1:5,pi,"text")

c(1:5,TRUE,pi,"text",FALSE)

rbind(1:5,letters[1:5])

df1=data.frame(numbers=1:5,letters=letters[1:5])
df1
str(df1)


df2=data.frame(numbers=1:5,letters=letters[1:5],stringsAsFactors = FALSE)
df2

str(df2)

(list(1:5,letters[1:5],rnorm(5)))

abc = "http://www.abc.net.au/local/data/public/stations/abc-local-radio.csv"
radio=read.table(abc,header=TRUE,sep=",",stringsAsFactors=FALSE)
dim(radio)
str(radio,vec.len=1)
