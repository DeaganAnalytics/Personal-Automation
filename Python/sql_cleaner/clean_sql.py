import argparse
import re
from pathlib import Path

# SQL keywords and common SQL Server functions
keywords = {
    "SELECT", "FROM", "WHERE", "WITH", "AS", "DISTINCT",
    "TOP", "INTO", "VALUES", "INSERT", "UPDATE", "DELETE",
    "SET", "DECLARE", "EXEC", "EXECUTE",
    "JOIN", "INNER", "LEFT", "RIGHT", "FULL", "OUTER",
    "CROSS", "APPLY", "ON", "UNION", "ALL",
    "GROUP", "BY", "ORDER", "HAVING", "ASC", "DESC",
    "CASE", "WHEN", "THEN", "ELSE", "END",
    "AND", "OR", "NOT", "IN", "IS", "NULL", "LIKE",
    "BETWEEN", "EXISTS", "ANY", "SOME",
    "CAST", "CONVERT", "TRY_CAST", "TRY_CONVERT",
    "ISNULL", "NULLIF", "COALESCE",
    "LTRIM", "RTRIM", "TRIM", "SUBSTRING",
    "REPLACE", "CONCAT", "LEN", "LOWER", "UPPER",
    "GETDATE", "DATEADD", "DATEDIFF", "DATEPART",
    "YEAR", "MONTH", "DAY", "COUNT", "SUM",
    "AVG", "MIN", "MAX", "ROUND",
    "OVER", "PARTITION", "ROW_NUMBER", "RANK",
    "UNBOUNDED", "PRECEDING", "FOLLOWING",
    "CURRENT", "ROW", "ROWS", "RANGE",
    "TRUE", "FALSE"
}

# Match SQL strings, comments, identifiers and ordinary words
token_pattern = re.compile(
    r"'(?:''|[^'])*'"           # Single-quoted strings
    r'|"(?:\"\"|[^"])*"'      # Double-quoted identifiers/strings
    r"|--[^\n]*"              # Single-line comments
    r"|/\*[\s\S]*?\*/"        # Block comments
    r"|\[[^\]]*(?:\]\][^\]]*)*\]"  # Bracketed identifiers
    r"|[A-Za-z_][A-Za-z_0-9]*"     # Words
)


def capitalise_keywords(match):
    word = match.group(0)

    # Only capitalise standalone SQL keywords
    if word.upper() in keywords:
        return word.upper()

    return word


def clean_sql(sql):
    # Restore Power BI line breaks
    sql = sql.replace("#(lf)", "\n")
    sql = sql.replace("#(cr)", "\r")
    sql = sql.replace("#(tab)", "\t")

    # Restore escaped SQL comment delimiters
    sql = sql.replace(r"\/*", "/*")
    sql = sql.replace(r"*\/", "*/")

    # Normalise line endings
    sql = sql.replace("\r\n", "\n").replace("\r", "\n")

    # Capitalise keywords while preserving strings and comments
    sql = token_pattern.sub(capitalise_keywords, sql)

    # Remove leading/trailing blank lines
    sql = sql.strip("\n")

    # Ensure one final newline
    return sql + "\n"


def main():
    parser = argparse.ArgumentParser(description="Clean SQL copied from Power BI.")
    parser.add_argument("input", type=Path, help="Text file containing SQL")
    parser.add_argument("output", type=Path, help="File for the cleaned SQL")
    args = parser.parse_args()

    sql = args.input.read_text(encoding="utf-8-sig")
    with args.output.open("w", encoding="utf-8", newline="\r\n") as output:
        output.write(clean_sql(sql))
    print(f"SQL cleaned successfully: {args.output}")


if __name__ == "__main__":
    main()
