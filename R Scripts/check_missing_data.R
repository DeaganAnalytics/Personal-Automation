# Check Missing Data: A function to check if a data frame contains 0s, NAs or both

`%notin%` <- Negate(`%in%`)

check_missing_data <- function(df, columns = NULL, override = FALSE, check_type = "both") {
  
  # Validate columns
  if (is.null(columns) == FALSE & is.numeric(columns) == FALSE) {
    stop("columns must be numeric.")
  }
  
  # Validate check_type
  if (check_type %notin% c("both", "zero", "NA")) {
    stop("check_type must be one of 'both', 'zero' or 'NA'.")
  }
  
  # If override is TRUE, skip the data check
  if (override == TRUE) {
    print("override = TRUE. Skipping data check.")
    return(df)
  }
  
  # Determine columns to check
  if (is.null(columns)) {
    columns_to_check <- 2:ncol(df) # Default selection
  } else {
    columns_to_check <- columns # Specified selection
  }
  
  # Apply the check function to each column based on check_type
  if (check_type == "both") {
    check_results <- sapply(df[, columns_to_check], function(x) any(x == 0 | is.na(x)))
  } else if (check_type == "zero") {
    check_results <- sapply(df[, columns_to_check], function(x) any(x == 0, na.rm = TRUE))
  } else if (check_type == "NA") {
    check_results <- sapply(df[, columns_to_check], function(x) any(is.na(x)))
  }
  
  # Get the names of columns with missing data
  columns_with_missing_data <- names(df)[columns_to_check][check_results]
  
  # Print the columns with missing data
  if (length(columns_with_missing_data) > 0) {
    missing_data_text <- if (check_type == "both") "(NAs or 0s)" else if (check_type == "zero") "(0s)" else "(NAs)"
    stop(paste0("There is missing data ", missing_data_text, " in the following columns: \n", paste("- ", columns_with_missing_data, collapse = "\n")))
  } else {
    print("No missing data found in the specified columns.")
  }
  
  return(df) # Return the data frame after the check
}
