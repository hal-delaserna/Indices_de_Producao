
CFEM <- 
readRDS("./data/CFEM.Rds")

CFEM <- 
  CFEM[!is.na(CFEM$QuantidadeComercializada) & CFEM$QuantidadeComercializada > 0 &
         !is.na(CFEM$ValorRecolhido) & CFEM$ValorRecolhido > 0,]

CFEM$Processo <- 
  paste(CFEM$Processo, CFEM$AnoDoProcesso, sep = "/")

CFEM <- CFEM[,-4]


# Removendo espaços
CFEM[] <- lapply(CFEM, function(x) {
  if (is.character(x)) str_squish(x) else x
})



# impondo datas

# Mês
CFEM$data <- 
  paste(CFEM$Mês, CFEM$Ano, sep = "/") |> lubridate::my()

# TRimestre
CFEM$Trimestre <- 
  CFEM$data |> quarter()

CFEM$Trimestre <- 
  paste0(CFEM$Ano, ".", CFEM$Trimestre)


# Ajuste de Unidades
idx <- CFEM$UnidadeDeMedida == "kg"
CFEM$QuantidadeComercializada[idx] <- 
  CFEM$QuantidadeComercializada[idx] / 1000
CFEM$UnidadeDeMedida[idx] <- "t"





