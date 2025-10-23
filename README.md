# ScrollSpeedAdjuster-Windows11-AutoHotKey

A lightweight AutoHotKey script that lets you dynamically change your system-wide mouse scroll speed on Windows 11 using customizable hotkeys. Designed for smooth control, fast switching between preset sensitivities, and minimal system load.

---

## What this does
This script adjusts the Windows scroll-wheel sensitivity directly via system parameters.  
It cycles between four customizable scroll speed presets, allowing you to instantly switch between slow, medium, and fast scrolling profiles.

It’s perfect for users who work across different applications that require varied scroll behaviors — such as browsers, code editors, spreadsheets, or games.

---

## Features
- Written in pure AutoHotKey (no dependencies)  
- Four scroll speed presets (default: 5, 12, 18, 25)  
- Cycles or resets instantly with hotkeys  
- Works globally across all Windows 11 apps  
- Lightweight — runs silently in the background  
- Tray notifications display current scroll speed  

---

## Quick Start
1. Install [AutoHotKey](https://www.autohotkey.com/).  
2. Download this repository and open `ScrollSpeedAdjuster-Windows11-AutoHotKey.ahk`.  
3. Double-click the script to run it.  
4. Use **F19** to cycle through scroll speeds *(5 → 12 → 18 → 25 → 5)*.  
5. Press **F20** to instantly reset the scroll speed to **5 lines per notch**.  
6. Right-click the green **H** tray icon → *Exit* to close the script.  

---

## 🖱️ Razer Synapse Integration
This script is configured for **Razer Synapse** users, particularly those with a **Razer DeathAdder V2 X Hyperspeed** or similar device.

In **Razer Synapse**, assign:
- **F19** → *Upper side button* (previously Mouse Button 5)  
- **F20** → *Lower side button* (previously Mouse Button 4)  

These virtual keys don’t exist on standard keyboards — Synapse generates them so AutoHotKey can detect your side buttons without conflicting with system inputs.

If you’re using other software (e.g., Logitech G Hub, Corsair iCUE), map your preferred buttons to **F19** and **F20**, or edit the script directly to use other keys.

---

## Customization
You can open the `.ahk` file in **Notepad** or any text editor to modify:
- The **hotkeys** used for cycling or resetting scroll speed  
- The **preset values** for scroll sensitivity  

By default:
- **F19** cycles between **5, 12, 18, 25 lines**  
- **F20** resets the scroll speed to **5 lines**

Example:
```ahk
; Preset values (adjust these as desired)
presetValues := [5, 12, 18, 25]

; Hotkeys (change to any keys you like)
F19::CycleScrollPresets()
F20::SetScrollLines(5)
