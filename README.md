# demo-input-overlay

Show your keystrokes and mouse clicks on screen during live demos, so the audience can follow along. I built it for a live PCB design demo in EasyEDA.

| OS | Keystrokes | Clicks |
|---|---|---|
| Windows | [Carnac](https://github.com/Code52/carnac) | PowerToys Mouse Highlighter |
| macOS | [KeyCastr](https://github.com/keycastr/keycastr) | KeyCastr ("Display mouse clicks") |

## Setup

**macOS**
```bash
git clone https://github.com/justintime1888/demo-input-overlay && cd demo-input-overlay
bash setup-mac.sh
```
After the script runs, finish the permission steps it prints. macOS only lets you grant Accessibility and Input Monitoring access in System Settings.

**Windows** (PowerShell)
```powershell
git clone https://github.com/justintime1888/demo-input-overlay; cd demo-input-overlay
powershell -ExecutionPolicy Bypass -File .\setup-windows.ps1
```
Then set up Carnac from its tray icon: Preferences → font size 40–60 → opacity ~100% → dark background → placement bottom-left → **Save** → **Start**.

## Before presenting
- Duplicate or mirror your display. Windows: `Win+P` → Duplicate. macOS: Control Center → Screen Mirroring → Mirror.
- Test it once. Type a key and click; you should see the key on screen and a ring where you clicked.
- Pause the overlay before typing a password. It shows every key you press.

## Goal (must hold on both OSes)
- Every keystroke and shortcut shows in large, readable text. Use a font size of 40 or more and a dark background.
- Left, right and middle clicks are all visible on screen.

## For an AI assistant setting this up
Detect the OS and run the matching script from the repo root, then check the goal above with the user. Have them press keys and do a left, right and middle click while watching the screen.

- **macOS:** walk the user through the permission steps the script prints. Don't try to grant those permissions yourself. After KeyCastr has been opened once, run `defaults read io.github.keycastr`, or look in `~/Library/Preferences/` for KeyCastr's plist, to find its real setting names. Then raise the font size and turn on mouse-click display with `defaults write`, and restart KeyCastr. If KeyCastr doesn't show middle clicks, tell the user. Don't claim it works.
- **Windows:** PowerToys Mouse Highlighter shows left and right clicks only, and `Win+Shift+H` toggles it. For middle clicks, turn on Carnac's "Show mouse clicks" and test it. Note that Windows PowerShell 5.1's `Set-Content -Encoding utf8` writes a BOM. PowerToys then ignores the file, so write settings without a BOM.
