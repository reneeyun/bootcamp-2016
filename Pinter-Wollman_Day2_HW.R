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
boxplot(weight~Diet, data=data.t0, xlab= "Diet Type", ylab= "Weight", main= "Weight of Chicks vs. Diet Treatments- Initial, Day 0", las=1)
anova.t0 <-aov(weight~Diet, data=data.t0)
summary(anova.t0)
#weight by diet on day 0 is not significant, p=0.346
TukeyHSD(anova.t0)


#Example 2
data.t21 <- data[data$Time==21,]
windows()
boxplot(weight~Diet, data= data.t21, xlab= "Diet Type", ylab= "Weight", main= "Weight of Chicks vs. Diet Treatments- Final, Day 21", las=1)
anova.t21 <- aov(weight~Diet, data=data.t21)
summary(anova.t21)
#weight by diet on day 21 is significant, p=0.00686 - 0.686% chance that these events occured by chance
TukeyHSD(anova.t21)


#Example 3
summary(aov(weight~Diet*Time+Error(Chick),data=data))
#There is an effect of Diet on Chick Weight over time (Growth), p=0.000799
# ~ identifies "diet" as the independent variable 