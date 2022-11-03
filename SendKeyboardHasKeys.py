import keyboard
import pyperclip

shortcut = 'command+b'
print('Hotkey set as:', shortcut)

def on_triggered():
    keyboard.write(pyperclip.paste())

keyboard.add_hotkey(shortcut, on_triggered)

print("Press ESC to stop.")
keyboard.wait('esc')