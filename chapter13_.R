#任务13 绘制散点图和直方图
#plot(x,y,...)
#read file
setwd('./myR')
p <- read.csv('p2p_lending.csv', header = T)
#draw plot
plot(p$月还本息, p$总还款本息, main = '月还本息和总还款本息的散点图')
library(ggplot2)
qplot(月还本息, 总还款本息, data = p, main = '月还本息和总还款本息的散点图')
#ggplot 先建图层，然后在图层上作图
ggplot(p, aes(月还本息, 总还款本息)) + geom_point()

plot(p$月还本息, p$总还款本息, main = '月还本息和总还款本息的散点图', pch=24, cex=2, col='blue', bg='yellow')

plot(p$月还本息, p$总还款本息, main = '月还本息和总还款本息的散点图', col.axis='red', col.lab='blue', col.main='blue', fg='red', cex.main=2, 
     xlab='月还本息', ylab='总还款本息')

plot(p$月还本息, p$总还款本息, xlab='', ylab='')
#title只是添加坐标轴标签，所以应设置横纵坐标轴标签为空
title(main = '月还本息和总还款本息的散点图', xlab = '月还本息', ylab = '总还款本息')
text(1000, 1000, 'important')
#text是在任意位置添加文本，需要注明位置

mtext('text', side = 1, line = 2)
#添加文本，side决定哪一边，1，2，3，4分别对应下左上右， line决定文本到图形边框的距离，越大离边框越远

#legend直观展示不同类数据的关系
#将月还本息和总还款本息按男女分类
x1 <- p$月还本息[p$性别 == '男']
y1 <- p$月还本息[p$性别 == '女']
x2 <- p$总还款本息[p$性别 == '男']
y2 <- p$总还款本息[p$性别 == '女']
plot(x1, x2, bg = 5, pch = 21, xlab = '', ylab = '')
points(y1, y2, bg = 6, pch = 21)
title(main = '月还本息和总还款本息的散点图', xlab = '月还本息', ylab = '总还款本息')
legend('topleft', legend = c('男', '女'), col = c(5,6), pch = 21)

#qplot改变点的形状颜色大小
library(graphics)
a <- qplot(月还本息, 总还款本息, main = '月还本息与总还款本息的散点图', colour = I('blue'), shape = I('5'), size = I(2), data = p)
a

qplot(月还本息, 总还款本息, main = '月还本息与总还款本息的散点图', shape = 性别, colour = 性别, data = p)

#修改文本属性， ggplot2中无法直接用text和title等函数，需要增加图层进行修改，更改图形点的颜色大小标题坐标轴标题颜色等
ggplot(p, aes(月还本息, 总还款本息, shape = 性别, colour = 性别)) + geo_point() + labs(title = '月还本息与总还款本息的散点图') +theme(plot.title = element_text(size = 20, colour = 'blue'), axis.title.x = element_text(size = 20, colour = 'blue'))

#ggplot散点图美化
#透明化处理，alpha参数设置
library(ggplot2)
ggplot(p, aes(月还本息, 总还款本息)) + geom_point(alpha = 1/10)

#使用像素级散点图
ggplot(p, aes(月还本息, 总还款本息)) + geom_point(shape = '.')

install.packages('ggthemes')
library(ggthemes)
ggplot(p, aes(月还本息, 总还款本息)) + geom_point(aes(colour = 性别)) + ggtitle('月还本息与总还款本息的散点图') + theme_economist(base_size = 14) + scale_color_economist() + guides(color = guide_legend(title = NULL))

#外观的东西，回头再搞吧。。。

#拟合数据的走势线
ggplot(p, aes(月还本息, 总还款本息)) + geom_point(aes(colour = 性别)) + ggtitle('月还本息与总还款本息的散点图') + theme_wsj(base_size = 14, color = 'brown') + scale_color_wsj('dem_rep','') + guides(size = guide_legend(title = NULL), colour = guide_legend(title = NULL)) + geom_smooth(method = 'lm')

#直方图
hist(p$总还款本息, breaks = 'sturges', freq = TRUE, main = '总还款本息直方图', xlab = '总还款本息', ylab = '频数')

qplot(总还款本息, geom = 'histogram', main = '总还款本息直方图', xlab = '总还款本息', ylab = '频数', binwidth = 500, data = p)

#不同函数的直方图参数设置
hist(p$总还款本息, breaaks = 'Sturges', frq = T, main = '总还款本息直方图', xlab = '总还款本息', ylab = '频数', col = 'green', col.axis = 'yellow', col.main = 'blue', col.lab = 'red')

#ggplot的图形属性修改
qplot(总还款本息, geom = 'histogram', main = '总还款本息直方图', xlab = '总还款本息', ylab = '频数', binwidth = 500, fill = 性别, data = p) + theme(plot.title = element_text(colour = 'blue',size = 14))  + theme(axis.title.x = element_text(colour = 'red'))+ theme(axis.title.y = element_text(colour = 'yellow'))

#饼图和箱线图
library(readxl)
len <- c(sum(p$性别 == '男'), sum(p$性别 == '女'))
#构造性别向量
#画出饼图
pie(len, lables = c('男', '女'), main = 'whatever')

#par()和参数控制图形大小尺寸边界等
opar <- par(no.readonly = T)#复制当前文档的图形参数设置，改变图形设置之后可以复原
par(pin = c(4, 4), mai - c(0.1, 0.1, 0.1, 0.1))#宽高4，边界长度0.1英寸
pie(len, labels = c('男', '女'), main = 'whatever2')
par(opar)

#add text and titles 坐标 + 文本
text(0,0, labels = 'haha')
text(1,1, labels = 'data from p')

#一页多图
par(mfrow = c(1,2))
#一页面设置为一行两列
len1 <- c(sum(p$性别=='男'), sum(p$性别 == '女'))
#构造性别向量
len2 <- c(sum(p$担保 == '是'), sum(p$担保 == '否'))
#构造担保属性向量
pie(len1, labels = c('男', '女'), main = '性别比例')
pie(len2, labels = c('担保', '无担保'), main = '担保属性比例')


#极坐标和玫瑰图