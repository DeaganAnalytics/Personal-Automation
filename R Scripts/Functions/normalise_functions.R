# Create min_max_normalise function to normalise numeric data
min_max_normalise <- function(x) {
  (x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
}

# Create de-normalise function to denormalise normalised numeric data
de_normalise <- function(x_scaled, x_original) {
  min_val <- min(x_original, na.rm = TRUE)
  max_val <- max(x_original, na.rm = TRUE)
  return(x_scaled * (max_val - min_val) + min_val)
}
