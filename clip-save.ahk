; clip2claude — https://github.com/howmindswork/clip2claude
; Win+Shift+S → select region → Ctrl+V in Claude Code. That's it.

#Requires AutoHotkey v2.0

; Update this path to wherever you saved clip-save.ps1
global ScriptPath := "C:\Users\" A_UserName "\clip-save.ps1"

OnClipboardChange(ClipChanged)

ClipChanged(DataType) {
    if (DataType == 2) { ; 2 = image on clipboard
        Run 'powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File "' ScriptPath '"',, "Hide"
        Sleep 600
        TrayTip "Path copied — Ctrl+V into Claude Code", "clip2claude", 1
    }
}
