#Paqueterías
library(ggplot2)


#Construcción de boxplot----

#Obtener datos
df_CO2 <- CO2

#Construcción con ggplot2
ggplot(df_CO2, aes(x = as.factor(conc), y = uptake, fill = as.factor(conc))) +
  geom_boxplot() +
  theme_classic() +
  labs(x = expression(paste("CO"[2], " (mL/L)")), 
       y = expression(paste("CO"[2]," (", mu, "mol/m"^2, ")")))


#Guardar gráfico
ggsave(filename = "PLOTS/ggplot_RCS.png", device = "png",
       width = 6, height = 3.5, units = "in", dpi = 450)


