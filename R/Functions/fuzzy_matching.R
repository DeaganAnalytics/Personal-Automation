library(stringdist)

# Create fuzzy matching function
lv_fuzzy_match <- function(x, y) {
  1 - stringdist(x, y, method = "lv") / pmax(nchar(x), nchar(y))
}
