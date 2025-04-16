library(tidyverse)
library(lubridate)
library(data.table)


# Importação ----

cfem <- 
  rbind(
      fread(
    "./raw_data/CFEM_Arrecadacao_2022_2026.csv"
    ,sep = ","
    ,quote = "\""
    ,dec = "."
    ,encoding = "Latin-1"
    ,colClasses = "character"),
    fread(
      "./raw_data/CFEM_Arrecadacao_2017_2021.csv"
      ,sep = ","
      ,quote = "\""
      ,dec = "."
      ,encoding = "Latin-1"
      ,colClasses = "character"))

df <-
  cfem[, c(
     "Ano"
    ,"Mês"
     ,"Processo"
     ,"AnoDoProcesso"
     ,"Tipo_PF_PJ"
     ,"CPF_CNPJ"
    ,"Substância"
     ,"UF"
     ,"CodigoMunicipio"
     ,"Município"
    ,"QuantidadeComercializada"
    ,"UnidadeDeMedida"
    ,"ValorRecolhido"
     # ,"DataCriacao"
  )]


# Identificar colunas numéricas (exceto CPF_CNPJ, que pode ter números mas não deve ser convertido)
num_cols <- c(1, 2, 11, 13)

# Substituir vírgula decimal por ponto e converter para numérico
df[, (num_cols) := lapply(.SD, function(x)
  as.numeric(gsub(",", ".", x))), .SDcols = num_cols]

# Royalty por unidade
df$r <- df$ValorRecolhido/df$QuantidadeComercializada


df$Substância <- 
  ifelse(grepl(df$Substância, pattern = "AREIA") == TRUE & 
         !grepl(df$Substância, pattern = "INDUSTRIAL|VIDRO|FUNDIÇÃO") == TRUE,
         yes = "AREIA",
         no = df$Substância)
df$Substância <- 
  ifelse(grepl(df$Substância, pattern = "BRITA") == TRUE,
         yes = "BRITA",
         no = df$Substância)

df$Substância <- 
  ifelse(grepl(df$Substância, pattern = "ÁGUA") == TRUE,
         yes = "ÁGUA",
         no = df$Substância)

df$Substância <- ifelse(grepl(df$Substância, pattern = "ALUMÍNIO"), "ALUMÍNIO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "BERÍLIO"), "BERÍLIO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "CHUMBO"), "CHUMBO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "COBRE"), "COBRE", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "ESTANHO"), "ESTANHO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "FERRO"), "FERRO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "LÍTIO"), "LÍTIO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "MANGANÊS"), "MANGANÊS", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "NIÓBIO"), "NIÓBIO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "NÍQUEL"), "NÍQUEL", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "OURO"), "OURO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "PRATA"), "PRATA", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "SILÍCIO"), "SILÍCIO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "TÂNTALO"), "TÂNTALO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "TITÂNIO"), "TITÂNIO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "TUNGSTÊNIO"), "TUNGSTÊNIO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "VANÁDIO"), "VANÁDIO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "ZINCO"), "ZINCO", df$Substância)
df$Substância <- ifelse(grepl(df$Substância, pattern = "ZIRCÔNIO"), "ZIRCÔNIO", df$Substância)


saveRDS(df, file = "./data/CFEM.Rds")