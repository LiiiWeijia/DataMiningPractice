# 建立数据文件
xb=c(1,1,1,1,1,1,0,0,0,0,0,0)
lf=c(1,1,1,0,0,0,1,1,1,0,0,0)
lx=c(1,2,3,1,2,3,1,2,3,1,2,3)
ps=c(16,5,6,6,7,19,5,2,7,1,0,10)
table<-data.frame(xb,lf,lx,ps)  #合并成表格

#载入MASS程序包，使用函数polr需要载入MASS包
#logistic回归模型中回归系数的最大似然估计及模型拟合检验可以采用统计软件R语言中的polr函数
install.packages("MASS")    #安装MASS程序包
library("MASS")       #载入MASS程序包

#logistic回归分析
fit<-polr(as.ordered(lx)~xb+lf,weight=ps,Hess=T,data=table) #polr见下方解释，更为详尽的polr介绍见附件文档
# MASS包，polr函数，可以做定序Logistic回归。 
#model1=polr(as.factor(y)~x1+x2+x3,method='losigtic',Hess=T)
#as.ordered(lx)~~xb+lf  为预测回归模型表达式
#weight=ps 指以ps为衡量指标参数，一般默认为1
#Hess=T 说明应当返回Hessian（观察到的信息矩阵）的逻辑，并打算在拟合上调用summary或vcov函数。
#data指可选的数据框为table（上述合并的表格），用于解释公式中出现的变量。
summary(fit)  #输出回归系数


#模拟拟合检验
fit1<-polr(as.ordered(lx)~1,weight=ps,data=table)  #统计量模型1
fit2<-polr(as.ordered(lx)~xb+lf,weight=ps,data=table)    #统计量模型2
anova(fit1,fit2)   #检验统计量为上述两个模型deviance之差
