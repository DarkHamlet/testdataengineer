#############################################
###           Test Capitaria              ###
###             Base Servel               ###
###              2020-03-23               ###
###             Hamlet Muñoz              ###
#############################################

# Base del Servel: https://www.servel.cl/padron-electoral-por-nacionalidad-y-region-elecciones-abril-2021/

# Erase memory
rm(list=ls())

# Set work directory
setwd("C:\\Trabajo\\Applies\\Capitaria\\")

# Naming file
file = "C:\\Trabajo\\Applies\\Capitaria\\PADRON_DEF_2021_MUNGORE.csv"; file

# Load
df <- read.delim2(file, header = TRUE, sep = ";")

# Ver dimensiones
dim(df)
head(df)
str(df)

# 1) ¿Cuántos registros hay en Rancagua?
install.packages('dplyr')
library("dplyr")

df1 <- df %>% 
  filter(Comuna=="Rancagua") %>% 
  count(Comuna, sort = FALSE)
df1  # 194.487 registros son de Rancagua
#View(df1)

# 2) ¿Cuántos registros hay en Chillán? (en reg está sin tilde)
df2 <- df %>% 
  filter(Comuna=="Chillan") %>% 
  count(Comuna, sort = FALSE)
df2 # 152.723 registros son de Chillán.

# 3) ¿Cuánta gente en Chile aparece en el registro con edad mayor a cien años?
df3 <- df %>% 
  filter(Edad>100) %>% 
  count(Edad, sort = FALSE)
sum(df3$n) # 48.146 registros de personas con edad mayor a 100 años.

# 4) ¿Cuál es la distribución de registros de personas mayores a cien años?
install.packages('ggplot2')
library("ggplot2")
df4 <- df %>%  
  filter(Edad>100) %>%
  select(Edad)
ggplot(df4, aes(x=Edad)) + 
geom_histogram(binwidth=1, bins=100) +
ggtitle("Histograma Edad>100") +
theme(plot.title = element_text(size=15))

# 5) ¿Dónde vive la persona más longeva del registro?

df5 <- df %>% 
  filter(Edad==max(df4)) %>% 
  select(Comuna)
  #filter(Comuna, sort = FALSE)
df5 # La persona más lóngeva vive en la comuna de Freire

## Listo

