#Creando vectores----

#Es posible crear vectores de diferentes formas. Una de
#las m�s utilizadas es con la funci�n c() que significa
#concatenar

c(1,2,3,4,5,6,7,8,9,10) #Vector del 1 al 10
c(1,4,9,10,26) #Vector de longitud 5

#La funci�n c() sirve bastante cuando queremos un 
#orden espec?fico de los elementos del vector, pero 
#podemos usar otras formas, como los dos puntos

1:10 #Vector del 1 al 10
25:30 #Vector del 25 al 30
100:120 #Vector del 100 al 120

#Los dos puntos sirven para generar sucesiones de manera
#continua. Otra forma es con la funci�n seq()

seq(from = 1, to = 10) #Vectro del 1 al 10
seq(from = 25, to = 30) #Vector del 25 al 30
seq(from = 100, to = 120) #Vector del 100 al 120

#Otra alternativa es con la funci�n rep(), que genera
#repeticiones de un vector que especifiquemos

rep(1,5) #Vector de longitud 5 con elementos repetidos
rep(1:3,5) #Vector repetido del 1 al 3 cinco veces
rep(c(1,5,10),3) #Vector que repite el 1, 5 y 10 tres veces

#Es posible emplear otro tipo de argumentos para obtener
#secuencias m�s espec�ficas

rep(c(1,3,8), each = 2) #Vector que repirte cada elemento 
                        #dos veces

rep(c(1,3,8), times = 2) #Vector que repite el 1,3 y 8
                         #dos veces


#Los siguientes inputs generan el mismo output

rep(c(1,3,8), times = 2) #Argumento expl�cito
rep(c(1,3,8), 2) #Argumento impl�cito


#Extrayendo elementos de un vector----

#Podemos extraer elementos dentro de un vector, y para
#ello, podemos hacerlo sin guardar los datos en una
#variable o sin guardarlo.

#Para extraer elementos, se usan los corchetes sencillos
#los cuales son estos []

c(1,2,3,4,5)[1]

#El n�mero en los corchetes es otro vector, que se le 
#puede nombrar como vector de posiciones, porque nos
#indica la posici�n del elemento que queremos extraer

c(1,2,3,4,5)[2]
c(1,2,3,4,5)[3]
c(1,2,3,4,5)[4]
c(1,2,3,4,5)[5]

#Podemos extraer m�s de un elemento. Vamos a extraer
#el n�mero 1 al 3

c(1,2,3,4,5)[1:3]

#Vamos a extraer el n�mero 1, 4 y 5 del vector anterior

c(1,2,3,4,5)[c(1,4,5)]

#Para realizar lo anterior, se debe usar la funci�n
#de concatenar c() porque son posiciones diferentes y no
#son seguidas o continuas

c(1,2,3,4,5)[c(2,5)] #Extraer el elemento 2 y 5


#Poemos guardar el vector del 1 al 5 en una variable y 
#aplicar exactamente lo mismo, solo que ahora se usa el
#nombre de la variable

extr <- c(1,2,3,4,5)

#Se nombr� la variable "extr" con los n�meros del 1 al 5, 
#y para extraer elementos es lo mismo que lo anterior

extr[1]
extr[2]
extr[3]
extr[4]
extr[5]

#Y para extraer m�s de un elemento se realiza algo
#similar

extr[1:3]
extr[c(1,4,5)]
extr[c(2,5)]

#Resumiento: los n�meros dentro de los corchetes son
#vectores, llamados de posici�n, ya que indican la 
#posici�n del elemento a extraer


#Creando data frames----

#Los data frames son estructuras de datos en dos
#dimensiones, tienen renglones y columnas. Para crearlos
#se emplea la funci�n data.frame

df_emp <- data.frame("id_empl" = c(1,2,3,4,5), 
           "name_emp" = c("Ezequiel", "David", "Miranda",
                          "Michelle", "Guillermo"),
           "salary" = c(6000,7800,6900,6750,5580),
           "mascota" = c(TRUE, FALSE, TRUE, TRUE, FALSE))

#Lo anterior genera un data frame de cinco renglones y
#cinco columnas. Para comocer cu�ntas renglones y 
#columnas tiene, se usa la funci�n dim(), pero antes,
#debemos guardar el data frame en un variable

df_emp <- data.frame("id_empl" = c(1,2,3,4,5), 
           "name_emp" = c("Ezequiel", "David", "Miranda",
                          "Michelle", "Guillermo"),
           "salary" = c(6000,7800,6900,6750,5580),
           "mascota" = c(TRUE, FALSE, TRUE, TRUE, FALSE))

#Guardar en otra variable
df_emp_1 <- df_emp

#Las dimensiones del data frame son las siguientes

dim(df_emp) #Primer n�mero renglones y segundo columnas

#Para contar los renglones y las columnas de forma
#individual, se usan nrow() y ncol(), respectivamente

nrow(df_emp) #N�mero de renglones
ncol(df_emp) #N�mero de columnas
length(df_emp)
class(df_emp)

#Extrayendo elementos de un data frame----

#Para ello, se pueden ocupar los corchetes sencillos [] o
#el s�mbolo de d�lar o pesos $, pero cada uno funciona de
#manera diferente

df_emp[1] #Extraer la columna 1
df_emp[2] #Extraer la columna 2 
df_emp[3] #Extraer la columna 5

mean(df_emp[3]) #dataframe
mean(df_emp[,3]) #vector

df_emp[,3] <- df_emp[,3] + 1000


#Lo anterior genera otro data frame. Si queremos extraer 
#elementos �nicos, se debe especificar el rengl�n y la
#columna

df_emp[1,1] #Primer rengl�n y primera columna
df_emp[2,2] #Segundo rengl�n y segunda columna
df_emp[3,3] #Tercer rengl�n y tercera columna
df_emp[1,4] #Primer rengl�n y cuarta columna
df_emp[5,4] #Quinto rengl�n y cuarta columna

#Si queremos extraer toda la columna, se usa com�nmente
#la siguiente sintaxis

df_emp[,1] #Columna 1
df_emp[,2] #Columna 2
df_emp[,3] #Columna 3

#Lo anterior genera un vector (no un data frame), el cual
#corresponde con la columna seleccionada. Ahora, si 
#buscamos todo un rengl�n con todas las columnas, se emplea
#la siguiente sintaxis

df_emp[1,] #Rengl�n 1
df_emp[2,] #Rengl�n 2
df_emp[3,] #Rengl�n 3


df_emp[c(1,2),2]
df_emp[c(1,2),3]
df_emp[c(1,2),c(2,4)]
df_emp[c(1,2),c(2,3,4)]
df_emp[c(1,2),c(4,2,3)]
df_emp[c(3,4),]
df_emp[,c(2,3,4)]

#Lo anterior NO genera un vector, sino que genera otro
#data frame.
#Para extraer toda la columna pero eliminando uno o varios
#renglones, tenemos

df_emp[-1,1] #Columna 1 sin rengl�n 1
df_emp[-c(2),2] #Columan 2 sin rengl�n 2
df_emp[-c(1,5),3] #Columna 3 sin renglones 1 y 5
df_emp[-c(1,3,5),4] #Columna 4 sin renglones 1, 3 y 5

#Lo anterior tambi�n genera un vector. Si queremos el caso
#contrario, donde ahora extraemos los renglones pero
#sin algunas columnas se usa lo siguiente

df_emp[1,-c(1)] #Rengl�n 1 sin columna 1
df_emp[2,-c(2)] #Rengl�n 2 sin columna 2
df_emp[3,-c(1,2)] #Rengl�n 3 sin columnas 1 y 2
df_emp[4,-c(1,3,5)] #rengl�n 4 sin columnas 1, 3, y 5


#Ahora, otra forma de extraer elementos de un data frame
#es con el singo $, solo que este se usa para extraer
#columnas �nicamente

df_emp$id_empl
df_emp$name_emp
df_emp$salary
df_emp$mascota


#A�adiendo elementos a un data frame----

#Podemos a�adir columnas o renglones a un data frame, y
#para ello se usan las funciones cbind() y rbind(), 
#respectivamente. Vamos a a�adir otra columna al data frame
#anterior de tres formas distintas


df_emp$car <- c("CAMRY", "AVALON", "RAV4", "YARIS", "PRIUS")
df_emp$musika <- c("pop", "rock", "reaggeton", "reagge", "indie")

#eliminar columnas
df_emp$m�sica <- NULL
df_emp$salary <- NULL
df_emp[,4] <- NULL
df_emp[,5] <- c("CAMRY", "AVALON", "RAV4", "YARIS", "PRIUS")
df_emp["salary"] <- c(6000,7800,6900,6750,5580)

#cambiar nombres de columnas
names(df_emp)[5] <- "car"

#cambiar orden de columnas
df_emp <- df_emp[,c(1,2,6,5,4)]




#Usando el signo $ 

df_emp$Car <- c("CAMRY", "AVALON", "RAV4", "YARIS", "PRIUS")

#Usando los corchetes simples []

df_emp["Age"] <- c(25,28,26,24,25)

#Usando la funci�n cbind

df_emp <- cbind(df_emp, "birth" = c("13-01-1997",
                                    "25-05-1994",
                                    "17-09-1996",
                                    "15-12-1998",
                                    "06-04-1997"))



#agregar columnas
df_emp <- cbind(df_emp, "birth" = c("13-01-1997","25-05-1994",
                          "17-09-1996","15-12-1998",
                          "06-04-1997"))

#agregar columna nueva
df_emp[,ncol(df_emp) + 1] <- c("Peugeout", "AVALON", "RAV4", "YARIS", "PRIUS")



df_emp <- df_emp[-c(2,5),]
row.names(df_emp) <- 1:4


#De esa forma, podemos a�adir columnas nuevas a un
#data frame ya existente; ello se vuelve muy �til
#cuando trabajamos con datos m�s grandes, aunque, 
#podemos agregar renglones de dos formas

#Usando rbind
df_emp <- rbind(df_emp, c(6,"Ross",8800,TRUE,"BMW","pop",
                          "02-11-1996"))
rbind()
#as.vector(df_emp[7,])

#Usando los corchetes simples

df_emp[nrow(df_emp) + 1,] <- c(7,"Sheldon", 6400,FALSE,
                               "Golf",27,"01-02-1995")


df_emp[nrow(df_emp) + 1,] <- c(7,"Sheldon", 6400,FALSE,
                               "Golf",27,"01-02-1995")


df_emp
nrow(df_emp)
df_emp[nrow(df_emp),]
df_emp[9,]
df_emp[nrow(df_emp)+1,] <- c(7,"Guillermo", 1500,TRUE,
                               "Tennis",22,"01-02-1995")


df_emp[9+1,]
df_emp[10,]



df_emp <- df_emp[c(1,2,3,7,4,5,6),]


df_emp <- df_emp[,-4]
df_emp <- df_emp[,-c(3,6)]

df_emp$Age <- NULL

df_emp[-4,]




data.frame()

df_emp <- data.frame("id_empl" = c(1,2,3,4,5), 
                     "name_emp" = c("Ezequiel", "David", "Miranda",
                                    "Michelle", "Guillermo"),
                     "salary" = c(6000,7800,6900,6750,5580),
                     "mascota" = c(TRUE, FALSE, TRUE, TRUE, FALSE), 
                     row.names = c("a","b","c","d","cesar"))


row.names(df_emp) <- c("Peugeout", "AVALON", "RAV4", "YARIS", "PRIUS")

#Creando matrices----

#Las matrices son arreglos rectangulares de dos dimensiones,
#donde todos los elementos de una matriz deben ser
#obligatoriamente de la misma clase. Para crearla, se usa
#la funci�n matrix()

matrix(data = 26:50, nrow = 5, ncol = 5)

#Lo anterior genera una matriz de 5x5 del 26 al 50. Adem�s,
#podemos especificar el orden de los renglones

matrix(data = 26:50, nrow = 5, ncol = 5, byrow = TRUE)


#Extrayendo elementos de una matriz----

#Se aplicca la misma l�gica que con los data frames, usando
#los corchetes simples. Se nombrar� a la matriz "m1"

m1 <- matrix(data = c(1:12), nrow = 6, ncol = 2, byrow = T)

#Para extraer se hace lo siguiente

m1[1,1] #Rengl�n 1 y columna 1
m1[1,2] #Rengl�n 1 y columna 2
m1[6,1] #Rengl�n 6 y columna 1
m1[6,2] #Rengl�n 6 y columna 2



#Creando listas----

#Las listas permiten agrupar diferentes estructuras de
#datos, como vectores, data frames, matrices, etc. Para
#crearlas, se usa la funci�n list()

list(c(1,2,3,4,5), "Mascota" = c(T,F,F,T,T),
     c("A","B","C","D","E","F","G"), df_emp,m1)

#En el input anterior, se enlistaron 3 vectores, un 
#data frame y una matriz, de longitudes y dimensiones 
#diferentes. La lista anterior se guardar� en la variable
#llamada "arr1"

arr1 <- list(c(1,2,3,4,5),"Mascota" = c(T,F,F,T,T),
               c("A","B","C","D","E","F","G"), 
               df_emp,m1)

#Extrayendo elementos de una lista----

#Aqu� se pueden usar corchetes simples, dobles o el signo
#de dolar $ (este �ltimo aplica si el elemento de la lista
#tiene un t�tulo)

arr1[1] #Primer elemento de la lista (vector num�rico)
arr1[2] #Segundo elemento de la lista (vector l�gico)
arr1[3] #Tercer elemento de la lista (vector caracter)
arr1[4] #Cuarto elemento de la lista (data frame)
arr1[5] #Quinto elemento de la lista (matriz)

#Los corchetes simples se usan para extraer los elementos
#de una lista, pero, si queremos acceder a los elementos
#de los elementos de la lista, se usan los corchetes dobles

arr1[[1]] #Elementos del primer elemento de la lista
arr1[[2]] #Elementos del segundo elemento de la lista
arr1[[3]] #Elementos del tercer elemento de la lista
arr1[[4]] #Elementos del cuarto elemento de la lista
arr1[[5]] #Elementos del quinto elemento de la lista

#Ahora ya tenemos acceso a los elementos de cada elemento
#guardado en la lista, pero, si queremos trabajar con 
#cada elemento individual, se usan corchetes simples en
#conjunto con los dobles

arr1[[1]][1] #Primer elemento del primero elemento de la lista
arr1[[1]][2] #Segundo elemento del primero elemento de la lista
arr1[[4]][2] #Segundo elemento del cuarto elemento de la lista

#Notar que al extraer los dataframes, obtenemos otro dataframe,
#entonces, ahora debemos trabajar como si tuvieramos un
#dataframe como sigue

arr1[[4]][2][3,1] #Tercer elemento de la columna 1 del dataframe

#Entonces, notar que la sintaxis de trabajar con listas
#depende del tipo de estructura de dato que tengamos, esto
#aplica igual para las matrices

arr1[[5]][5,2] #Rengl�n 5 y columna 2 de el elemento 5 de la
               #lista (matriz)




#FIN----
