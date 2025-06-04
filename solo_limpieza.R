df<-read.csv("netflix.csv", stringsAsFactors = FALSE)
na_counts <- colSums(is.na(df))
na_percentages <- round(na_counts / nrow(df) * 100, 2)
na_summary <- data.frame(
  Variable = names(na_counts),
  NAs = na_counts,
  Porcentaje = na_percentages
)

# Ordenar de mayor a menor
na_summary <- na_summary[order(-na_summary$NAs), ]

print(na_summary)


library(VIM)
library(naniar)

vis_miss(df, cluster = TRUE)

df$Minutes_clean <- ifelse(df$type == "Movie", df$Minutes, NA)
df$Seasons_clean <- ifelse(df$type == "TV Show", df$Seasons, NA)
# Creamos variables limpias para Minutes y Seasons según el tipo de contenido
# Así evitamos problemas con NAs que son por el tipo de contenido
summary(df$Minutes_clean)
summary(df$Seasons_clean)







