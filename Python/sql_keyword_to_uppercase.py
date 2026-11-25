import argparse
from pathlib import Path


def uppercase_specific_words(text, words_to_uppercase):
    """
    Convert specific words in the text to uppercase while preserving formatting.

    Args:
    - text (str): The input text.
    - words_to_uppercase (list): A list of words to be converted to uppercase.

    Returns:
    - str: The modified text with original formatting.
    """
    lines = text.split('\n')  # Split text into lines
    modified_lines = []

    for line in lines:
        words = line.split(' ')  # Split line into words
        modified_words = [
            word.upper() if word.lower() in words_to_uppercase else word for word in words
        ]
        modified_lines.append(' '.join(modified_words))

    modified_text = '\n'.join(modified_lines)  # Reconstruct text with original formatting
    return modified_text

# Specifying words to change
main_words = ["select", "top", "distinct", "from", "as", "exec", "insert", "replace", "update", "into", "set", "nocount", "declare", "drop", "table", "exists", "values", "begin", "try", "catch"]
condition_words = ["where", "and", "or", "in", "not", "is", "like"]
join_words = ["join", "inner", "left", "on", "union", "all"]
function_words = ["coalesce", "round", "cast", "case", "when", "end", "null", "substring", "concat"]
aggregate_function_words = ["max", "min", "sum"]
end_words = ["order", "group", "by", "having", "desc"]

words_to_change = main_words + condition_words + join_words + function_words + aggregate_function_words + end_words

def main():
    parser = argparse.ArgumentParser(description="Uppercase selected SQL keywords.")
    parser.add_argument("input", type=Path, help="SQL file to format")
    args = parser.parse_args()
    sql_text = args.input.read_text(encoding="utf-8-sig")
    print(uppercase_specific_words(sql_text, words_to_change))


if __name__ == "__main__":
    main()
