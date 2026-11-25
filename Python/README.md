# Python utilities

| Script | Inputs and outputs | Requirements |
| --- | --- | --- |
| [SQL cleaner](sql_cleaner/clean_sql.py) | Reads Power BI SQL from `input.txt` and writes `output.txt` in the configured folder | Python standard library |
| [SQL keyword uppercase](sql_keyword_to_uppercase.py) | Reads a SQL file and prints text with selected space-delimited keywords uppercased | Python standard library |
| [XML to CSV](xml_to_csv.py) | Reads flat XML with consistently ordered fields and writes a CSV using paths configured in the script | Python standard library |
| [Pipe formatter](format_piped_code.py) | Prints the formatted version of the R example embedded in the script | Python standard library |
| [Clear Downloads](clear_downloads.py) | Moves files and folders from `~/Downloads` to the system trash | `Send2Trash` and a supported system trash |
| [Empty Recycle Bin](clear_recycle_bin.py) | Empties the entire Windows Recycle Bin without confirmation | Windows, `winshell`, `pywin32` |
| [Outlook holidays](create_outlook_sa_holidays.py) | Creates all-day, out-of-office appointments from the hard-coded 2025 South Australian holiday list | Windows, classic Outlook, `pywin32` |
| [Type clipboard](type_clipboard.py) | Types clipboard text into the focused window after a three-second countdown | Interactive desktop, `PyAutoGUI`, `pyperclip` |

Run the keyword tool from the repository root:

```bash
python Python/sql_keyword_to_uppercase.py query.sql
```

For the SQL cleaner, set `folder` in `sql_cleaner/clean_sql.py` to a working directory, copy [the example input](sql_cleaner/example_input.txt) there as `input.txt`, then run `python Python/sql_cleaner/clean_sql.py`. Compare `output.txt` with [the expected output](sql_cleaner/example_expected.txt). For the XML converter, set `xml_file` and `csv_file` in `xml_to_csv.py`, then run `python Python/xml_to_csv.py`. Both tools overwrite their configured output file. Install the packages listed for the desktop tool you plan to use, for example `python -m pip install Send2Trash`.

The Outlook script creates appointments on every run. Update the holiday dates before using it for another year. Review the contents of Downloads or the Recycle Bin before running the cleanup scripts.

## Type clipboard text

```bash
python -m pip install PyAutoGUI pyperclip
python Python/type_clipboard.py
```

Copy the text before pressing Enter in the terminal, then focus the intended text field within three seconds. The script sends Shift+Enter between lines. It adds a space after every `+`, and some symbols depend on the keyboard layout. Use a scratch text field first. Move the mouse to a screen corner to trigger PyAutoGUI’s fail-safe.
