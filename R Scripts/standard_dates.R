# This file calculates the end of the previous month, quarter, half year and year, based on today's date
library(lubridate)

# Previous Month End
pm_end <- as.character(floor_date(Sys.Date(), "month") - 1)

# Previous Month End Lagged
pm_end_lagged <- as.character(floor_date((floor_date(Sys.Date(), "month") - 1), "month") - 1)

# Previous Quarter End
pq_end <- as.character(floor_date(Sys.Date(), "quarter") - 1)

# Previous Half Year End
ph_end <- as.character(floor_date(Sys.Date(), "halfyear") - 1)

# Previous Year End
py_end <- as.character(floor_date(Sys.Date(), "year") - 1)
