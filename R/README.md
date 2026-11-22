# About
This folder contains R scripts and functions I've developed to automate reports and processes, primarily for workplace tasks. The contents are organised into the following subfolders:

| Folder     | Description                                                                 |
|------------|-----------------------------------------------------------------------------|
| `Functions` | Reusable R functions for tasks like reading files, formatting output, and handling dates. |
| `Scripts`   | Standalone R scripts that demonstrate setup or logic used in reporting workflows - function-like, but not formal functions. |
| `SQL`       | Example SQL files used by the `read_sql.R` function.                     |
| `Text`      | Example text files used by the `read_text.R` function. |

Many of these functions were created to support repeatable workflows or automate steps in reporting pipelines. See individual file comments and examples for usage details.

## Run a helper

Start R from the repository root. This example uses base R and a checked-in text file:

```r
source("R/Functions/read_text.R")
read_text("Text", "example_2.txt",
          param_names = c("word1", "word2"),
          param_values = c("two", "parameters"),
          base_dir = "R")
```

Install the R packages listed at the top of the helper you want to use. The PDF merge example in `Scripts/pdf_merge.R` requires `qpdf` and reads `doc1.pdf` and `doc2.pdf` from the working directory.

## SQL Server

Install a SQL Server ODBC driver and the R packages `DBI`, `odbc`, `stringr`, `readr`, and `gsubfn`. Use `Functions/server_connection.R` as a template for creating a connection with your server, database, and supported authentication method. Pass the open connection to `read_sql()` and close it when finished. Set `base_dir = "R"` from the repository root to find the example SQL files. If you use additional SQL fragments, pass their directory as `extra_sql_dir`.

For the OneDrive helper, sync the SharePoint folder locally and pass the local sync root as `base_dir`.
