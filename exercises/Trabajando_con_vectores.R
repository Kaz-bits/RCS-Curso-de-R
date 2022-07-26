---
title: "Trabajando con vectores"
author: "César A. Ponce-Diego"
output: learnr::tutorial
runtime: shiny_prerendered
---

```{r setup, include=FALSE}
library(learnr)
```

## Topic 1

### Ejercicios

A continuación, se mostrarán una serie de ejercicios. Cada uno tiene un espacio para ejecutar códigos de R. El apartado de *`Hint`* son pistas para resolver cada una de las preguntas.

### Ejercicio 1. Creando vectores

Utiliza el siguiente espacio para verificar los elementos que correspondan a un vector

```{r vector, exercise=TRUE}

```

```{r vector-hint}
is.vector(1)
class(1)
```

```{r vectors, echo=FALSE}
quiz(
  question("¿Qué función específica se emplea para generar vectores de más de un elemento? *Más de una respuesta*",
  answer("mean()"),
  answer("c()", correct = TRUE),
  answer("seq()", correct = TRUE),
  answer("rep()", correct = TRUE),
  allow_retry = TRUE,
  random_answer_order = TRUE
  ),
  question("Selecciona todas las opciones que correspondan a un vector en R", 
    answer("c(1, 2, 3, 4)", correct = TRUE),
    answer("México", correct = TRUE),
    answer("TRUE", correct = TRUE),
    answer("2 + 2i", correct = TRUE),
    allow_retry = TRUE,
    random_answer_order = TRUE
  ),
  question("¿Qué tipo de clase es la siguiente secuencia: `c(”rosa”, “iris”, “rosa”, “tulipán”)`",
    answer("numeric"),
    answer("character", correct = TRUE),
    answer("logical"),
    answer("complex"),
    allow_retry = TRUE,
    random_answer_order = TRUE
  )
)
```

## Topic 2

### Ejercicio 2. Atributos de un vector

Considera la siguiente secuencia de números guardada en la variable 'var1'

```{r length-vector, exercise=TRUE}
var1 <- seq(from = 50, to = 100)
```

```{r length-vector-hint}
is.vector(1)
lenght(1)
typeof(1)
class(1)
```

```{r quiz, echo=FALSE}
quiz(
  question("¿La secuencia anterior es un vector?",
    answer("Verdadero", correct = TRUE),
    answer("Falso")
  ),
  question("¿Cuál es la longitud de la secuencia anterior?",
    answer("51", correct = TRUE),
    answer("50"),
    answer("25"),
    answer("43"),
    allow_retry = TRUE,
    random_answer_order = TRUE
  ),
  question("¿Qué tipo de clase es la variable 'var1'?",
    answer("double"),
    answer("integer", correct = TRUE),
    answer("character"),
    answer("logical"),
    allow_retry = TRUE,
    random_answer_order = TRUE
  )
)
```

## Topic 3

### Ejercicio 3. Coerción implícita

Considere las siguientes tres variables:

```{r coerce-vector, exercise=TRUE}
x <- c(1,2,3,4,5)
y <- c("a", "b", "c")
z <- c(TRUE, FALSE, FALSE, TRUE)


```

```{r coerce-vector-hint}
class(1)
```

```{r coercion, echo=FALSE}
quiz(
  question("¿A qué clase pertenece `x`?",
    answer("numeric", correct = TRUE),
    answer("character"),
    answer("logical"),
    answer("complex"),
    allow_retry = TRUE,
    random_answer_order = TRUE
  ),
  question("¿A qué clase pertenece `y`?",
    answer("numeric"),
    answer("character", correct = TRUE),
    answer("logical"),
    answer("complex"),
    allow_retry = TRUE,
    random_answer_order = TRUE
  ),
  question("¿A qué clase pertenece `z`?",
    answer("numeric"),
    answer("character"),
    answer("logical", correct = TRUE),
    answer("complex"),
    allow_retry = TRUE,
    random_answer_order = TRUE
  )
)
```

Considere ahora las siguientes tres variables:

```{r coerce-vector_2, exercise=TRUE}
x <- c(1,2,3,4,5,"a")
y <- c("a", "b", "c",1,2,3,4,5,TRUE,FALSE,TRUE)
z <- c(TRUE, FALSE, FALSE, TRUE,1,2,3,4)
```

```{r coerce-vector_2-hint}
class(1)
```

```{r coercion-imp, echo=FALSE}
quiz(
    question("Selecciona la opción que contenga la clase de cada variable (`x`, `y`, `z`)",
    answer("`x`: character; `y`: character;
           `z`: numeric", correct = TRUE),
    answer("`x`: character; `y`: character;
           `z`: character"),
    answer("`x`: numeric; `y`: character;
           `z`: logical"),
    answer("`x`: character; `y`: character;
           `z`: complex"),
    allow_retry = TRUE,
    random_answer_order = TRUE
  ),
  question("Selecciona el orden en que R realiza la coerción implícita",
    answer("character < numeric < logical"),
    answer("logical < numeric < character", 
           correct = TRUE),
    answer("logical < character < numeric"),
    answer("character < logical < numeric"),
    allow_retry = TRUE,
    random_answer_order = TRUE
  ),
  question("¿Qué condiciones deben cumplirse para evitar que se genere una coerción implícita?",
    answer("Que los vectores sean de una misma clase", correct = TRUE),
    answer("Que los vectores sean de la misma longitud"),
    answer("Que los vectores se guarden en la misma variable"),
    answer("Que los vectores se junten con vectores de otras clases"),
    allow_retry = TRUE,
    random_answer_order = TRUE
  )
)
```

## Topic 4

### Ejercicio 4. Coerción explícita

Escribe un código que permita transformar el vector de la variable `var2` en un vector de tipo `character`

```{r coerce-chr, exercise=TRUE, exercise.lines=5}
var2 <- c(45,19,22,30,26,4)

```

```{r coerce-chr-hint}
as.logical() #Convertir a un valor lógico
as.numeric() #Convertir a un valor numérico
as.character() #Convertir a un valor caracter
as.integer() #Convertir a un valor entero
as.double() #Convertir a un valor decimal
```

```{r coercion-exp, echo=FALSE}
quiz(
    question("¿Qué función de R se emplea para convertir datos a clase `character`?",
    answer("as.character", correct = TRUE),
    answer("as.logical"),
    answer("as.numeric"),
    answer("as.integer"),
    allow_retry = TRUE,
    random_answer_order = TRUE
  ),
  question("¿Cuál es el resultado de realizar la operación `var2 * c(2,4)`?",
    answer("90 76 44 120 52 16", correct = TRUE),
    answer("90 38 44  60 52  8"),
    answer("180 76 88 120 104 16"),
    answer("NA"),
    allow_retry = TRUE,
    random_answer_order = TRUE
  )
)
```

Al vector resultado de la siguiente operación `var2 * c(2,4)` añadele los elementos `1, 7, 10 y 24` y guardalo en una variable llamada `var3` y convierte la variable `var3` a clase `character`

```{r coerce-chr-2, exercise=TRUE, exercise.lines=5}
var2 <- c(45,19,22,30,26,4)
var3 <- c()

```

```{r coerce-chr-2-hint}
#Utiliza c() para juntar vectores y as.character para luego convertirlos a tipo caracter
```

```{r coerce-error, echo=FALSE}
quiz(
  question("¿Cuál es el resultado de multiplicar `var3` por el numero `1`?", 
    answer("90  76  44 120  52  16   1   7  10  24"),
    answer("Un error", correct = TRUE),
    answer("No se produce resultado"),
    answer("Un mensaje de advertencia"),
    allow_retry = TRUE,
    random_answer_order = TRUE
  ),
  question("¿Por qué se generó el resultado de la pregunta anterior? *Hay dos respuestas correctas*",
    answer("Porque los vectores son de diferente longitud"),
    answer("Porque no es posible juntar vectores"),
    answer("Porque no es posible multiplicar caracteres con números", correct = TRUE),
    answer("Porque los vectores son de diferente clase", correct = TRUE),
    allow_retry = TRUE,
    random_answer_order = TRUE
  )
)
```
