#!/usr/bin/env bash
# Shows keystrokes and mouse clicks on screen for live demos (KeyCastr).
set -euo pipefail

if ! command -v brew >/dev/null; then
  echo "Homebrew is required: https://brew.sh" >&2
  exit 1
fi

brew install --cask keycastr
open -a KeyCastr

cat <<'EOF'
Done. One-time manual steps (macOS will not let a script do these):
1. System Settings > Privacy & Security > Accessibility: enable KeyCastr.
2. System Settings > Privacy & Security > Input Monitoring: enable KeyCastr, then quit and reopen it.
3. KeyCastr menu bar icon > Settings: choose the "Svelte" visualizer, check "Display mouse clicks",
   raise font size, set the fade delay to ~3 s.
4. Bigger cursor (optional): System Settings > Accessibility > Display > Pointer size.
EOF
