#Cargar dataset----

#Guardar dataset en variable nueva
df_CO2 <- CO2


#Prueba de ANOVA----
aov(data = df_CO2, )

#Observar las concentraciones
table(df_CO2$conc)

#Realizar ANOVA
res.aov <- aov(uptake ~ as.factor(conc), data = CO2)

#Obtener p-value
summary(res.aov)

#Prueba post-hoc de Tukey HSD----
TukeyHSD(res.aov)

#Prueba t-test----
t.test(CO2)



