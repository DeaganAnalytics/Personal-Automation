# Function to remove duplicate records based on the number of NA's in per row for a given group_col (i.e. property id)
library(dplyr)
library(rlang)

dedupe_min_na <- function(df, group_col) {
  group_col_sym <- rlang::sym(group_col)
  
  df %>%
    distinct() %>%  # Remove exact duplicates first
    mutate(na_count = rowSums(is.na(.))) %>%  # Count NAs per row
    group_by(!!group_col_sym) %>%
    filter(na_count == min(na_count)) %>%  # Keep rows with fewest NAs per group
    slice(1) %>%  # If ties, keep first row
    ungroup() %>%
    select(-na_count)
}
