#1.read text-book
#2. trying to get start
a = 2
b = 3
C.fun <- function(a, b) {
  c = a + b
}
install.packages("RODBC")
library("RODBC")
(.packages)
(.packages())
setwd("./ha")
#set my working directory
getwd()#get my working directory

#read .txt files, header=T means that the firstline is a headline
#need \n at the end of a .txt file
read.table("data.txt",header = T)
#try to read a .csv file, for .xls, change it into a .csv
read.table("en.csv",header = F)
#another way to read .csv
read.csv('en.csv')

#4.vector
#different kind of vectors
#c()is a f(x), dont consider it as sth changable
x<-c(1,2,3,4,5,6,7,8)
x
mode(x)
y <- c(TRUE,FALSE,TRUE,FALSE)
mode(y)
x <- c("a","b","c")
mode(x)
s <- 2+8i
mode(s)
#to create a numeric vector using c()
x <- c(1,2,3,4)
x <- 1:4
x
#to create a numeric vector using rep()
y <- rep(1:15, times=1)
y
#to create a numeric vector using seq()
seq(from=1, to=22, by=3)
#to create a 'characteral' vector using paste()
s <- paste(c("X","Y"), 1:22,sep='')
s
#to calculate using vectors
x <- c(1,2,3,4)
y = x+2
y
#^ %%ȡ�� %/%ȡ��
q <- x%%2
q
w <- x%/%2
w
#logical calculation factors <,>,=, <=, >=, ==, !=, &, |, &&, ||, xor
e <- x > 2
e
a <- c(1, 0, 0, 0, 1)
b <- c(0, 0, 1, 1, 1)
a&&b#these two only cal. the 1st member of a and b
a||b
a&b#these two cal. all members
a|b# when changed the vectors ahead, run it first to active it

#to find the max, min, which.max()(to show the location of the max one), which.min()
c <- c(2, 4, 8, 12, 21)
d <- max(c)
d
min(c)
diff(c)
weighted.mean(c, c(2,3,3,2,3))
rank(c)
median(c)
quantile(c)
any(c>10)

#ways to compare two vectors
setdiff(x = 1:6, y = 3:9) #find item in x which is diff. from items in y
identical(x=1:3, y=2:7)
x <- 1:4
y <- 3:6
all.equal(x,y)
#to combine two vectors
rbind(x,y)
cbind(x,z)
#to cal. items in vector
sum(x)
cumsum(x)
#to describe a vector
length(x)
range(x)
o <- c(1.33, 2.65, 5.45, 4.99)
round(o)
i <- o*100
i
signif(i, 2)
