library(readr)
library(readxl)
library(fs)

# For this to work, you first need to sync SharePoint to your One Drive by navigating to the data file in SharePoint and pressing the sync button.

read_one_drive_file <- function(filename, subfolders = NULL) {
  
  # Hardcoded base directory for synced OneDrive folder - can update to dynamically select user name if needed
  base_dir <- "" # insert OneDrive folder path here.
  
  # Build full path
  full_path <- fs::path(base_dir, fs::path_join(subfolders), filename)
  
  # Check file existence
  if (!fs::file_exists(full_path)) {
    stop("File not found: ", full_path)
  }
  
  # Get file extension
  ext <- tolower(fs::path_ext(full_path))
  
  # Read file based on extension
  if (ext == "csv") {
    df <- read_csv(full_path, show_col_types = FALSE)
  } else if (ext %in% c("xls", "xlsx")) {
    df <- read_excel(full_path)
  } else {
    stop("Unsupported file type: '", ext, "'. Only .csv, .xls, and .xlsx are supported.")
  }
  
  cat(paste0("Reading ", filename, " from ", fs::path(base_dir, subfolders), "\n"))
}
