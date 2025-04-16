library(tidyverse)
library(lubridate)
# library(DescTools)

source("./R/CARREGAMENTO.R")
df <-
  CFEM[CFEM$Substância %in%
         c(
           # "ALUMÍNIO",
           # "COBRE",
           # "ZINCO",
           # "CHUMBO",
           # "NÍQUEL",
           # "ESTANHO",
           "FERRO"
         ), ]


df$id <- 
  paste0("id",df$CPF_CNPJ,df$Substância) |> gsub(replacement = "", pattern = " ")

df$data <- 
  lubridate::my(paste(df$Mês, df$Ano, sep = "/"))

df$r <- df$ValorRecolhido/df$QuantidadeComercializada


# TRANSFORMAR KG EM TON. HARMONIZAR UNIDADES DENTRO DE UMA SUBSTÂNCIA


# Inicializar coluna de confiabilidade
df$confiabilidade <- NA

# Aplicar análise IQR por grupo de Substância × Trimestre
for (s in unique(df$Substância)) {
  for (t in unique(df$Trimestre)) {
    idx <- which(df$Substância == s & df$Trimestre == t & is.finite(df$r))
    if (length(idx) >= 5) {  # Mínimo para cálculo confiável de quartis
      x <- df$r[idx]
      q1 <- quantile(x, 0.25, na.rm = TRUE)
      q3 <- quantile(x, 0.75, na.rm = TRUE)
      iqr <- q3 - q1
      lim_inf <- q1 - 1.5 * iqr
      lim_sup <- q3 + 1.5 * iqr
      df$confiabilidade[idx] <- ifelse(x < lim_inf | x > lim_sup, "Baixa", "Alta")
    } else {
      df$confiabilidade[idx] <- "Indefinida"
    }
  }
}

# Verificar resumo
table(df$confiabilidade)

# (Opcional) Salvar resultado
# write.csv(df, "com_confiabilidade.csv", row.names = FALSE)

