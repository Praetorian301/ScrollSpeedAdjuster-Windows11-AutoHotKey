#SingleInstance Force
#NoEnv
ListLines Off

; ---- Windows constants ----
SPI_GETWHEELSCROLLLINES := 0x0068
SPI_SETWHEELSCROLLLINES := 0x0069
SPIF_UPDATEINIFILE      := 0x0001
SPIF_SENDCHANGE         := 0x0002
SPIF_BOTH               := SPIF_UPDATEINIFILE | SPIF_SENDCHANGE

; Define the 4 preset values (within range 5-25)
presetValues := [5, 12, 18, 25]
currentPresetIndex := 1

; ---- Hotkeys for your mouse sensitivity buttons ----
F19::CycleScrollPresets()  ; Cycles through 5, 12, 18, 25
F20::SetScrollLines(5)     ; Always resets to 5

CycleScrollPresets() {
    global presetValues, currentPresetIndex
    
    ; Move to next preset (cycle back to first after last)
    currentPresetIndex++
    if (currentPresetIndex > presetValues.Length()) {
        currentPresetIndex := 1
    }
    
    ; Get the new value
    newLines := presetValues[currentPresetIndex]
    
    ; Apply the new setting
    SetScrollLines(newLines)
}

SetScrollLines(val) {
    global SPI_SETWHEELSCROLLLINES, SPIF_BOTH
    
    ; Get current value for display
    currentLines := GetScrollLines()
    
    ; Apply the new setting
    DllCall("SystemParametersInfo", "UInt", SPI_SETWHEELSCROLLLINES, "UInt", val, "UInt", 0, "UInt", SPIF_BOTH)
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Control Panel\Desktop, WheelScrollLines, %val%
    
    ; Show confirmation with previous value
    prevDisplay := (currentLines = -1) ? "Page" : currentLines
    TrayTip, Scroll Lines, % "Changed: " prevDisplay " → " val " lines", 1000
    SetTimer, __hide, -1100
}

GetScrollLines() {
    global SPI_GETWHEELSCROLLLINES
    if (DllCall("SystemParametersInfo", "UInt", SPI_GETWHEELSCROLLLINES, "UInt", 0, "UIntP", out, "UInt", 0))
        return out
    return 1
}

__hide:
    TrayTip
return