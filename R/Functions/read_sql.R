library(stringr)  # For str_to_title
library(DBI)      # For dbGetQuery
library(readr)    # For read_file
library(gsubfn)   # For reading the sql file

`%notin%` <- Negate(`%in%`)

read_sql <- function(connection = con, query, folder = "SQL", param_names = NA, param_values = NA, print_param = TRUE,
                     extra_sql_name = NA, extra_sql_query = NA, min_row = 0, override = FALSE) {
  
  # Validate function parameters ----
  if (folder %notin% c("SQL")) # expand folder range as needed
    stop("Error: The folder parameter must be one of the following options: SQL.")
  
  if (min_row < 0 | class(min_row) != "numeric")
    stop(paste0("Error: min_row = ", min_row, ". ", "The min_row parameter must be a number >= 0."))
  
  if (!is.logical(override))
    stop("Error: override must be a logical value (TRUE or FALSE).")

  if (!is.logical(print_param))
    stop("Error: print_param must be a logical value (TRUE or FALSE).")
  
  if (length(param_names) != length(param_values))
    stop(paste0("Error: param_names and param_values have different lengths (", length(param_names), " vs ", length(param_values), ")."))
  
  if (length(extra_sql_name) != length(extra_sql_query))
    stop(paste0("Error: extra_sql_name and extra_sql_query have different lengths (", length(extra_sql_name), " vs ", length(extra_sql_query), ")."))
  
  if (any(grepl('[[:punct:]]', param_names)))
    stop("Error: The values passed through the param_names parameter contain punctuation marks. Please remove these for the function to work.")
  
  if (any(grepl('[[:punct:]]', extra_sql_name)))
    stop("Error: The values passed through the extra_sql_name parameter contain punctuation marks. Please remove these for the function to work.")
  
  # Set file path ----
  file_path <- paste0("H:/Personal-Automation/R Scripts/", folder, "/")
  extra_file_path <- paste0("H:/Personal-Automation/R Scripts/Extra SQL/")
  
  cat(paste0("-- Query: ", file_path, query, "\n"))
  
  # Import and assign parameters
  if (missing(param_names) || missing(param_values)) {
    print("No parameters supplied.")
  } else {
    # Assign param_value[i] to param_names[i]
    for (i in seq(param_names)) assign(param_names[i], param_values[i])
    
    # Prints out the assigned values
    if (print_param == TRUE) {
      for (i in seq(param_names)) print(paste0("Parameter: ", param_names[i], " = '", param_values[i], "'")) 
    }
  }
  
  # Import and assign extra SQL parameters ----
  if (missing(extra_sql_name) || missing(extra_sql_query)) { # If missing, do nothing
  } else {
    
    for (i in seq(extra_sql_name)) {
      if (extra_sql_query[i] == "") { assign(extra_sql_name[i], "")
        # Assign extra_sql_query[i] to extra_sql_name[i] (fn$identity is used to pass through parameters)
      } else assign(extra_sql_name[i], fn$identity(read_file(paste(extra_file_path, extra_sql_query[i], sep = ""))))
    }
    
    for (i in seq(extra_sql_name)) {
      if (extra_sql_query[i] == "") { print(paste0("Extra SQL parameter: ", extra_sql_name[i], " - ignored."))
        # Prints out the assigned values
      } else print(paste0("Extra SQL: ", extra_sql_name[i], " imported from '", extra_file_path, extra_sql_query[i], "'"))
    }
  }
  
  # Read query ----
  full_query <- read_file(paste(file_path, query, sep = ""))
  
  # Create print_query function for troubleshooting purposes
  print_query <<- function() { cat(fn$identity(full_query)) }
  
  # Run the SQL query and assign the results to the df data frame
  df <- fn$dbGetQuery(connection, full_query)
  
  # Confirm the SQL query returned data
  record_text <- ifelse(nrow(df) == 1, "record", "records")
  
  if (min_row == 0 & nrow(df) > 0) {
    print(paste0(query, " returned ", nrow(df), " ", record_text, "."))
  }
  else if (min_row == 0 & nrow(df) == 0 & override == TRUE) {
    print(paste0(query, " returned ", nrow(df), " ", record_text, ", as expected (override = ", override, ")."))
  }
  else if (min_row != 0 & nrow(df) >= min_row) {
    print(paste0(query, " returned ", nrow(df), " ", record_text, "."))
  }
  else if (min_row > 0 & nrow(df) < min_row) {
    stop(paste0("Warning: ", query, " returned ", nrow(df), " ", record_text, ", which is less than the expected ", min_row, "."))
  }
  else stop(paste0("Warning: ", query, " returned no data."))
  
  cat("\n")
  
  # Print the data frame. This must be run last, otherwise the function will return a character string.
  df
}
