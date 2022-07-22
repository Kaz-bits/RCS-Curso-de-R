#Paqueterías----
library(ggplot2)

#Transformaciones estadísticas----

##Distribución cumulativa empírica----

ggplot(iris, aes(x = Sepal.width, color = Species)) +
  stat_ecdf(geom = "step", size = 1) +
  scale_x_continuous(breaks = seq(2,4.5,by = 0.1)) +
  scale_y_continuous(breaks = seq(0,1,by = 0.1)) +
  theme_bw()

ggsave(filename = "RC_ecdf.png", device = "png", units = "in",
       width = 10, height = 5, dpi = 600)

##Transformación elíptica----

ggplot(iris, aes(x = Sepal.Width, y = Petal.Width, color = Species)) +
  geom_point() +
  stat_ellipse(type = "t") +
  stat_ellipse(type = "norm", linetype = 2) +
  theme_bw()

ggsave(filename = "RC_eliptical.png", device = "png", units = "in",
       width = 8, height = 4, dpi = 600)

##Sin transformación----
ggplot(iris, aes(x = Sepal.Width, y = Petal.Width, color = Species)) +
  stat_identity() 


##Transformación renctangular y hexagonal----

ggplot(diamonds, aes(x = carat, y = depth, z = price)) +
  stat_summary_2d(fun = function(x) sum(x^2))

ggplot(diamonds, aes(x = carat, y = depth, z = price)) +
  stat_summary_hex(fun = ~ sum(.x^2))


##Conteo de valores----

ggplot(iris, aes(x = Sepal.Width, fill = Species)) +
  stat_count(color = "black") +
  theme_bw() +
  scale_y_continuous(breaks = seq(0,30,by = 4)) +
  scale_x_continuous(breaks = seq(2,4.5,by = 0.25))

ggsave(filename = "RC_countbar.png", device = "png", units = "in",
       width = 8, height = 4, dpi = 600)


##Suma de valores----

ggplot(MCO_flies, aes(x = distance, y = air_time,
                      color = factor(distance))) +
  geom_point() +
  stat_summary(fun = "max", geom = "point", color = "magenta",
               size = 3) +
  theme_bw() +
  scale_x_continuous(breaks = seq(937,950,by = 1))

ggsave(filename = "RC_summarypoint.png", device = "png", units = "in",
       width = 8, height = 4, dpi = 600)


##Suma de valores----

ggplot(MCO_flies, aes(x = distance, y = air_time,
                      color = factor(distance))) +
  geom_point() +
  stat_summary(fun = "mean", geom = "point", color = "magenta",
               size = 3) +
  theme_bw() +
  scale_x_continuous(breaks = seq(937,950,by = 1))

ggsave(filename = "RC_summarypoint.png", device = "png", units = "in",
       width = 8, height = 4, dpi = 600)


##Smooth de valores----

ggplot(iris, aes(x = Sepal.Length, y = Petal.Length,
                 color = Species)) +
  geom_point() +
  stat_smooth(method = "lm") +
  theme_bw()

ggsave(filename = "RC_smoothpoint_loess.png", device = "png", units = "in",
       width = 8, height = 4, dpi = 600)


##Densidad en y----

ggplot(iris, aes(x = Species, y = Sepal.Length,
                 fill = Species)) +
  stat_ydensity() +
  theme_bw()
  

ggsave(filename = "RC_ydensity.png", device = "png", units = "in",
       width = 8, height = 4, dpi = 600)


##Densidad por contorno----

ggplot(faithfuld, aes(x = eruptions, y = waiting, z = density)) +
  stat_contour_filled(bins = 10, color = "black", alpha = 0.5) +
  theme_bw()

ggsave(filename = "RC_contourfilled.png", device = "png", units = "in",
       width = 8, height = 4, dpi = 600)


##Densidad 2D por contorno----

ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) +
  stat_identity(geom = "point") +
  stat_density_2d_filled(alpha = 0.5, color = "black") +
  theme_bw()

ggsave(filename = "RC_contourfilled_2d.png", device = "png", units = "in",
       width = 8, height = 4, dpi = 600)


##Densidad----

ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  stat_density(color = "black", alpha = 0.5) +
  theme_bw()

ggsave(filename = "RC_density.png", device = "png", units = "in",
       width = 8, height = 4, dpi = 600)


##Histograma----

ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(bins = 20, color = "black", size = 1,
                 boundary = 0, binwidth = 0.1) +
  theme_bw()

ggsave(filename = "RC_histogram.png", device = "png", units = "in",
       width = 8, height = 4, dpi = 600)

##Barchart (variable continua)----

ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_bar(color = "black", size = 1) +
  theme_bw()

ggsave(filename = "RC_barchart.png", device = "png", units = "in",
       width = 8, height = 4, dpi = 600)


##Barchart (variable categórica)----

ggplot(MCO_flies, aes(x = origin, fill = origin)) +
  geom_bar(color = "black", width = 0.5) +
  theme_classic()

ggsave(filename = "RC_barchart_categ.png", device = "png", units = "in",
       width = 8, height = 4, dpi = 600)
