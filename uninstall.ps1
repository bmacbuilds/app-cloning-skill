# Removes App Cloning on Windows: only the skill folders our installer marked as ours. The apps you built are never touched.
$ErrorActionPreference = "Stop"
$removed = $false
foreach ($name in "appcloning", "bmac-appcloning") {
  $dir = Join-Path $HOME ".claude\skills\$name"
  if (-not (Test-Path $dir)) { continue }
  if (Test-Path (Join-Path $dir ".appcloning-install")) {
    Remove-Item -Recurse -Force $dir; $removed = $true
    Write-Output "Removed /$name ($dir)."
  } else {
    Write-Output "Left $dir alone: it is not an App Cloning installation."
  }
}
if (-not $removed) { Write-Output "App Cloning was not installed." }
