# Exercicio 2
library(data.table)
data("mtcars")
dataset <- as.data.table(mtcars, keep.rownames = TRUE)

# alterar a ordem das colunas considerando as três primeiras colunas como gear, 
# cyl e carb
setcolorder(dataset, neworder = c('gear', 'cyl', 'carb'))

# ordene o dataset por gear, cyl, carb e rn
setorder(dataset, cols= 'gear', 'cyl', 'carb', 'rn')

# adicione as linhas 'Fiat Uno' e 'Volkswagen Fusca'
new_row <- data.table(
  'gear' = 1, 
  'cyl' = 1,
  'carb' = 1,
  'wt' = 1.0,
  'rn' = 'Fiat Uno',
  'mpg' = 1.0,
  'disp' = 1.0,
  'hp' = 1,
  'drat' = 1.0,
  'qsec' = 1.0,
  'vs' = 1,
  'am' = 0
)

dataset <- rbindlist(list(dataset, new_row))

new_row <- data.table(
  'gear' = 1, 
  'cyl' = 1,
  'carb' = 1,
  'wt' = 1.0,
  'rn' = 'Volskwagen Fusca',
  'mpg' = 1.0,
  'disp' = 1.0,
  'hp' = 1,
  'drat' = 1.0,
  'qsec' = 1.0,
  'vs' = 1,
  'am' = 0
)

dataset <- rbindlist(list(dataset, new_row))

# monte um data.table com rn, cyl, gear e empilhe os indicadores wt, qsec, disp,
# drat e hp numa nova coluna "Nome Indicador"
melted_dataset <- melt(
  data = dataset,
  id.vars = c('rn', 'cyl', 'gear'),
  measure.vars = c('wt', 'qsec', 'disp', 'drat', 'hp'),
  variable.name = 'Nome Indicador'
)

# monte um data.table desempilhando o resultado anterior e fazendo o merge com
# dataset2 para trazer a coluna binária
unmelted_dataset <- dcast(
  data = melted_dataset,
  formula = rn + cyl + gear ~ `Nome Indicador`,
  value.var = 'value'
)
