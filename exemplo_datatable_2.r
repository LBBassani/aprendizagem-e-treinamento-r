# criar dataset
set.seed(1)

dataset <- data.table(
  coluna_a = 1:20L,
  coluna_b = c(rep("Sul", 10), rep("Norte", 10)),
  coluna_c = rnorm(20)
)

setnames(dataset, c('coluna_a', 'coluna_b', 'coluna_c'), c('id', 'setor', 'valor'))

# pivotar (empilhar) o data.table
melted <- melt(
  data = dataset,
  id.vars = c('id', 'setor'),
  measure.vars = c('valor')
)

# despivotar (desempilhar) o data.table
unmelted <- dcast(
  data = melted,
  formula = id + setor ~ variable,
  value.var = 'value'
)

