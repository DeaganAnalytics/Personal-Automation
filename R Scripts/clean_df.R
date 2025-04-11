# Function for cleaning data frame column names, converting NULLs and blanks to NA, and cleaning whitespace 
library(dplyr)
library(stringr)
library(janitor)

clean_df <- function(df) {
  clean_names(df) %>% # Clean column names
    mutate(across(where(is.character), ~ na_if(.x, "NULL"))) %>% # Converts NULL to NA
    mutate(across(where(is.character), ~na_if(str_squish(str_trim(.x)), "")))  # Clean whitespace and convert blanks to NA in text columns 
}
