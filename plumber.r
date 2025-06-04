# plumber.R

library(plumber)

# Cargar el archivo con los endpoints
r <- plumb("histograma_api.R")  # Asegúrate de que el nombre coincida
r$run(host = "0.0.0.0", port = 8000)
