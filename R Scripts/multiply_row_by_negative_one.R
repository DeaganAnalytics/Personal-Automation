# Multiply row by negative one
multiply_row_by_negative_one <- function(df, row_index) {
  df[row_index, 2:ncol(df)] <- -1 * df[row_index, 2:ncol(df)]
  return(df)
}

# Example Usage
df <- data.frame(Area = c("Area 1", "Area 2", "Area 3", "Area 4", "Area 5"),
                 Metric_1 = c(10, 20, 30, 40, 50),
                 Metric_2 = c(100, 200, 300, 400, 500))

modified_df <- multiply_row_by_negative_one(df, row_index = 2)

print(modified_df)