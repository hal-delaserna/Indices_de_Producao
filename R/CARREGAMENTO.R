
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



# TRimestre 
trimestre <- 
  ceiling(as.numeric(CFEM$Mês) / 3)

CFEM$Trimestre <- 
  paste0(trimestre, "T", "-", CFEM$Ano)

