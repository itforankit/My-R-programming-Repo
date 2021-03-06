setwd("C:\\Machine Learning\\datasciencecoursera")
library(swirl)
install_from_swirl("Exploratory Data Analysis")
swirl()
##Lattice Graphs##
head(airquality)
xyplot(Ozone~Wind,data=airquality)
xyplot(Ozone~Wind,data=airquality,col="red",pch=8,main="Big Apple Data")
xyplot(Ozone ~ Wind, data = airquality, pch=8, col="red", main="Big Apple Data")
xyplot(Ozone ~ Wind|as.factor(Month), data = airquality, layout=c(5,1))
xyplot(Ozone ~ Wind|Month, data = airquality, layout=c(5,1))
p<-xyplot(Ozone~Wind,data=airquality)
print(p)
names(p)
p[["formula"]]
p[["x.limits"]]
table(f)
xyplot(y~x|f,layout=c(2,1))
myedit("plot1.R")
source(pathtofile("plot1.R"),local=TRUE)
source(pathtofile("plot2.R"),local=TRUE)
str(diamonds)
table(diamonds$color)
table(diamonds$color,diamonds$cut)
myedit("myLabels.R")
source(pathtofile("myLabels.R"),local=TRUE)
xyplot(price~carat|color*cut, data=diamonds,strip=FALSE,pch=20,xlab=myxlab,ylab = myylab,main=mymain)
xyplot(price~carat|color*cut, data=diamonds,pch=20,xlab=myxlab,ylab = myylab,main=mymain)

## Working with Colors
sample(colors(),10)
pal<-colorRamp(c("red","blue"))
##p7 <- colorRamp("red","blue")  Error
pal(0)
pal(1)
pal(0.5)
pal(seq(0,1,len=6))

p1<-colorRampPalette(c("red","blue"))
p1(2)
p1(6)
0xcc
p2(2)
showMe(p1(20))
showMe(p2(20))
showMe(p2(2))

p3<-colorRampPalette(c("blue","green"),alpha=0.5)
p3(5)

plot(x,y,pch=19,col=rgb(0,0.5,0.5))
plot(x,y,pch=19,col=rgb(0,0.5,0.5,0.3))  ## fourth argument 0.3 is alpha

cols<-brewer.pal(3,"BuGn")
showMe(cols)
pal<-colorRampPalette(cols)
showMe(pal(3))
showMe(pal(20))
image(volcano,col=pal(20))
image(volcano,col=p1(20))


## GGPLOT2 ####
str(mpg)
qplot(displ,hwy,data=mpg)
qplot(displ, hwy, data = mpg, color = drv)
qplot(displ, hwy, data = mpg, color = drv,geom=c("point","smooth"))
qplot(y=hwy,data = mpg, color = drv)
myhigh
qplot(drv, hwy, data = mpg, geom="boxplot")
qplot(drv,hwy,data=mpg,geom="boxplot",color=manufacturer)
qplot(hwy,data = mpg, fill = drv)
qplot(displ, hwy, data = mpg, facets = .~drv)
qplot( hwy, data = mpg, facets = drv ~ ., binwidth = 2)
qplot(displ, hwy, data = mpg, geom=c("point", "smooth"),facets=.~drv)

g <- ggplot(mpg, aes(displ,hwy) )
summary(g)
g+geom_point()
g+geom_point()+geom_smooth()
g+geom_point()+geom_smooth(method = "lm")
g+geom_point()+geom_smooth(method = "lm")+facet_grid(.~drv)
g+geom_point()+geom_smooth(method = "lm")+facet_grid(.~drv)+ggtitle("Swirl Rules!")

g+geom_point(color="pink",size=4,alpha=1/2)
g+geom_point(size=4,alpha=1/2,aes(color=drv))
g+geom_point(aes(color=drv))+labs(title="Swirl Rules!")+labs(x="Displacement")+labs(y="Hwy Mileage")
g + geom_point(aes(color = drv),size=4,alpha=1/2) + geom_smooth(size=4,linetype=3,method="lm",se=FALSE)
g + geom_point(aes(color = drv),size=2,alpha=1/2) + geom_smooth(size=4,linetype=3,method="lm",se=FALSE)
g + geom_point(aes(color = drv))+theme_bw(base_family = "Times")


plot(myx,myy,type="l",ylim = c(-3,3))  ## Base Plot
g <- ggplot(testdat, aes(x = myx, y = myy))
g+geom_line()
g+geom_line()+ylim(-3,3)
g+geom_line()+coord_cartesian(ylim = c(-3,3)) 

g <- ggplot(mpg, aes(x=displ,y=hwy, color=factor(year)) )
g+geom_point()
g+geom_point()+facet_grid(drv~cyl,margins = TRUE)
g+geom_point()+facet_grid(drv~cyl,margins = TRUE)+geom_smooth(method="lm",se=FALSE,size=2,color="black")
g + geom_point() + facet_grid(drv~cyl,margins=TRUE)+geom_smooth(method="lm",size=2,se=FALSE,color="black")
g + geom_point() + facet_grid(drv~cyl,margins=TRUE)+geom_smooth(method="lm",size=2,se=FALSE,color="black")+labs(x="Displacement",y="Highway Mileage",title="Swirl Rules!")

str(diamonds)
qplot(price,data = diamonds)
range(diamonds$price)
qplot(price,data = diamonds,binwidth=18497/30)
brk
counts
qplot(price,data = diamonds,binwidth=18497/30,fill=cut)
qplot(price,data = diamonds,geom="density")
qplot(price,data = diamonds,geom="density",color=cut)
qplot(carat,price,data = diamonds)
qplot(carat,price,data = diamonds,shape=cut)
qplot(carat,price,data = diamonds,color=cut)
qplot(carat,price,data = diamonds,color=cut)+geom_smooth(method="lm")
qplot(carat,price,data = diamonds,color=cut)+geom_smooth(method="lm")+facet_grid(.~cut)
qplot(carat,price,data=diamonds, color=cut, facets=.~cut) + geom_smooth(method="lm")