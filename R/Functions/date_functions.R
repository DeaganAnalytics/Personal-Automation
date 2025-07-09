library(lubridate)

# Create date variable - change as required
date <- Sys.Date()

# Create a date string in the format of "MMM YYYY" based on x months from the start of the financial year
fytd_month <- function(x) {
  format(ymd(fy_start) + months(x), "%b %Y")
}

# Take the current month end (i.e. the date variable) and subtracts m months
month_end <- function(m) {as.character(ceiling_date(ymd(date) %m-% months(m), "months") %m-% days(1))}

# Take the current date (from the date variable) and subtracts y years
year_subtract <- function(y) {ymd(date) - years(y)}a

# Take the current date (from the date variable) and adds y years
year_add <- function(y) {ymd(date) + years(y)}

# Take the output from year_subtract and formats it as %B %Y, i.e. January 2021
year_text <- function(y) {format(year_subtract(y), "%B %Y")}

# Take the current financial year and subtracts y years
fy_subtract <- function(y) {
  ifelse(month(ymd(date)) > 6,
         paste(format(year_subtract(y), "%Y"), "-" , format(year_subtract(y - 1), "%y"), sep = ""),
         paste(format(year_subtract(y + 1), "%Y"), "-" , format(year_subtract(y), "%y"), sep = ""))
}
