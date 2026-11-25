import time
import pyautogui
import pyperclip

pyautogui.FAILSAFE = True
pyautogui.PAUSE = 0.001


# Characters that require Shift + another key
SPECIAL = {
    "*": ("shift", "8"),
    "_": ("shift", "-"),
    "{": ("shift", "["),
    "}": ("shift", "]"),
    "|": ("shift", "\\"),
}


def clear_modifiers():
    """Release any keys that may have been left stuck."""
    for key in ["shift", "ctrl", "alt", "win"]:
        pyautogui.keyUp(key)


def type_char(c):
    clear_modifiers()

    # Special handling for plus symbol
    # Avoids browser shortcut weirdness
    if c == "+":
        pyautogui.keyDown("shift")
        time.sleep(0.005)
        pyautogui.press("=")
        time.sleep(0.005)
        pyautogui.keyUp("shift")

        clear_modifiers()

        # Give browser time to process plus
        time.sleep(0.03)

        # Space after plus
        pyautogui.press(" ")

        return

    # Other shifted characters
    if c in SPECIAL:
        modifier, key = SPECIAL[c]

        pyautogui.keyDown(modifier)
        pyautogui.press(key)
        pyautogui.keyUp(modifier)

        clear_modifiers()

        return

    # Normal characters
    pyautogui.write(c)


def type_text(text):
    for c in text:
        type_char(c)


def shift_enter():
    """New line without submitting message."""
    clear_modifiers()

    pyautogui.keyDown("shift")
    time.sleep(0.01)
    pyautogui.press("enter")
    time.sleep(0.01)
    pyautogui.keyUp("shift")

    clear_modifiers()

    time.sleep(0.02)


print("Copy your text.")
input("Press Enter, then click website textbox within 3 seconds.")

text = pyperclip.paste()

time.sleep(3)

clear_modifiers()

lines = text.splitlines()

for i, line in enumerate(lines):
    type_text(line)

    if i < len(lines) - 1:
        shift_enter()

print("Done.")
