library(tidyverse)
library(lubridate)
library(DescTools)

source("./R/CARREGAMENTO.R")
CFEM <-
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


CFEM$id <- 
  paste0("id",CFEM$CPF_CNPJ,CFEM$Substância) |> gsub(replacement = "", pattern = " ")

CFEM$data <- 
  lubridate::my(paste(CFEM$Mês, CFEM$Ano, sep = "/"))

CFEM$r <- CFEM$ValorRecolhido/CFEM$QuantidadeComercializada

#Quantos meses cada par CNPJ-Substância aparece
df <- 
  CFEM |> 
  group_by(id) |>
  summarise("N_meses" = n())

# CNPJ-Substância que declararam 30 ou mais meses
dfA <- df[df$N_meses >= 30,]$id |> unique()
  
dfA <-   
  CFEM[CFEM$id %in% dfA,]

# Cálculo da média e desvio padrão por substância e unidade de medida
estatisticas_substancia <- 
  dfA %>% 
  group_by(Substância, UnidadeDeMedida, data) %>% 
  summarize(
    'median_r' = median(r, na.rm = TRUE) |> round(2),
    'sd_r' = sd(r, na.rm = TRUE) |> round(2),
    "N" = n(),
    'median_Q' = median(QuantidadeComercializada, na.rm = TRUE) |> round(2),
    'sd_Q' = sd(QuantidadeComercializada, na.rm = TRUE) |> round(2),
    'median_V' = median(ValorRecolhido, na.rm = TRUE) |> round(2),
    'sd_V' = sd(ValorRecolhido, na.rm = TRUE) |> round(2),
    .groups = 'drop'
  )

# Substâncias que 

estatisticas_substancia_II <- estatisticas_substancia[estatisticas_substancia$N > 30,]

estatisticas_substancia_II$Substância |> table() |> as.data.frame() |> arrange(desc(Freq)) 



# Identificação de bons declarantes com consistência temporal
bons_declarantes <- 
  dfA %>% 
  group_by(Processo, CPF_CNPJ, Substância) %>% 
  summarize(
    meses_declarados = n_distinct(data),
    media_quantidade = median(r, na.rm = TRUE) |> round(2),
    desvio_padrao = sd(r, na.rm = TRUE) |> round(2),
    correlacao = cor(QuantidadeComercializada, ValorRecolhido, use = 'complete.obs'),
    .groups = 'drop'
  ) 

bons_declarantes <- 
  bons_declarantes$



%>% 
  filter(anos_declarados > 1, !is.na(correlacao), correlacao > 0.5)

# Mesclar com estatísticas gerais por substância
resultado <- 
  bons_declarantes %>% 
  left_join(estatisticas_substancia, by = 'Substância') %>% 
  filter(
    media_quantidade > 0, 
    desvio_padrao <= 2 * media_quantidade # Filtrar por desvio padrão razoável
  )

# Visualizar resultado
print(head(resultado))

# Salvar resultado em um arquivo CSV
write.csv(resultado, 'bons_declarantes.csv', row.names = FALSE)
