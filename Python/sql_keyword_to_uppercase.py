import os

test_folder = <insert folder path here>

# Specify file name
file_name = "test2.sql"

# Specify the path to your SQL file
sql_file_path = os.path.join(test_folder, file_name)

# Read the contents of the SQL file and stores in as sql_text
with open(sql_file_path, 'r') as file:
    sql_text = file.read()

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

result = uppercase_specific_words(sql_text, words_to_change)
print(result)
