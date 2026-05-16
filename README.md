# clip2claude

**Win+Shift+S → Ctrl+V. Done.**

Takes your Windows screenshot and instantly puts the file path on your clipboard — ready to paste into Claude Code.

No second hotkey. No GUI. No bullshit.

![demo](https://raw.githubusercontent.com/howmindswork/clip2claude/main/demo.gif)

---

## The Problem

Claude Code on WSL2 can't read images from your clipboard. So you take a screenshot, then... what? Save it manually, find the WSL path, type it in? No.

## The Fix

Two files. Runs in the background. Completely automatic.

```
Win+Shift+S  →  select region  →  Ctrl+V in Claude Code
```

That's the entire workflow.

---

## Install

**Requirements:** Windows 10/11, WSL2, [AutoHotkey v2](https://www.autohotkey.com/)

**1. Download both files**

```
clip-save.ahk
clip-save.ps1
```

Place them both in `C:\Users\YOUR_NAME\`

**2. Edit the save path**

Open `clip-save.ps1` and change line 7 to your screenshots folder:

```powershell
$dir = "E:\Pictures\Screenshots"   # ← change this
```

And line 15 to the matching WSL path:

```powershell
$wslPath = "/mnt/e/Pictures/Screenshots/screenshot_$ts.png"   # ← match above
```

**3. Run the AHK script**

Double-click `clip-save.ahk` — or add it to your Windows startup folder so it runs automatically:

```
Win+R → shell:startup → paste a shortcut to clip-save.ahk
```

---

## Usage

1. `Win+Shift+S` — select any region of your screen
2. `Ctrl+V` in Claude Code — paste the file path

Claude reads the image. You're done.

A tray notification confirms each save.

---

## How It Works

- AutoHotkey watches the clipboard via `OnClipboardChange`
- The moment a screenshot hits the clipboard, it fires a hidden PowerShell script
- PowerShell saves the PNG with a timestamp, converts the Windows path to a WSL-compatible `/mnt/...` path, and puts that text on your clipboard
- You paste text (the path), not an image — works in every terminal

---

## Files

| File | Purpose |
|------|---------|
| `clip-save.ahk` | Clipboard watcher — triggers automatically on screenshot |
| `clip-save.ps1` | Saves PNG, puts WSL path on clipboard |

---

## FAQ

**Does it work with the Snipping Tool / other screenshot apps?**  
Yes — anything that puts an image on the Windows clipboard.

**Does it work with VS Code terminal?**  
Yes. Any terminal.

**What if I'm not on WSL2?**  
Change `$wslPath` in `clip-save.ps1` to just use the Windows path directly.

**Will this break if Anthropic adds native clipboard support?**  
Yes, and that would be great news. Until then, this works.

---

## License

MIT
