# Multiply row by negative one
multiply_row_by_negative_one <- function(df, row_index) {
  df[row_index, 2:ncol(df)] <- -1 * df[row_index, 2:ncol(df)]
  return(df)
}
