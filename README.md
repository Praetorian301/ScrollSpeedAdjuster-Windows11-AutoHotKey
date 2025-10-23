# ScrollSpeedAdjuster-Windows11-AutoHotKey

A lightweight AutoHotKey script that lets you dynamically adjust your mouse or touchpad scroll speed on Windows 11. Perfect for fine-tuning sensitivity in games, documents, or browsers, with real-time speed control, customizable hotkeys, and minimal system load.

---

## What this does
This script allows you to modify and fine-tune your scroll wheel sensitivity on the fly. By scaling Windows’ default scroll speed, you can make scrolling smoother, faster, or more precise—all without leaving your current application.

---

## Features
- Adjustable scroll speed via hotkeys  
- Lightweight AHK build (no dependencies)  
- Works across all Windows 11 apps  
- Minimal CPU/memory usage  
- Easy to edit & customize  

---

## Quick Start
1. Install [AutoHotKey](https://www.autohotkey.com/).  
2. Download and open `Working Scroll.ahk`.  
3. Run the script and use **Ctrl + Up / Ctrl + Down** to change speed.  
4. Right-click the green **H** icon → Exit to stop.  

---

## Example
```ahk
scrollSpeed := 1.0
^Up::scrollSpeed += 0.2
^Down::scrollSpeed -= 0.2
WheelUp::Send {WheelUp %scrollSpeed%}
WheelDown::Send {WheelDown %scrollSpeed%}
