# A script to clear the recyling bin on a windows pc.

import winshell

try:
    recycle_bin = winshell.recycle_bin()
    items = list(recycle_bin)
    item_count = len(items)

    if item_count > 0:
        recycle_bin.empty(confirm=False, show_progress=False, sound=False)
        print(f"Recycle bin contained {item_count} item(s)")
        print("Recycle bin has been emptied successfully.")
    else:
        print("Recycle bin is already empty.")
except Exception as e:
    print(f"Error checking or emptying recycle bin: {e}")
