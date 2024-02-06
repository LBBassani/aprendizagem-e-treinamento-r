# exercicio 3
library(data.table)
data("mtcars")
dataset <- as.data.table(mtcars, keep.rownames = TRUE)

# aplique o valor NA para a coluna hp somente para os veiculos com 6 cilindros
# (cyl)
dataset[cyl == 6, hp := NA]

# aplique o valor de 0/0 para a coluna mpg para os veiculos com 8 cilindros
dataset[cyl == 8, mpg := 0/0]

# filtre o dataset removendo os NA's e NaN's
dataset <- na.omit(dataset)

# crie um novo data.table chamado dataset2 e crime uma coluna com valor 1L
dataset2 <- dataset
dataset2[,coluna := 1L]

# exclua a coluna criada e repita o mesmo processo, porem utilize o copy para
# criar o dataset2
dataset[, coluna := NULL]
dataset2 <- copy(dataset)
dataset2[, coluna := 1L]

# crie o rank decrescente do mpg utilizando o data.table
