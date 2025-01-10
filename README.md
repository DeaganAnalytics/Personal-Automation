# About this Repo
This repository contains a collection of scripts I have developed to automate processes and analyse data.

The repo is currently broken up into separate folders:
 - R Scripts
 - Python Scripts
 - Batch Scripts
 - R Project Files

## R Scripts
The R scripts in this repo are a collection of functions I have developed over time to assist with automating reports and processes. The table below provides more detail on the major functions.

| Function Name| Script Name| Description |
|----------|----------|----------|
| Read SQL | read_sql.R | A function that reads an .sql file, connects to a database, runs the query and passes in parameters to the query, with error handling. It then assigns the imported data frame to an R variable.|
| Read Text | read_text.R | A function that that reads a .txt file, optionally passes in parameters, and assigns the text to an R variable.|
| Load Package | load_package.R | A function that loads an R package using the library function and checks that the version matches the specified version.|

The remaining R scripts and functions are relatively simply and self explanatory.

## R Project Files
These files are generated when creating an R Project.

## Python Scripts
The Python scripts in this repo are a collection of administrative tasks I have automated over time. The table below provides more detail on the major scripts.

| File Name| Description |
|----------|----------|
| clear_downloads.py | A script that clears the downloads folder on a pc. |
| clear_recycle_bin.py | A script to clear the recyling bin on a windows pc. |
| create_outlook_sa_holidays.py | A script that creates all day calendar events in Microsoft Outlook for each public holiday in South Autralia. |
| format_piped_code.py | A script that formats piped R code to match my personal preference. |
| sql_keyword_to_uppercase.py | A script that coverts SQL keywords in a .sql file to uppercase matching my personal preference. |
| xml_to_csv.py | A script that converts an XML file to CSV. |

## Batch Scripts
The Batch scripts in this repo are relatively trivial and aren't used in any regular capacity. They are the result of me experimenting with .bat files.
