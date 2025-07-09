# A function for renaming data frame columns by specifying the column range and a vector of names. 
rename_columns <- function(data, col_range, col_names) {
  names(data)[col_range] <- col_names
  return(data)
}

# Example: Renaming column_3 to column3
df <- data.frame(column1 = c(1, 2, 3, 4, 5), 
                 column2 = c(10, 20, 30, 40, 50), 
                 Column_3 = c(100, 200, 300, 400, 500))

df_updated <- rename_columns(df, 3, "column3")

print(df_updated)
