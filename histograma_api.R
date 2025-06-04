#' @apiTitle API de duración de películas

#' Devuelve un histograma de la duración de películas
#'
#' @param transformar Indica si se aplica transformación logarítmica (TRUE/FALSE)
#' @get /histograma
#' @serializer contentType list(type="image/png")
function(transformar = FALSE) {
  library(ggplot2)
  
  df <- read.csv("netflix.csv", stringsAsFactors = FALSE)
  df$Minutes_clean <- as.numeric(ifelse(df$type == "Movie", df$Minutes, NA))
  df_minutes <- df$Minutes_clean[!is.na(df$Minutes_clean)]
  
  transformar <- as.logical(transformar)
  datos <- if (transformar) log1p(df_minutes) else df_minutes
  
  plot <- ggplot(data.frame(Minutes = datos), aes(x = Minutes)) +
    geom_histogram(fill = "#00aaff", bins = 30, color = "white") +
    labs(
      title = if (transformar) "Histograma (log transformado)" else "Histograma (original)",
      x = "Duración (minutos)",
      y = "Frecuencia"
    )
  
  tmp <- tempfile(fileext = ".png")
  ggsave(tmp, plot = plot, width = 6, height = 4)
  
  readBin(tmp, "raw", n = file.info(tmp)$size)
}
source("plumber.R")
