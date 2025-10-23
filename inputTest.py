from pynput import keyboard, mouse

# Callback for keyboard events
def on_press(key):
    try:
        print(f"Key pressed: {key.char}")
    except AttributeError:
        print(f"Special key pressed: {key}")

def on_release(key):
    if key == keyboard.Key.esc:  # Stop listener with ESC
        return False

# Callback for mouse button events
def on_click(x, y, button, pressed):
    if pressed:
        print(f"Mouse button pressed: {button}")

# Start listeners
keyboard_listener = keyboard.Listener(on_press=on_press, on_release=on_release)
mouse_listener = mouse.Listener(on_click=on_click)

keyboard_listener.start()
mouse_listener.start()

keyboard_listener.join()
mouse_listener.join()
