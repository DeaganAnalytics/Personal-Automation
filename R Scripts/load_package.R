# Utils is required for packageVersion
library(utils)

load_package <- function(package, version, silent = TRUE, override = FALSE) {
  # Load package using library()
  library(package, character.only = TRUE)
  
  current_version <- packageVersion(package)
  
  # Check the package version is up to date:
  if (current_version == version & silent == FALSE) {
    print(paste0(package, ": version ", current_version, " is up to date."))
    
    # If the package version is behind the specified version:
  } else if (current_version < version & override == FALSE) {
    print(paste0("Warning: ", package, " is loaded using version ", current_version, ". Please update to version ", version, " to avoid running into unintended issues."))
    stop()
    
    # If the package version is behind the specified version and override == TRUE:
  } else if (current_version < version & override == TRUE) {
    print(paste0("Warning: ", package, " is loaded using version ", current_version, ". Please update to version ", version, " to avoid running into unintended issues."))
    
    # If the package version is ahead of the specified version: 
  } else if (current_version > version & override == FALSE) {
    print(paste0("Warning: ", package, " is loaded using version ", current_version, " This is greater than version ", version, " and may introduce features that have not been tested yet."))
    stop()
    
    # If the package version is ahead of the specified version and override == TRUE: 
  } else if (current_version > version & override == TRUE)
    print(paste0("Warning: ", package, " is loaded using version ", current_version, " This is greater than version ", version, " and may introduce features that have not been tested yet."))
}
