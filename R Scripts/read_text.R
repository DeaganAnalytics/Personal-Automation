read_text <- function(folder, file, param_names = NA, param_values = NA) {
  
  # Set file path - expand to have more text folders if required
  if (folder == "Text") {
    file_path <- "H:/Personal-Automation/R Scripts/Text/"
  }
  
  # Combine file path and file name
  full_path <- paste0(file_path, file)
  
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

# Example with no parameters
example_1 <- read_text("Text", "example_1.txt")
example_1

# Example with parameters
example_2 <- read_text("Text", "example_2.txt", param_names = c("word1", "word2"), param_values = c("two", "parameters"))
example_2