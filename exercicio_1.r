# Exercícios treinamento R
library(data.table)
data("mtcars")
dataset <- as.data.table(mtcars, keep.rownames = TRUE)

# Recuperar colunas 1, 3 e 8 no formato data.table
dataset_1_3_8 <- dataset[, c(1, 3, 8)]

# tirar a média (mpg) por cilindro (cy1)
mpg <- dataset_1_3_8[, mean(cyl)]

# ordernar o dataset por nome decrescente
dataset_ordered <- dataset_1_3_8[order(dataset_1_3_8$rn, decreasing = TRUE),]

# calcular a média de peso (wt) por marcha (gear) quando o cilindro é maior que 6
mwt <- dataset[cyl > 6, mean(wt), gear]
