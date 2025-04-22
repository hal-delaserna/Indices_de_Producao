library(tidyverse)
library(lubridate)
# library(DescTools)
source("./R/CARREGAMENTO.R")

# substancias <- c("ALUMÍNIO|COBRE|ZINCO|CHUMBO|NÍQUEL|ESTANHO|FERRO")
  # c("ALUMÍNIO","COBRE","ZINCO","CHUMBO","NÍQUEL","ESTANHO","FERRO")

df <- CFEM
  # CFEM[grepl(x = CFEM$Substância, pattern = substancias, ignore.case = TRUE),]


# Ajuste de Unidades
idx <- df$UnidadeDeMedida == "kg"
df$QuantidadeComercializada[idx] <- 
    df$QuantidadeComercializada[idx] / 1000
df$UnidadeDeMedida[idx] <- "t"

# ID será usado pra individualizar boas/más declarações
df$id <- 
  paste0("id",df$CPF_CNPJ,df$Substância) |> 
    gsub(replacement = "", pattern = " ")

# impondo datas
df$data <- 
  lubridate::my(paste(df$Mês, df$Ano, sep = "/"))

# razão royalty-quantidade
df$r <- df$ValorRecolhido/df$QuantidadeComercializada


# Inicializar coluna de confiabilidade
df$confiabilidade <- NA

# Análise MAD por Substância × Trimestre
for (s in unique(df$Substância)) {
  for (t in unique(df$Trimestre)) {
    idx <- which(df$Substância == s & df$Trimestre == t & is.finite(df$r))
    if (length(idx) >= 30) {  # Mínimo para cálculo confiável de quartis
      x <- df$r[idx] |> log10()
      mediana <- median(x, na.rm = TRUE)
      lim_sup <- mediana + 3*mad(x, na.rm = TRUE)
      lim_inf <- mediana - 3*mad(x, na.rm = TRUE)
      
      df$confiabilidade[idx] <- ifelse(test = x < lim_inf | x > lim_sup, 
                                       yes = "Baixa", 
                                       no = "Alta")
    } else {
      df$confiabilidade[idx] <- "Indefinida"}}}



df_alta <- 
  df[df$confiabilidade == "Alta", ]

df_baixa <- 
  df[df$confiabilidade == "Baixa", ]





# Consolidação Trimestral ou Mensal
quantidade_total_trimestre <- 
                  tapply(X = df_alta$QuantidadeComercializada
                         ,INDEX = df_alta$Trimestre
                         ,FUN =sum
                         ,na.rm = TRUE)



# Cálculo do Índice de Quantidade (normalização)




 
# --------------------------------------------------------------
 


# # Análise IQR por Substância × Trimestre
# for (s in unique(df$Substância)) {
#   for (t in unique(df$Trimestre)) {
#     idx <- which(df$Substância == s & df$Trimestre == t & is.finite(df$r))
#     if (length(idx) >= 30) {  # Mínimo para cálculo confiável de quartis
#       x <- df$r[idx] |> log10()
#       q1 <- quantile(x, 0.25, na.rm = TRUE)
#       q3 <- quantile(x, 0.75, na.rm = TRUE)
#       iqr <- q3 - q1
#       lim_inf <- q1 - 1.5 * iqr
#       lim_sup <- q3 + 1.5 * iqr
#       df$confiabilidade[idx] <- ifelse(test = x < lim_inf | x > lim_sup, 
#                                        yes = "Baixa", 
#                                        no = "Alta")
#     } else {
#       df$confiabilidade[idx] <- "Indefinida"}}}
 



