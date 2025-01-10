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
