# EXPLORACION DE DATOS
names(trabajadores)
plot(trabajadores$salario_actual~trabajadores$salario_inicial)

# Paso 1
## Saber si existe una correlación lineal
cor.test(trabajadores$salario_actual, trabajadores$salario_inicial)
## output 0.88


modelo1 <- lm(salario_actual~salario_inicial, data = trabajadores) # generar el modelo
summary(modelo1) # paso 2,3,4

# Paso 2
## output
# p-value: < 2.2e-16 -> es mucho menor al alfa 0.05

# Paso3 
## output
# Adjusted R-squared:  0.7741

# Paso 4
## output
# Coefficients:
#                   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)       1.928e+03  8.887e+02    2.17   0.0305 *  
#   salario_inicial 1.909e+00  4.741e-02   40.28   <2e-16 ***

# paso 5
modelo1$coefficients
## output
# (Intercept) salario_inicial 
# 1928.20576         1.90945 

# construir la ecuacion
1928.20 + (1.90 * 2100) # ejemplo de predicion para un salario inicial de 2100
## output salario actual: 2918.2

plot(trabajadores$salario_actual~trabajadores$salario_inicial) + abline(modelo1, col="red")
