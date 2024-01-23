#### Construir el modelo
data = trabajadores
formula = data$salario_actual~data$salario_inicial + data$experiencia + data$antiguedad
modelo3 <- lm(formula)
summary(modelo3)


#### SUPUESTOS

################################################################## 1- Linealidad
# H0: No existe una correlacion lineal
# H1: Existe una correlacion lineal

# Gráfico
plot(modelo3, 1)
# evaluar para cada variable independiente
cor.test(data$salario_actual, data$salario_inicial) # cumple con el suspuesto
cor.test(data$salario_actual, data$experiencia) # no cumple con el supuesto
cor.test(data$salario_actual, data$antiguedad) # no cumple con el supuesto

###################################################### 2- Normalidad de residuos
# H0: estos residuos cuentan con una distribucion normal
# H1: estos residuos NO cuentan con una distribucion normal

# Gráfico
plot(modelo3,2)
# Test de normalidad
shapiro.test(modelo3$residuals) 
## Los residuos no cuentan con una distribucion normal


########################################################### 3- Homocedastisidad
# H0: el modelo es homocedastico
# H1: el modelo NO es homocedastico, es hetedocedastico

# gráfico
plot(modelo3, 3)
# segun el grafico,  modelo NO es homocedastico

# Test BP
library(car)
ncvTest(modelo3)
# segun el test, el modelo no es homocedastico

############################################## 4- Ausencia de multicolinealidad
# H0: las variables independientes estan muy correlacionadas
# H1: las variables indpenedientes no estan correlacionadas

library(DescTools)
VIF(modelo3)

######################################## 5- Identifiacion de valores influyentes
# H0: es valor influyente
# H1: no es valor influyente

# grafico
plot(modelo3,4)
plot(modelo3,5)
# a nivel de grafico no hay valores influyentes

# Calcular distancia de Cook
modelo3$cook <- cooks.distance(modelo3)
which(modelo3$cook>1)
# ningun valor es influyente segun la distancia de cook

