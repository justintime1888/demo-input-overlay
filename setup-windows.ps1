# Shows keystrokes (Carnac) and mouse clicks (PowerToys Mouse Highlighter) on screen for live demos.
winget install --id code52.Carnac -e --accept-source-agreements --accept-package-agreements --silent
winget install --id Microsoft.PowerToys -e --accept-source-agreements --accept-package-agreements --silent

# Start PowerToys once so it creates its settings files
$pt = @("$env:LOCALAPPDATA\PowerToys\PowerToys.exe", "$env:ProgramFiles\PowerToys\PowerToys.exe") | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $pt) { throw "PowerToys.exe not found after install" }
if (-not (Get-Process PowerToys -ErrorAction SilentlyContinue)) { Start-Process $pt; Start-Sleep 8 }

# PowerToys ignores settings files that start with a BOM, which Set-Content -Encoding utf8 writes on PS 5.1
function Write-NoBom($path, $text) { [IO.File]::WriteAllText($path, $text, (New-Object Text.UTF8Encoding $false)) }

# Enable Mouse Highlighter, always on, with big rings
$root = "$env:LOCALAPPDATA\Microsoft\PowerToys"
$main = Get-Content "$root\settings.json" -Raw | ConvertFrom-Json
$main.enabled.MouseHighlighter = $true
Write-NoBom "$root\settings.json" ($main | ConvertTo-Json -Depth 10 -Compress)

$mh = "$root\MouseHighlighter\settings.json"
if (Test-Path $mh) {
    $j = Get-Content $mh -Raw | ConvertFrom-Json
    $j.properties.auto_activate.value = $true
    $j.properties.highlight_radius.value = 45
    $j.properties.highlight_fade_delay_ms.value = 600
    if ($j.properties.ripple_size) { $j.properties.ripple_size.value = 90 }
    Write-NoBom $mh ($j | ConvertTo-Json -Depth 10 -Compress)
} else {
    Write-Warning "Mouse Highlighter settings not created yet: open PowerToys > Mouse Utilities > Mouse Highlighter, turn on 'Activate on startup', then rerun."
}

# Restart PowerToys to load the settings, then start Carnac
Get-Process PowerToys* -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Sleep 2
Start-Process $pt
Start-Process "$env:LOCALAPPDATA\carnac\Carnac.exe"
Write-Host "Done. Clicks: Win+Shift+H toggles rings. Keys: right-click Carnac tray icon > Preferences > set font/placement > Save > Start."
