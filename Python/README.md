# Python utilities

| Script | Inputs and outputs | Requirements |
| --- | --- | --- |
| [SQL cleaner](sql_cleaner/clean_sql.py) | Reads Power BI SQL text and writes cleaned SQL to a file | Python standard library |
| [SQL keyword uppercase](sql_keyword_to_uppercase.py) | Reads a SQL file and prints text with selected space-delimited keywords uppercased | Python standard library |
| [XML to CSV](xml_to_csv.py) | Reads flat XML with consistently ordered fields and writes a CSV | Python standard library |
| [Pipe formatter](format_piped_code.py) | Prints the formatted version of the R example embedded in the script | Python standard library |
| [Clear Downloads](clear_downloads.py) | Moves files and folders from `~/Downloads` to the system trash | `Send2Trash` and a supported system trash |
| [Empty Recycle Bin](clear_recycle_bin.py) | Empties the entire Windows Recycle Bin without confirmation | Windows, `winshell`, `pywin32` |
| [Outlook holidays](create_outlook_sa_holidays.py) | Creates all-day, out-of-office appointments from the hard-coded 2025 South Australian holiday list | Windows, classic Outlook, `pywin32` |

Run these examples from the repository root:

```bash
python Python/sql_cleaner/clean_sql.py Python/sql_cleaner/example_input.txt cleaned.sql
python Python/sql_keyword_to_uppercase.py query.sql
python Python/xml_to_csv.py input.xml output.csv
```

The file-writing tools overwrite the output path if it already exists. Compare `cleaned.sql` with [the checked-in expected output](sql_cleaner/example_expected.txt). Install the packages listed for the desktop tool you plan to use, for example `python -m pip install Send2Trash`.

The Outlook script creates appointments on every run. Update the holiday dates before using it for another year. Review the contents of Downloads or the Recycle Bin before running the cleanup scripts.
