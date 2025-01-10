library(lubridate)

# This file derives dates relative to the 'date' variable
date <- Sys.Date()

print(paste0("date = ", date, "."))

# Create Date Variables -------------------------
# Previous Month Start
pm_start <- as.character(floor_date(ymd(date), unit = "month"))

# Current Month Start
cm_start <- as.character(ceiling_date(as.Date(date), "month", change_on_boundary = NULL))

# Date variable with a 1 month lag
date_1m_lag <- as.character(ymd(pm_start) %m-% days(1))

# Date variable with a 1 week lag
date_1w_lag <- as.character(ymd(date) %m-% days(6))

# pm_start with a 1 month lag
pm_start_1m_lag <- as.character(floor_date(ymd(date_1m_lag), unit = "month"))

# Date variable with a 3 month lag
date_3m_lag <- floor_date(ymd(date) %m-% months(2), "month") %m-% days(1)

# Current, Previous and Next Year
current_year <- format(as.Date(date), "%Y")
previous_year <- as.character(as.numeric(current_year) - 1)
next_year <- as.character(as.numeric(current_year) + 1)

# Current Month
current_month <- format(as.Date(date), "%m")

# Current Financial Year Start
fy_start <- ifelse(month(date) > 6, paste(current_year, "-07-01", sep = ""), paste(previous_year, "-07-01", sep = ""))

# Financial Year Year (The second part of 20XX/YY, i.e. 20YY. So if 2022/23, then 2023)
fy_year <- ifelse(month(date) >= 7, next_year, current_year)
p_fy_year <- as.character(as.numeric(fy_year) - 1)

# Date Text Formatting
date_text_short <- format(ymd(date), "%d %B")
date_text_medium <- format(ymd(date), "%B %Y")
date_text_long <- format(ymd(date), "%d %B %Y")
date_string <- tolower(format(ymd(date), "%b_%Y"))
date_string_3mlag <- format(ymd(date_3m_lag), "%B %Y")
date_no_dash <- format(ymd(date), "%Y%m%d")
date_upper <- toupper(format(ymd(date), "%d%b%Y"))
date_year_month <- paste(current_year, "_", current_month, sep = "")
