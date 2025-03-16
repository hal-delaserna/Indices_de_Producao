
CFEM <- 
readRDS("./data/CFEM.Rds")

# TRimestre 
trimestre <- 
  ceiling(as.numeric(df$Mês) / 3)

CFEM$Trimestre <- 
  paste0(trimestre, "T", "-", df$Ano)