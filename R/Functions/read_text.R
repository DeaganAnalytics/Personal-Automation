read_text <- function(folder, file, param_names = NA, param_values = NA, base_dir = ".") {
  
  full_path <- file.path(base_dir, folder, file)
  
  # Read text file
  text_content <- readLines(full_path, warn = FALSE)
  
  # Check if parameters are provided
  if (!missing(param_names) || !missing(param_values)) {
    if (length(param_names) == length(param_values)) {
      # Replace each param_name with param_value in the text, ensuring $ is part of the match
      for (i in seq_along(param_names)) {
        print(paste0("Parameter: ", param_names[i], " = '", param_values[i], "'")) 
        text_content <- gsub(paste0("\\$", param_names[i]), param_values[i], text_content)
      }
    } else {
      print("Error: The lengths of param_names and param_values do not match.")
    }
  } else {
    print("No parameters supplied.")
  }
  
  return(text_content)
}
