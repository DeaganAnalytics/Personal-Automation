# A script to clear the downloads folder

import os
from send2trash import send2trash

# Setting up downloads folder
downloads_folder = os.path.expanduser("~/Downloads")
items = os.listdir(downloads_folder)

# Print the count of items in the folder
item_count = len(items)
print(f"Total items in Downloads folder: {item_count}")

# Check if there are any items in the folder
if not items:
    print("No items to move to the recycle bin. Exiting script.")
else:
    # Move items to the recycle bin
    for item in items:
        item_path = os.path.join(downloads_folder, item)
        normalized_path = os.path.normpath(item_path)

        if os.path.isfile(normalized_path):
            send2trash(normalized_path)
            print(f"Moved to recycle bin: {normalized_path}")
        elif os.path.isdir(normalized_path):
            send2trash(normalized_path)
            print(f"Moved folder to recycle bin: {normalized_path}")

    print("\nAll items moved to the recycle bin successfully.")
