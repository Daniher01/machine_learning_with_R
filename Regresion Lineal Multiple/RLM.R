names(trabajadores)

# tener idea de los tipos de datos de las variables
attach(trabajadores)
str(salario_inicial)
str(salario_actual)
str(educ)

plot(salario_actual, educ)

# paso1 -> existe correlacion de variables
cor.test(salario_actual, educ)
## output
# cor -> 0.66
### Existe una correlacion entre las variabes

modelo2 <- lm(salario_actual~salario_inicial + educ)
summary(modelo2)

# paso2 -> ¿el modelo es valido?
## p-value -> menor a 0.05
## si  -> se rechaza la hipotesis nula

#paso3 -> ¿que tanto explica nuestro modelo?
## Adjusted R-squared:  0.7915
## el 79.15% de la variabilidad actual es predicha con el modelo teniendo en cuenta esas 2 variables

# paso4 -> 

#¿las variables predictoras aportan al modelo?
## el p-value de ambos modelos es menor a 0.05
## se rechaza la hipotesis nula a ambas variables y que aportan al modelo

#¿cuales son los coeficientes?
modelo2$coefficients
# intercepto = -7808.71
# coeficiente salario_inicial = 1.67
# coeficiente educ = 1020

# EJEMPLO
-7808.71 + (1.67*2100) + (1020*8)
# output 3858.29


