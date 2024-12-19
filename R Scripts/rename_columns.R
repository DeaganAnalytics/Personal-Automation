# A function for renaming data frame columns by specifying the column range and a vector of names. 
rename_columns <- function(data, col_range, col_names) {
  names(data)[col_range] <- col_names
  return(data)
}
