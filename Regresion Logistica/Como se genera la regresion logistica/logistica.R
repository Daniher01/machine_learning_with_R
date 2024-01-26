######## 0. PROCESAMIENTO
# https://www.kaggle.com/datasets/anupamujawane/career-stats-of-nba-players
library(rio)
data <- import("Data/nba-players.csv")

# importante saber la estructura de nuestra base de datos
names(data)
str(data)
# volver nuestra variable dependiente como factor
data$Target <- as.factor(data$Target)
levels(data$Target) # comprobar que nuestra variable sea 0 y 1

####### 1. CALCULAR EL MODELO
log1 = glm(Target~ GP, data=data, family=binomial)

####### 2. IDENTIFICAR LA ECUACION
#log(p/1-p)= B0 + B1 (X1)
summary(log1)
#log(p/1-p)=-3.24558 + 0.05465 (GP)

####### 3. VER SIGNIFICANCIA DE VARIABLES INDEPENDIENTES
# H1: la variable GP es significativa

####### 4. VER QUE NOS INDICA EL COEFICIENTE
exp(log1$coefficients)
# Odds Ratio de la variable independiente es 1.05617134
# Por cada unidad que aumenta la variable GP 
# el odds de que se presente el evento aumenta 1.05 veces

######## 5. VER LAS PROBABILIDADES
log1$fitted.values # las probabilidades de que se presente el evento (Targe=1) para cada caso del dataset

####### 6. CLASIFICAR EN BASE A LA PROBABILIDAD
# Elige un pnuto de corte. IMPORTANTE!!
# punto de corte 0.5
data$predicho<-as.numeric(log1$fitted.values>=0.5)


####### 7. CUAN EFECTIVO ES EL MODELO DE CLASIFICACIÓN

## MATRIZ DE CONFUSION
#devtools::install_github("topepo/caret")
library(caret)
valores_predichos <- factor(valores_predichos, levels = c(0, 1))
data$Target <- factor(data$Target, levels = c(0, 1))
caret::confusionMatrix(valores_predichos, data$Target, positive = "1")

table(data$Target)
# según matriz de confusion
# Accurracy: 0.68
# Sensibilidad: 0.68

### minuto 15


