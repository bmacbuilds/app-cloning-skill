# Installs App Cloning on Windows: one folder in %USERPROFILE%\.claude\skills\, and nothing else on the computer.
#
#   powershell -ExecutionPolicy Bypass -File install.ps1                         the latest release
#   ... install.ps1 -From PATH        a release folder or .zip on this computer
#   ... install.ps1 -Update           replace an earlier App Cloning without asking
#   ... install.ps1 -Name bmac-appcloning   install as /bmac-appcloning instead of /appcloning
#   ... install.ps1 -Replace          move someone else's /appcloning aside (kept as a backup)
#
# It never deletes anything that is not ours, never leaves half an installation, and asks before it changes
# anything that is already there. Uninstall with uninstall.ps1.
param(
  [string]$From = "",
  [switch]$Update,
  [switch]$Replace,
  [ValidateSet("appcloning", "bmac-appcloning")][string]$Name = "appcloning",
  [switch]$Yes
)
$ErrorActionPreference = "Stop"
$Fallback = "bmac-appcloning"
$ReleaseUrl = if ($env:APPCLONING_RELEASE_URL) { $env:APPCLONING_RELEASE_URL } else {
  "https://github.com/bmacbuilds/app-cloning-skill/archive/refs/tags/v1.0.0.zip" }
$Marker = ".appcloning-install"
$Stages = "recon","architect","design","build","backend","test","diff","entrepreneur","brand","launch","deploy"

function Fail($why) { Write-Error "App Cloning was not installed: $why" -ErrorAction Continue; throw "stop" }
function Ask($question) {
  if ($Yes) { return $true }
  if ($env:APPCLONING_NO_PROMPT -or -not [Environment]::UserInteractive -or [Console]::IsInputRedirected) { return $false }
  $answer = Read-Host "$question [y/N]"
  return $answer -match '^(y|yes)$'
}

$Skills = Join-Path $HOME ".claude\skills"
$Dest = Join-Path $Skills $Name
$Stage = Join-Path ([IO.Path]::GetTempPath()) ("appcloning." + [Guid]::NewGuid().ToString("N"))
$New = $null; $Old = $null; $Backup = $null; $Done = $false
New-Item -ItemType Directory -Path $Stage | Out-Null

try {
  # 1. Claude Code. The files are harmless without it, so a missing Claude Code is a note, not a stop.
  if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
    Write-Output "Note: Claude Code was not found on this computer. App Cloning runs inside it: install Claude Code from"
    Write-Output "      https://code.claude.com, then type /$Name in it."
  }

  # 2. The release, staged in a temporary folder.
  if (-not $From) {
    $From = Join-Path $Stage "release.zip"
    try { Invoke-WebRequest -Uri $ReleaseUrl -OutFile $From -UseBasicParsing } catch { Fail "the download failed ($ReleaseUrl)" }
  }
  if (Test-Path $From -PathType Container) {
    Copy-Item -Recurse $From (Join-Path $Stage "appcloning")
  } elseif (Test-Path $From -PathType Leaf) {
    try { Expand-Archive -Path $From -DestinationPath (Join-Path $Stage "unpacked") } catch { Fail "$From is not a readable release" }
    $unpacked = Join-Path $Stage "unpacked"   # GitHub wraps the release in one folder
    $found = @(Get-ChildItem -Path $unpacked -Directory -Filter appcloning) + @(Get-ChildItem -Path $unpacked -Directory | ForEach-Object { Get-ChildItem -Path $_.FullName -Directory -Filter appcloning })
    if ($found.Count -ne 1) { Fail "$From has no single appcloning folder" }
    Move-Item $found[0].FullName (Join-Path $Stage "appcloning")
  } else { Fail "$From was not found" }
  $Pkg = Join-Path $Stage "appcloning"

  # 3. Every required file, before anything is touched.
  foreach ($f in "SKILL.md","NOTICE","VERSION") { if (-not (Test-Path (Join-Path $Pkg $f))) { Fail "the release is missing $f" } }
  foreach ($s in $Stages) { if (-not (Test-Path (Join-Path $Pkg "foundation\$s\STAGE.md"))) { Fail "the release is missing the $s stage" } }
  $skill = Join-Path $Pkg "SKILL.md"
  if (-not (Select-String -Path $skill -Pattern '^name: appcloning\r?$' -Quiet)) { Fail "the release's SKILL.md is not App Cloning" }
  $Version = (Get-Content (Join-Path $Pkg "VERSION") -TotalCount 1).Trim()
  if ($Name -ne "appcloning") {
    $text = [IO.File]::ReadAllText($skill) -replace '(?m)^name: appcloning(\r?)$', "name: $Name`$1"   # Windows line ends too
    [IO.File]::WriteAllText($skill, $text)
  }
  Set-Content -Path (Join-Path $Pkg $Marker) -Value "App Cloning $Version, installed as /$Name by install.ps1. uninstall.ps1 removes only folders with this file."

  # 4. What is already there.
  New-Item -ItemType Directory -Force -Path $Skills | Out-Null
  if (Test-Path $Dest) {
    if (Test-Path (Join-Path $Dest $Marker)) {
      if (-not $Update -and -not (Ask "App Cloning is already installed as /$Name. Replace it with $Version?")) {
        Fail "an earlier App Cloning is installed as /$Name and was kept. Run again with -Update to replace it."
      }
    } elseif ($Replace -or (Ask "Another skill is already installed as /$Name at $Dest. Move it aside (it is kept as a backup) and install App Cloning?")) {
      $Backup = "$Dest.backup-" + (Get-Date -Format "yyyyMMddHHmmss")
      Move-Item $Dest $Backup
    } else {
      Fail "another skill is already installed as /$Name, and it was not touched. Install App Cloning as /$Fallback instead with: -Name $Fallback"
    }
  }

  # 5. One move into place: a failure never leaves half an installation, and the old version comes back.
  $New = Join-Path $Skills ".$Name.new.$PID"
  Copy-Item -Recurse $Pkg $New
  if ($env:APPCLONING_FAIL_AT -eq "copy") { Fail "test: stopping after the copy" }
  if (Test-Path $Dest) { $Old = Join-Path $Skills ".$Name.old.$PID"; Move-Item $Dest $Old }
  if ($env:APPCLONING_FAIL_AT -eq "swap") { Fail "test: stopping mid-swap" }
  Move-Item $New $Dest; $New = $null; $Done = $true
  if ($Old) { Remove-Item -Recurse -Force $Old; $Old = $null }
  if ($Backup) { Write-Output "Your earlier /$Name skill was kept at $Backup." }

  # 6. Anything that could still answer to the same name.
  if (Test-Path (Join-Path $HOME ".claude\commands\$Name.md")) { Write-Output "Note: you also have .claude\commands\$Name.md. The App Cloning skill takes precedence; that file was left alone." }
  if (Test-Path (Join-Path (Get-Location) ".claude\skills\$Name")) { Write-Output "Note: this project has its own /$Name skill. Your personal App Cloning takes precedence over it." }
  if (-not (Get-Command python -ErrorAction SilentlyContinue) -and -not (Get-Command python3 -ErrorAction SilentlyContinue)) {
    Write-Output "Note: Python 3 was not found. App Cloning works without it; a few of its checks need it." }

  Write-Output ""
  Write-Output "App Cloning $Version is installed. Open Claude Code and type /$Name"
  Write-Output "If /$Name opens something else, your organization may have its own: run /skills in Claude Code to check,"
  Write-Output "or install App Cloning as /$Fallback with: -Name $Fallback"
} catch {
  if ($_.Exception.Message -ne "stop") { Write-Error "App Cloning was not installed: $($_.Exception.Message)" -ErrorAction Continue }
  $global:LASTEXITCODE = 1
  $failed = $true
} finally {
  Remove-Item -Recurse -Force $Stage -ErrorAction SilentlyContinue
  if ($New) { Remove-Item -Recurse -Force $New -ErrorAction SilentlyContinue }
  if (-not $Done -and -not (Test-Path $Dest)) {
    if ($Old -and (Test-Path $Old)) { Move-Item $Old $Dest }
    if ($Backup -and (Test-Path $Backup)) { Move-Item $Backup $Dest; Write-Output "Your earlier /$Name skill was put back." }
  }
}
if ($failed) { exit 1 }
