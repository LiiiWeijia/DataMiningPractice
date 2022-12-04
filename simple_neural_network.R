setwd("./chapter28")
install.packages("AMORE")
library(AMORE)#载入包
set.seed(1234)#随机数设置
samp.rate=0.7#设置训练集比例

p2pdata=read.csv("p2p_lending.csv")#读入数据
str(p2pdata)#查看变量类型
p2pdata=p2pdata[,6:19]#筛选数值型变量
p2pdata$周期_月=as.numeric(p2pdata$周期_月)
p2pdata$借款描述字数=as.numeric(p2pdata$借款描述字数)
p2pdata$累积已还次数=as.numeric(p2pdata$累积已还次数)
p2pdata$累积逾期次数=as.numeric(p2pdata$累积逾期次数)
p2pdata$安全标=as.numeric(p2pdata$安全标)
#按照比例抽样
samp.index=sample(1:nrow(p2pdata),size=floor(samp.rate*nrow(p2pdata)))
samp.index
train=p2pdata[samp.index,]#训练集
test=p2pdata[-samp.index,]#测试集
#设置神经网络参数
net=newff(n.neurons = c(13,10,1),learning.rate.global = 0.0001,momentum.global = 0.01,
          error.criterium = "LMS", hidden.layer = "tansig",
          output.layer = "purelin", method="ADAPTgdwm")
#训练模型
model=train(net,train[,-14],train[,14],error.criterium = "LMS",
            report=T,show.step=100,n.show=10)
#对测试集预测
test.predict=sim(model$net,test[,-14])
#通过设置阈值进行分类
test.class=ifelse(test.predict>0.85,1,0)
#生成混淆矩阵
table(test.class,test[,14])
#计算总体正确率
sum(diag(table(test.class,test[,14])))/nrow(test)
#改进步骤
#基本设置
library(AMORE)#载入包
set.seed(1234)#设置随机数
samp.rate=0.7#设置训练集比例

#数据预处理
fun.dummy<- function(data)###哑变量构造函数
{
  name.level=levels(data)
  dummy=c()
  for(i in 1:(length(name.level)-1))
  {
    temp.dummy=ifelse(data==name.level[i],1,0)
    temp.dummy=as.numeric(temp.dummy)
    dummy=cbind(dummy,temp.dummy)
  }
  colnames(dummy)=name.level[1:(length(name.level)-1)]
  dummy=as.data.frame(dummy)
  return(dummy)
}
p2pdata=read.csv("p2p_lending.csv")#导入数据
str(p2pdata)#查看数据类型
#将分类数据转换成哑变量
part.dummy=fun.dummy(p2pdata[,1])
for (i in 2:5)
{
  dummy=fun.dummy(p2pdata[,i])
  part.dummy=cbind(part.dummy,dummy)
}
p2pdata=cbind(part.dummy,p2pdata[,6:19])#将哑变量与数值型数据合并
p2pdata$周期_月=as.numeric(p2pdata$周期_月)
p2pdata$借款描述字数=as.numeric(p2pdata$借款描述字数)
p2pdata$累积已还次数=as.numeric(p2pdata$累积已还次数)
p2pdata$累积逾期次数=as.numeric(p2pdata$累积逾期次数)
p2pdata$安全标=as.numeric(p2pdata$安全标)
#数据归一化
min.vec=apply(p2pdata[,16:28],2,min)
max.vec=apply(p2pdata[,16:28],2,max)
range.vec=max.vec-min.vec
range.vec
std=p2pdata[,16:28]
for(i in 1:ncol(std))
{
  std[,i]=(std[,i]-min.vec[i])/range.vec[i]
}
#得到归一化以后的数据
clean.data=p2pdata
clean.data[,16:28]=std
#查看归一化效果
apply(clean.data,2,max)
#抽样
samp.index=sample(1:nrow(clean.data),size=floor(samp.rate*nrow(clean.data)))
#生成训练集与测试集
train=clean.data[samp.index,]
test=clean.data[-samp.index,]
#BP神经网络的训练和结果评价
net=newff(n.neurons = c(28,10,1),learning.rate.global = 0.0001,momentum.global = 0.01,
          error.criterium = "LMS", hidden.layer = "tansig",
          output.layer = "purelin", method="ADAPTgdwm")
model=train(net,train[,-29],train[,29],error.criterium = "LMS",
            report=T,show.step=100,n.show=10)
test.class=ifelse(test.predict>0.85,1,0)
test.predict=sim(model$net,test[,-29])
table(test.class,test[,29])
sum(diag(table(test.class,test[,29])))/nrow(test)
sum(diag(table(test.class,test[,29])))/nrow(test)