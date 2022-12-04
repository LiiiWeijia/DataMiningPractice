#任务5矩阵
#创建矩阵
#直接创建矩阵
matrix1 <- matrix(c(1,2,3,4,5,6), nrow = 2 , ncol = 3)
matrix1
matrix2 <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE)
matrix2
matrix3 <- matrix(c("a", "b", "c", "d", "e", "f"), nrow = 3, ncol = 2)
matrix3
#创建空矩阵后赋值
matrix4 <- matrix(nrow = 3, ncol = 4)
matrix4
matrix4[1,1] <- 1
matrix4[1,2] <- 2
matrix4[1,3] <- 3
matrix4[1,4] <- 3
matrix4[2,1] <- 5
matrix4[2,2] <- 4
matrix4[2,3] <- 9
matrix4[2,4] <- 6
matrix4[3,1] <- 3
matrix4[3,2] <- 3
matrix4[3,3] <- 3
matrix4[3,4] <- 3
matrix4
#矩阵转置
t(matrix2)
t(matrix4)
#行列式计算
matrix5 <- matrix(1:9, nrow = 3)
det(matrix5)
matrix5
matrix6 <- matrix(1:4, nrow = 2)
matrix6
det(matrix6)
#矩阵的乘法
matrix7 <- matrix(1:6, nrow = 2)
matrix8 <- matrix(1:6, ncol = 2)
matrix7%*%matrix8
#矩阵转置的乘法
t(matrix7)%*%t(matrix8)
#矩阵加法
A <- matrix(1:9, ncol = 3)
B <- matrix(10:18, nrow = 3)
A + B
A - B
B - A

#矩阵的逆
O <- matrix(c(1,2,2,1), nrow = 2)
solve(O)

#矩阵元素筛选
matrix9 <- matrix(1:15, nrow = 3)
matrix9
matrix9[2,]#选择第二行数据
matrix9[,3]#选择第三列数据
matrix9[2,4]#选择第二行第四列数据
matrix9[c(2, 3) ,]#选择第二、三行数据
matrix9[, c(3,5)]#选择矩阵第三、五列数据
matrix9[,c(3:5)]#选择矩阵第三到五列数据

#生成协方差矩阵
a <- c(1,2,3,4,5,6)
b <- c(2,3,5,6,1,9)
c <- c(3,5,5,5,10,8)
d <- c(10,20,30,40,50,55)
e <- c(7,8,9,4,6,10)
M <- cbind(a,b,c,d,e)#根据列 合并
M
N <- rbind(a,b,c,d,e)#根据行 合并
N
cov(M)#求协方差矩阵

#增加矩阵的行、列（data.frame用于增加列）
C <- matrix(1:12, nrow = 3, byrow = TRUE)
C
vectorA <- c(13:16)
D <- t(data.frame(t(C), vectorA))#两次转置，增加行
D
vectorB <- c(2,5,8)
E <- data.frame(C, vectorB)#不转置，增加列
E

#删除行、列
F <- D[-1,]#删除第一行
F
G <- D[, -3]#删除第三列
G

#矩阵行、列命名
X <- matrix(1:12, nrow = 3, byrow = TRUE)
colnames(X) <- c('a', 'b', 'c', 'd')
rownames(X) <- c('x', 'y', 'z')
X


#任务6 R的数据结构-列表
#创建列表
#创建一个列表包含小明的性别和年龄
student1 <- list(name = "xiaoming", age = 25)
#查询列表中的成分
student1
#复杂对象实例
studentID <- c(1, 2, 3, 4)
age <- c(20, 22, 20, 21)
gender <- c("F", "M", "M", "F")
hometown <- c('shanghai', 'anhui', 'jiangsu', 'hubei')
#创建一个数据框
studentdata <- data.frame(studentID, age, gender, hometown)
#创建多种数据结构构成的列表
studentdata


g <- 'mylist'
h <- c(1,2,3,4)
y <- matrix(1:10, nrow = 5)
z <- c('low', 'medium', 'high')
mylist <- list(g, h, y, z, studentdata)#创建多种数据结构构成的列表
#访问列表元素
mylist <- list(title = g, h, y, status = z, studentdata)#给列表中的元素命名
#方法1
mylist$title
#方法2
mylist[['status']]
#方法3
mylist[[3]]

#增加或删除列表元素
#增加：在特定位置添加一个新的对象
z <- list(a = 123, b = 'ef')
z$c <- 'ADD'
z#查看列表z的结构
z$b <- NULL#删除第二个元素
z

z <- list(a = 123, b = 'ef', c = '2016ch')
length(z)#获取列表长度

#列表向量和值
names(z)#获取列表z中元素的标签

unlist(z)#获取z中元素的取值

#去除元素标签可以用NULL赋值或是使用unname（）函数
unname(z)#暂时去除
z
z <- list(a = 123, b = 'ef', c = '2016ch')
names(z) <- NULL#永久去除
z
x <- c(list(a = 1, b = 'zzz', c = list(d = 55, e = 6666)), recursive=T)
#递归型列表
x <- c(list(a = 1, b = 'zzz', c = list(d = 55, e = 6666)))
x

#任务7 R的数据结构-数据框
#创建数据框
size <- c(20, 31, 26, 29)
color <- c('red', 'black', 'white', 'blue')
clothes <- data.frame(size, color, stringsAsFactors = FALSE)
clothes
clothes2 <- data.frame(size, color, stringsAsFactors = T)
clothes2
length(clothes)
length(clothes2)
class(clothes$color)
class(clothes2$color)

#访问数据框
setwd('.')
data = read.csv('p2p_lending.csv', stringsAsFactors = F)
data$户籍省份
data[7,4]
data[1:10,4]
data[2,1:5]

names(data)
head(data[,2:5],4)#默认是6行，可以改
tail(data[,1:7])
str(data)
#data用来提取子数据框
data[1:3,1:5]
data[1:3, 5:6, drop=F]#得作为列显示的数据框
data[1:3, 5]
data[which(data$户籍省份=='上海'), 3:7]

#数据框命名
a = c(1,2,3)
b = c(2,3,4)
ab = data.frame(a, b)
ab

colnames(ab) <- c('x1','x2')
rownames(ab) <- c('y1','y2','y3')
ab

#缺失值的处理
w = c(2,3,4,5)
e = c(1,2,3,NA)
r = c(1,NA,4,5)
na = data.frame(w, e, r)
na
is.na(na)

mean(na$e)
mean(na$e,na.rm = T)
#subset处理缺失值，直接忽略缺失值的影响
na[na$e >= 3,]

complete.cases(na)
na1 <- na[complete.cases(na),]
na1

subset(na, e >= 3)

size <- c(20, 31, 26, 29)
color <- c('red', 'black', 'white', 'blue')
clothes <- data.frame(size, color, stringsAsFactors = F)
clothes
rbind(clothes, list(27, 'green'))
style <- c('new', 'old', 'new', 'old')
cbind(clothes, style)

clothes
clothes1 <- data.frame(color, style)
clothes3 <- data.frame(color, style, stringsAsFactors = F)

cc <- merge(clothes, clothes3)
cc

c = c('blue', 'green',  'black','yellow')
style <- c('new', 'new', 'old', 'new')
clothes4 <- data.frame(c, style, stringsAsFactors = F)
merge(clothes, clothes4, by.x = 'color', by.y = 'c')

#apply()函数在数据框中的应用
setwd("./myR")
A = read.csv("p2p_lending.csv", stringsAsFactors = F)
apply(A[, 7:10], 2, mean, na.rm = T)

lapply(A[, 7:10], mean, na.rm = T)#按列输出？

sapply(A[,7:10], mean, na.rm = T)
#正确使用sort函数，可以处理的时vector（向量），列表不行。先把向量改成列表，as.vector(unlist(列表名))
c1 <- lapply(data[1:8, 7], sort)
c1
sort(c1)
list(c1)
v = as.vector(unlist(c1))
v
sort(v)



#任务8 R的数据结构-因子
#普通因子创建
score <- c('B','C','C','A','B','B','B','C','A','C','B','A','A')#这是个向量
score1 <- factor(score)#吧向量作为因子赋值给score1

score2 <- factor(score, levels = c('A','B','C'))#给因子的水平标签
score3 <- factor(score, levels = c('A','B','C'), labels = c('Good', 'Pass', 'Fail'))
score2
score3

#有序因子的创建和标签
score1 <- ordered(score, levels = c('C','B','A'))
score3 <- ordered(score, levels = c('C','B','A'), labels = c('Fail', 'Pass', 'Good'))
score1
score2
score3

#用cut函数生成因子
score <- c(43, 22, 67, 47)
score1 <- cut(score, breaks = c(0, 59, 69, 79, 89, 100))
#吧因子分为breaks规定的几个区间
score2 <- cut(score, breaks = 4)
score1
score2

#用cut函数确定某向量x的每一个元素落在哪个区间内
x <- rnorm(10, 0, 1)
b <- c(-3, -2, -1, 0, 1, 2, 3)
cut(x, b, labels = F)
x

#因子类型的判断
is.factor(score)
x1 <- as.factor(score)
is.factor(x1)
x1

#没规定所有元素的label和level，则剩下的元素输出为NA
#用exclude=c('B')可以排除因子中的某些水平

#因子的常用操作
#table函数
x <- data.frame(class = c('a','a','c','b','c','b','a','b'), score = c('G','G','G','G','E','E','E','E'))
str(x)
table(x$class, x$score)#输出组合的频数
prop.table(table(x$class, x$score), 1)#输出组合的频率，横向的哦

#by函数 厉害了，还没看懂
class <- rbinom(10000, 1, 0.5)
x1 <- c(rep(1, 10000))
x2 <- rnorm(10000)
x <- cbind(x1, x2)
theta.tru <- c(1, 1)
lamda.tru <- exp(x%*%theta.tru)
y <- rpois(10000, lamda.tru)
R <- data.frame(class, x2, y)
by(R, R$class, function(m) lm(m[,2]~m[,3]))
theta.tru
lamda.tru

a <- rpois(10, c(4, 50))
a

#aggregate()函数，参数一是操作目标（数据框或表），参数二是分组依据必须是list，参数三是函数操作
x <- data.frame(list(class = c('a','a','c','b','c','b','a','b'), score1 = c(99, 89, 66, 82, 57, 98, 81, 66), 
                     score2 <- c(88, 34, 87, 45, 66, 93, 55, 23)))
aggregate(x[,-1], list(x$class), mean)
aggregate(x[,-1], list(x$class), max)


#任务9  数据变形
#常见的数据类型：数值型，字符串， 逻辑性，缺失值，复数型等
#数据类型的识别
a <- 3
mode(a)
b <- c('aaa')
mode(b)
c <- c(2, 3, 5, 22)
mode(c)
d <- TRUE
mode(d)
#数据类型的判断
is.character(a)
is.numeric(a)

#数据类型的转换
e <- as.character(a)
e

#reshape2包的使用
library(reshape2)
install.packages("reshape2")
library(reshape2)
stu<- data.frame("stu_id" = 1:6,
                 "name" = c('amy', 'lily', 'rose', 'frank', 'bob', 'dave'),
                 "math" = c(74, 88, 84, 55, 98, 78),
                 "english" = c(45, 63, 77, 37, 85, 99))
stu
stu_list <- melt(stu, id = c('stu_id', 'name'), variable.name = 'class_name', value.name = 'score')
stu_list
warnings()#为什么会有报错警告？？？因为！！！ID用了大写，神奇吧！！？？

acast(stu_list, stu_id~class_name, value.var = "score")
acast(stu_list, name~class_name, value.var = "score")
acast(stu_list, stu_id~ name ~ class_name, value.var = "score")

dcast(stu_list, stu_id + name ~ class_name, value.var = "score")
dcast(stu_list, stu_id ~ class_name, mean, margins = c("stu_id"), value.var = "score")


#任务10
#自定义函数
#示例：fun1 <- function(data, data.frame, graph, limit)
setwd("./myR")
A <- read.csv("p2p_lending.csv")
cum_interest <- function(x){
  cum_interest <- A$累积还款金额 - A$累积借款金额
  cum_interest <- as.data.frame(cum_interest, stringAsFactor = F)
  colnames(cum_interest) <- "累积还款利息"
  x = cbind(x, cum_interest)
  return(x)
}
A <- cum_interest(A)
write.csv(A, file = "p2p_lending1.csv")

#做个，统计担保人数和非担保人数的叭
setwd("./myR")
A <- read.csv("p2p_lending.csv")
guarantee <- function(A){
  is_guarantee <- 0
  not_guarantee <- 0
  n = nrow(A)
  for(i in 1:n){
    if(A$担保[i] == "是")
    {is_guarantee <- is_guarantee + 1}
    else{not_guarantee <- not_guarantee + 1}
  out_put = list(is_guarantee = is_guarantee, not_guarantee = not_guarantee)
    }
return(out_put)
}
count_g = guarantee(A)
count_g

#do.call函数的用法，do.call(fun, list)，把函数fun传递给list，对list里每个元素执行fun
list <- list(matrix(1:9, ncol = 3), matrix(4:12, nrow = 3), matrix(21:29, ncol = 3))
list
list.sum1 <- do.call(sum, list)
list.sum2 <- do.call(cbind, list)
list.sum1
list.sum2

#复杂一点点的do.call的例子
setwd("./myR")
A <- read.csv("p2p_lending.csv")
x1 <- A$标准化借款类型
x2 <- A$项目金额
B <- do.call(data.frame, list(标准化借款 = x1, 项目金额 = x2))
write.csv(B, file = "p2p_lending2.csv")

#条件判断语句
#ifelse()语句练习， 先离散化，再分类计数
setwd("./myR")
A <- read.csv("p2p_lending.csv")
rate_h <- 0
rate_m <- 0
rate_l <- 0
for(i in 1:length(A$收益率)){
  if(A$收益率[i] == 0.3)
    {
    rate_h <- rate_h + 1
  }
  else if(A$收益率[i] == 0.2)
  {rate_m <- rate_m + 1}
  else
  {rate_l <- rate_l + 1}
}
rate_h
rate_m
rate_l

a <- c(2, 4, 5, 5)
a

#switch语句举栗子 有点问题呀！！！！！
setwd("./myR")
A <- read.csv("p2p_lending.csv", stringsAsFactors = F)
where <- c(A$户籍省份)
for(i in where){print(
    switch (i,
            上海 = "魔都",
            北京 = "首都"
    )
  )
}

#while 函数的应用，和if-else差不多的，参见C++，逻辑都是一样的
setwd("./myR")
A <- read.csv("p2p_lending.csv")
low_lev <- 0
high_lev <- 0
middle_lev <- 0
i <- 1
level = c()
while(i <= length(A$项目金额)){
  if(A$项目金额[i] <= 500){
    low_lev <- low_lev +1
  }
  else if(A$项目金额[i] <= 1000){
    middle_lev <- middle_lev + 1
  }
  else{
    high_lev <- high_lev + 1
  }
  i <- i + 1
}
low_lev
high_lev
middle_lev

#next函数
a <- read.csv("p2p_lending.csv", header = T)
high_lev <- 0
for(i in 1: length(a$项目金额)){
  if(a$项目金额[i] <= 1000)
  {
    next
  }
  high_lev <- high_lev +1
}
high_lev


#break函数
high_lev <- 0
i <- 1
repeat{
  if(a$项目金额[i] <= 1000)
#高等消费
  {
    high_lev <- high_lev +1
  }
  if(i>100)
  {
    break
  }
  i <- i+1
    }
high_lev
