##Pinter-Wollman Day 2 Plotting and Statistics Exercise ChickWeight
ChickWeight
ChickWeight=ChickWeight
class(ChickWeight$weight)
class(ChickWeight$Time)
class(ChickWeight$Chick)
class(ChickWeight$Diet)
data <- ChickWeight
data <- within (data, {
  Chick <- factor(Chick)
  Diet <- factor(Diet)
  Time <- factor(Time)
})


#Example 1
data.t0 <- data[data$Time==0,]
#Naming this dataset, all rows where time=0 to be data.t0
windows()
boxplot(weight~Diet, data=ChickWeight.t0, xlab= "Diet Type", ylab= "Weight", main= "Weight of Chicks vs. Diet Treatments- Initial, Day 0", 
        las=1,
        cex.lab= 1.5)

anova.t0 <-aov(weight~Diet, data=data.t0)
summary(anova.t0)
#weight by diet on day 0 is not significant, p=0.346
TukeyHSD(anova.t0)


#Example 2
data.t21 <- data[data$Time==21,]
windows()
boxplot(weight~Diet, data= data.t21, xlab= "Diet Type", ylab= "Weight", main= "Weight of Chicks vs. Diet Treatments- Final, Day 21", 
        las=1,
        cex.lab= 1.5)
anova.t21 <- aov(weight~Diet, data=data.t21)
summary(anova.t21)
#weight by diet on day 21 is significant, p=0.00686 - 0.686% chance that these events occured by chance
TukeyHSD(anova.t21)


#Example 3
summary(aov(weight~Diet*Time+Error(Chick),data=data))
#There is an effect of Diet on Chick Weight over time (Growth), p=0.000799
# ~ identifies "diet" as the independent variable 


#Example 4
windows()
plot(as.numeric(ChickWeight$Time), ChickWeight$weight, pch=20)
#plot weight of chicks as time passes, with each diet type being a different color

cols= sub('1', "cyan", ChickWeight$Diet)
cols= sub('2', "chartreuse", cols)
cols= sub('3', "gold", cols)
cols= sub('4', "hotpink", cols)
#define colors for each diet type
#cols2 <- c("cyan", "chartreuse", "gold", "hotpink")[unclass(data$Diet)] would be an alternative way

plot(as.numeric(ChickWeight$Time), ChickWeight$weight,
     xlab= "Time", ylab= "Weight", main= "Effect of Diet on Chick Weight over Time",
     col=cols,
     pch= 20, las= 1, cex.lab= 1.5)

legend("topleft", title="Diet Treatment", legend=unique(ChickWeight$Diet), text.col=c("cyan", "chartreuse", "gold", "hotpink"), pch=20, col=c("cyan", "chartreuse", "gold", "hotpink"))

#alternatively
windows()
cols2 <- c("cyan", "chartreuse", "gold", "hotpink")[unclass(ChickWeight$Diet)] 
plot(as.numeric(ChickWeight$Time), ChickWeight$weight,
     main= "Effect of Diet on Chick Weight over Time", xlab= "Time", ylab="Weight",
     col=cols2,
     pch=20, las=1, cex.lab=1.5)
legend("topleft", title="Diet Treatment", legend=unique(ChickWeight$Diet), text.col=c("cyan", "chartreuse", "gold", "hotpink"), pch=20, col=c("cyan", "chartreuse", "gold", "hotpink"))


#Example 5
windows()
plot(NA, ylim=c(0,370), xlim=c(0,21),
     xlab="Time", ylab="Weight", main="Individual Chick Growth over Time")

colors=rainbow(50)

for(n in 1:50){
  use.rows=which(ChickWeight$Chick==n)
  lines(x=ChickWeight$Time[use.rows],
        y=ChickWeight$weight[use.rows],col=colors[n])
}


