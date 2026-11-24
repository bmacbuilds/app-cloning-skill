# Removes App Cloning on Windows: only the skill folders our installer marked as ours. The apps you built are never touched.
$ErrorActionPreference = "Stop"
$Stages = "recon","architect","design","build","backend","test","diff","entrepreneur","brand","launch","deploy"
$removed = 0
foreach ($base in "appcloning", "bmac-appcloning") {
  foreach ($name in @($base) + @($Stages | ForEach-Object { "$base-$_" })) {
    $dir = Join-Path $HOME ".claude\skills\$name"
    if (-not (Test-Path -LiteralPath $dir)) { continue }
    if (Test-Path -LiteralPath (Join-Path $dir ".appcloning-install")) {
      Remove-Item -Recurse -Force -LiteralPath $dir; $removed++
    } else {
      Write-Output "Left $dir alone: it is not an App Cloning installation."
    }
  }
}
if ($removed -gt 0) { Write-Output "Removed App Cloning ($removed skill folders)." } else { Write-Output "App Cloning was not installed." }
