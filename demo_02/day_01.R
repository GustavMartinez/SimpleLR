df <- read.csv(file.choose(), header = T) #import data

attach(df) #attach the dataframe

plot(income, consumption, main="Scatterplot") #scatterplot graph

cor(income, consumption) #Pearson's correlation

help(lm) # to see the description

mod <- lm(consumption ~ income, data=df) # lm(dependent var [y] ~ independent var) [x], lm == linear model

summary(mod)

attributes(mod) # To see the attributes of the model and extract if necessary. Example:

mod$coefficients #See the coefficients

abline(mod, col='red', lwd=3) # to see the regression line

confint(mod) #To see the confidence interval 95 - 99% or whatever

confint(mod, level=0.95) #To change the confidence interval

new_values <- data.frame(income = c(150,130,125)) # Valores x para predecir

point_predictions <- predict(mod, newdata = new_values) # Crear las predicciones con el modelo y los nuevos datos
print(point_predictions)

#Predicciones con intervalos de confianza
prediction_with_ci <- predict(mod, newdata = new_values, interval = "confidence", level=0.95)

print(prediction_with_ci)

plot(df$income, df$consumption, 
     main = "Scatterplot", 
     xlim = range(c(df$income, new_values$income)), 
     ylim = range(c(df$consumption, point_predictions)))


points(new_values$income, point_predictions, col='blue', pch=16, cex=1.5)



# SUPUESTOS


### 1. Linealidad

residual.values <- residuals(mod)
predicted.values <- fitted(mod)

plot(predicted.values, residual.values,
     xlab="Predicted values",
     ylab="Residuals")
abline(h=0, col='red')


### 2. Normalidad de los residuos

resid <- resid(mod)
qqnorm(resid)
qqline(resid)


### 3. Homocedasticidad

plot(predicted.values, abs(residual.values),
     xlab = "Predicted values",
     ylab = "Absolute Residuals",
     main = "Homoscedasticity check")
abline(h = 0, col = "blue")


### 4. Independencia de los residuos (Durbin-Watson test)

library(lmtest)
dwtest(mod)  # Verifica el resultado estadístico


