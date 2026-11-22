# About This Repo
This repository contains a collection of scripts I've developed to automate tasks and analyse data, using a mix of R, Python, batch files, and SQL.

The repo is organised into the following folders:
- **[R](R/README.md)** - Reporting and data automation using R functions and scripts
- **[Python](Python/README.md)** - Small tools for automating administrative tasks
- **[Batch Scripts](Batch%20Scripts/README.md)** - Toy examples created while experimenting with `.bat` files
- **[SQL](SQL/)** - Standalone SQL Server query templates. The [R SQL examples](R/SQL/) are inputs for the R query helper.

## Start here

From the repository root, run the SQL cleaner with its checked-in example:

```bash
python Python/sql_cleaner/clean_sql.py Python/sql_cleaner/example_input.txt cleaned.sql
```

## R
This folder contains a collection of R functions and scripts built over time to support reporting and process automation. The [R guide](R/README.md) describes each folder and shows how to run a helper.

Other scripts and helper functions are relatively simple and self-explanatory.

## Python
A small set of Python scripts used to automate administrative or repetitive tasks, typically for personal use or internal workflow improvements.

## Batch Scripts
These are lightweight `.bat` files created while experimenting with Windows batch scripting. They’re mostly trivial and not used regularly, but kept here for reference.
