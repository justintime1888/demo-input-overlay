# demo-input-overlay

Show your keystrokes and mouse clicks on screen during live demos, so the audience can follow along. I built it for a live PCB design demo in EasyEDA.

| OS | Keystrokes | Clicks |
|---|---|---|
| Windows | [Carnac](https://github.com/Code52/carnac) | PowerToys Mouse Highlighter |
| macOS | [KeyCastr](https://github.com/keycastr/keycastr) | KeyCastr ("Display mouse clicks") |

## Setup

**macOS**
```bash
git clone https://github.com/<you>/demo-input-overlay && cd demo-input-overlay
bash setup-mac.sh
```
After the script runs, finish the permission steps it prints. macOS only lets you grant Accessibility and Input Monitoring access in System Settings.

**Windows** (PowerShell)
```powershell
git clone https://github.com/<you>/demo-input-overlay; cd demo-input-overlay
powershell -ExecutionPolicy Bypass -File .\setup-windows.ps1
```
Then set up Carnac from its tray icon: Preferences → font size 40–60 → opacity ~100% → dark background → placement bottom-left → **Save** → **Start**.

## Before presenting
- Duplicate or mirror your display. Windows: `Win+P` → Duplicate. macOS: Control Center → Screen Mirroring → Mirror.
- Test it once. Type a key and click; you should see the key on screen and a ring where you clicked.
- Pause the overlay before typing a password. It shows every key you press.

## For an AI assistant setting this up
Detect the OS and run the matching script from the repo root. On macOS, walk the user through the printed permission steps. Don't try to grant those permissions yourself. On Windows, Mouse Highlighter can be toggled with `Win+Shift+H` if clicks don't show.
