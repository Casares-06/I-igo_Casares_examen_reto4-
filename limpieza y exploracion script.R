df<-read.csv("netflix.csv")

#omitir Na para la limpieza de datos .

summary_stats<-function(x) {
  x<-na.omit(x)
  c(
  Max = max(x),
  Q3 = quantile(x, 0.75),
  Mediana = median(x),
  Media = mean(x),
  Q1 = quantile(x, 0.25),
  Min = min(x),
  NAs = sum(is.na(x)),
  DesvStd = sd(x)
  )
}
minutes_stats<-summary_stats(df$Minutes)
seasons_stats<-summary_stats(df$Seasons)

minutes_stats
seasons_stats


unique_type <- length(unique(na.omit(df$type)))
unique_country <- length(unique(na.omit(df$country)))
unique_director <- length(unique(na.omit(df$director)))

cat("• Type: ", unique_type, "\n")
cat("• Country: ", unique_country, "\n")
cat("• Director: ", unique_director, "\n")
