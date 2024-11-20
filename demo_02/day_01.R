df <- read.csv(file.choose(), header = T)

plot(df$income, df$consumption, main="Scatterplot")

cor(df$income, df$consumption) #Pearson's correlation

help(lm) # to see the description

mod <- lm(df$consumption ~ df$income) # lm(dependent var [y] ~ independent var) [x]

summary(mod)

attributes(mod) # To see the attributes of the model and extract if necessary

abline(mod, col='red', lwd=3) # to see the regression line

confint(mod) #To see the confidence interval 95 - 99% or whatever

confint(mod, level=0.95) #To change the confidence interval
