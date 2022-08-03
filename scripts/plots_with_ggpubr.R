#Paqueterías----
library(ggplot2)
library(ggpubr)

#Scatterplot con ggpubr----
ggscatter(data = iris, 
          x = "Petal.Length", 
          y = "Petal.Width",
          color = "Species",
          palette = "jco",
          shape = "Species",
          add = "reg.line",
          conf.int = TRUE,
          size = 1.6, 
          xlab = "Longitud del pétalo (cm)",
          ylab = "Ancho del pétalo (cm)") +
  stat_cor(aes(color = Species), method = "pearson") +
  coord_cartesian(xlim = c(1,7)) +
  scale_x_continuous(breaks = seq(1,7,1.3))
            
#Guardar gráfico
ggsave(filename = "PLOTS/ggplot_RCS.png", device = "png",
       width = 6, height = 3.5, units = "in", dpi = 450)

#Es posible realizar el mismo procedimiento con ggplot2,
#sin embargo, dicho procedimiento implica realizar paso a
#paso la estadística. A continuación se muestra

#Realizar regresión de los datos

#Extraer los datos de cada especie y guardarlos 
#en una variable nueva
df_setosa <- iris[iris$Species == "setosa",]
df_versicolor <- iris[iris$Species == "versicolor",]
df_virginica <- iris[iris$Species == "virginica",]

#Obtener coeficiente de correlación de Pearson
t1 <- cor.test(x = df_setosa$Petal.Length, y = df_setosa$Petal.Width, 
         method = "pearson")
t2 <- cor.test(x = df_versicolor$Petal.Length, y = df_versicolor$Petal.Width, 
         method = "pearson")
t3 <- cor.test(x = df_virginica$Petal.Length, y = df_virginica$Petal.Width)

#Construir gráfico
ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, 
                        color = Species, shape = Species)) +
  geom_point(size = 1.6) +
  geom_smooth(method = "lm") +
  theme_classic() +
  labs(x = "Longitud del pétalo (cm)", 
       y = "Ancho del pétalo (cm)") +
  theme(axis.title = element_text(size = 14),
        axis.text = element_text(size = 12)) +
  coord_cartesian(xlim = c(1,7)) +
  scale_x_continuous(breaks = seq(1,7,1.3)) +
  #Agregar coeficientes
  annotate(geom = "text", x = 2, y = 2.25, 
           label = paste("p = ", round(t1[[3]], digits = 3))) +
  annotate(geom = "text", x = 2.13, y = 2.10, 
           label = paste("p = ", signif(t2[[3]], digits = 2))) +
  annotate(geom = "text", x = 2, y = 1.95, 
           label = paste("p = ", round(t3[[3]], digits = 3)))
  

#Boxplot con ggpubr----
ggboxplot(data = CO2, 
          x = "conc", 
          y = "uptake", 
          fill = "conc",
          palette = "PuBu",
          add = "jitter",
          xlab = expression(paste("CO"[2], " (mL/L)")),
          ylab = expression(paste("CO"[2]," (", mu, "mol/m"^2, ")"))) +
  stat_compare_means() +
  coord_cartesian(ylim = c(10, 45)) +
  scale_y_continuous(breaks = seq(10, 45, 5)) +
  rremove("legend")

#Guardar gráfico
ggsave(filename = "PLOTS/ggplot_RCS.png", device = "png",
       width = 6, height = 3.5, units = "in", dpi = 450)


#Boxplot con comparaciones entre concentraciones
ggboxplot(data = CO2, 
          x = "conc", 
          y = "uptake", 
          fill = "conc",
          palette = "PuBu",
          add = "jitter",
          xlab = expression(paste("CO"[2], " (mL/L)")),
          ylab = expression(paste("CO"[2]," (", mu, "mol/m"^2, ")"))) +
  stat_compare_means(label = "p.signif", method = "t.test", ref.group = 1) + 
  stat_compare_means(method = "anova", label.y = 50) +
  coord_cartesian(ylim = c(10, 50)) +
  scale_y_continuous(breaks = seq(10, 50, 5)) +
  rremove("legend")

#Guardar gráfico
ggsave(filename = "PLOTS/ggplot_RCS.png", device = "png",
       width = 6, height = 3.5, units = "in", dpi = 450)


#Boxplot seleccionando las comparaciones
my_comparison <- list(c("95","175"), 
                      c("500","1000"), 
                      c("250","500"))

#Boxplot con comparaciones entre concentraciones
ggboxplot(data = CO2, 
          x = "conc", 
          y = "uptake", 
          fill = "conc",
          palette = "PuBu",
          add = "jitter",
          xlab = expression(paste("CO"[2], " (mL/L)")),
          ylab = expression(paste("CO"[2]," (", mu, "mol/m"^2, ")"))) +
  stat_compare_means(comparisons = my_comparison) +
  stat_compare_means(label.y = 60) +
  coord_cartesian(ylim = c(10, 60)) +
  scale_y_continuous(breaks = seq(10, 60, 5)) +
  rremove("legend")

#Guardar gráfico
ggsave(filename = "PLOTS/ggplot_RCS.png", device = "png",
       width = 6, height = 3.5, units = "in", dpi = 450)
