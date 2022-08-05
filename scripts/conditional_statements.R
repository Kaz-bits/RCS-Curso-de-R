#Paqueterías----
library(ggplot2)
library(RColorBrewer)


#Condicional if----

#Ejemplo con una variable
x <- 2
if (x < 0) {
  print("Es un número negativo")
}

#Ejemplo con dos variables
x <- 2
y <- 7
if (x < y) {
  print(paste(y, "Es mayor que ", x))
}

#Condicional if-else----

#Ejemplo de if con una variable
x <- 75
if (x*2 == 150) {
  
  print(paste("Dos veces", x, "es", x*2))
  
}

#Ejemplo de if-else con una variable
x <- 75
if (x*2 > 150) {
  
  print(paste("Dos veces", x, "es", x*2)) 
  
} else {
  
  print("No se cumple la condición")
  
}



#Condicional if-else-if----
x <- 0
if (x < 0) {
  
  print(paste(x, "es un numero negativo")) 
  
} else if (x > 0) {
  
  print(paste(x, "es un numero positivo"))
  
} else {
  
  print(paste(x, "es igual a cero"))
}


#Ciclo for----

#Ejemplo 1
for (i in c(1, 2, 3, 4, 5)) {
  
  print((i * 5) + 10)
  
}


#Ejemplo 2
for (i in c("Manzana", "Sandía", "Naranja", "Pera")) {
  
  print(paste("La", i, "es una fruta"))
  
}

#Ejemplo con dataset
for (i in names(table(CO2$Plant))) {
  
  a <- CO2[CO2$Plant == i, ]$uptake
  print(mean(a))
  
}


#Programando gráficos----

#Agregar una linea de regresión de acuerdo a los datos
bestfit <- geom_smooth(
  method = "loess", 
  se = FALSE, 
  colour = alpha("steelblue", 0.5), 
  size = 2
)

#Gráfico con datos de iris
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, 
                 group = Species, color = Species)) + 
  geom_point() + 
  bestfit
#Guardar gráfico
ggsave(filename = "PLOTS/ggplot_RCS.png", device = "png",
       width = 5, height = 2.5, units = "in", dpi = 450)

#Gráfico con datos aleatorios
set.seed(123)
x <- rnorm(n = 150, mean = 5.5) 

set.seed(124)
y <- rnorm(n = 150, mean = 3.2) 

#Construir data frame
df <- data.frame(y, x)

#Gráfico con datos aleatorios
ggplot(df, aes(x = x, y = y)) + 
  geom_point() + 
  bestfit

#Guardar gráfico
ggsave(filename = "PLOTS/ggplot_RCS.png", device = "png",
       width = 5, height = 2.5, units = "in", dpi = 450)


#Funciones----
#Crear una función sencilla (un argumento)
mi_funcion <- function(a) {
  (a * 10) + 6
}

#Lammar a la función
mi_funcion(c(1,2))
mi_funcion(TRUE)
mi_funcion(FALSE)

#Funciones en gráficos de regresión
geom_propio <- function(method = "lm", size = 2, ...) {
  
  geom_smooth(
    method = method, 
    se = FALSE, 
    colour = alpha("steelblue", 0.5), 
    size = size
  )
  
}

#Gráfico con datos aleatorios
ggplot(df, aes(x = x, y = y)) + 
  geom_point() + 
  geom_propio(method = "loess", size = 3)

#Guardar gráfico
ggsave(filename = "PLOTS/ggplot_RCS.png", device = "png",
       width = 3, height = 2.5, units = "in", dpi = 450)




#Programar un único gráfico----
#Cargar archivo
ds_salaries <- read.csv(file = "https://raw.githubusercontent.com/Kaz-bits/RCS-Curso-de-R/main/files/ds_salaries.csv",
                        header = TRUE, sep = ",")

#Generar código
salaries <- function() {
  
  #Realizar gráfico
  ggplot(data = data, aes(x = xaxis, y = yaxis)) +
    geom_fav
  
}

#Crear función para dataframe de CO2
plant_co2 <- function(trt, org, show.plot, 
                      box.color = "PuBu") {
  
  #Código del gráfico
  p <- ggplot(data = CO2[CO2$Treatment == trt &
                           CO2$Type == org, ], aes(x = as.factor(conc), y = uptake,
                         group = conc, fill = as.factor(conc))) +
        geom_boxplot(show.legend = FALSE) +
        theme_classic() +
        labs(x = "Concentración incial de CO2", y = "Absorción de CO2") +
        theme(axis.title = element_text(size = 14),
              axis.text = element_text(size = 12)) +
        coord_cartesian(ylim = c(5,50)) +
        scale_y_continuous(breaks = seq(5,50,5)) + 
        scale_fill_brewer(palette = box.color) +
        annotate(geom = "text", x = 4, y = 50, label = trt,
                 size = 5)
  
  #Mostrar gráfico
  if (show.plot == TRUE) {
    
    print(p)
    
  } else {
    
    message("Gráfico realizado con éxito")
    
  }
  
}

#Llamar a la función
plant_co2(trt = "nonchilled", org = "Mississippi", 
          show.plot = TRUE, box.color = "OrRd")




