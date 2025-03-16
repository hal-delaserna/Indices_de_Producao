library(tidyverse)
library(lubridate)
library(data.table)


# Importação ----

cfem <- 
      fread(
    "./raw_data/CFEM_Arrecadacao_2022_2026.csv"
    ,sep = ","
    ,quote = "\""
    ,dec = "."
    ,encoding = "Latin-1"
    ,colClasses = "character")

df <-
  cfem[, c(
     "Ano"
    ,"Mês"
    # ,"Processo"
    # ,"AnoDoProcesso"
    # ,"Tipo_PF_PJ"
    # ,"CPF_CNPJ"
    ,"Substância"
    # ,"UF"
    # ,"CodigoMunicipio"
    # ,"Município"
    ,"QuantidadeComercializada"
    ,"UnidadeDeMedida"
    ,"ValorRecolhido"
    # ,"DataCriacao"
  )]


# Identificar colunas numéricas (exceto CPF_CNPJ, que pode ter números mas não deve ser convertido)
num_cols <- c(1, 2, 4, 6)




# Substituir vírgula decimal por ponto e converter para numérico
df[, (num_cols) := lapply(.SD, function(x)
  as.numeric(gsub(",", ".", x))), .SDcols = num_cols]



saveRDS(df, file = "./data/CFEM.RDS")