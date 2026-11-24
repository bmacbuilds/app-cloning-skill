#!/usr/bin/env bash
# Installs App Cloning: one folder in ~/.claude/skills/, and nothing else on the computer.
#
#   bash install.sh                           the latest release
#   bash install.sh --from PATH               a release folder or .tar.gz on this computer
#   bash install.sh --update                  replace an earlier App Cloning without asking
#   bash install.sh --name bmac-appcloning    install as /bmac-appcloning instead of /appcloning
#   bash install.sh --replace                 move someone else's /appcloning aside (kept as a backup)
#
# It never deletes anything that is not ours, never leaves half an installation, and asks before it changes
# anything that is already there. Uninstall with uninstall.sh.
set -euo pipefail

NAME="appcloning"
FALLBACK="bmac-appcloning"
RELEASE_URL="${APPCLONING_RELEASE_URL:-https://github.com/bmacbuilds/app-cloning-skill/archive/refs/tags/v1.0.0.tar.gz}"
MARKER=".appcloning-install"
STAGES="recon architect design build backend test diff entrepreneur brand launch deploy"
FROM="" UPDATE=0 REPLACE=0 ASSUME_YES=0

say() { printf '%s\n' "$*"; }
fail() { printf 'App Cloning was not installed: %s\n' "$*" >&2; exit 1; }

while [ $# -gt 0 ]; do
  case "$1" in
    --from) FROM="${2:?--from needs a folder or a .tar.gz}"; shift 2 ;;
    --update) UPDATE=1; shift ;;
    --replace) REPLACE=1; shift ;;
    --name) NAME="${2:?--name needs a name}"; shift 2 ;;
    --yes) ASSUME_YES=1; shift ;;
    -h|--help) sed -n '2,11p' "$0"; exit 0 ;;
    *) fail "unknown option $1 (try --help)" ;;
  esac
done
case "$NAME" in appcloning|"$FALLBACK") ;; *) fail "the name is /appcloning or /$FALLBACK" ;; esac

ask() {  # ask "question" -> 0 for yes. With no one to ask (no terminal), the answer is no, unless --yes.
  [ "$ASSUME_YES" = 1 ] && return 0
  local answer=""
  if [ -t 0 ]; then
    printf '%s [y/N] ' "$1"; read -r answer || return 1
  elif [ -z "${APPCLONING_NO_PROMPT:-}" ] && { : </dev/tty; } 2>/dev/null; then   # run as curl ... | bash
    printf '%s [y/N] ' "$1" >/dev/tty; read -r answer </dev/tty || return 1
  else
    return 1
  fi
  case "$answer" in y|Y|yes|Yes) return 0 ;; *) return 1 ;; esac
}

SKILLS="$HOME/.claude/skills"
DEST="$SKILLS/$NAME"
STAGE="$(mktemp -d "${TMPDIR:-/tmp}/appcloning.XXXXXX")"
NEW="" OLD="" BACKUP="" DONE=0
cleanup() {
  rm -rf "$STAGE"
  [ -n "$NEW" ] && rm -rf "$NEW"
  if [ "$DONE" != 1 ] && [ ! -e "$DEST" ]; then          # not installed: put back whatever was there
    if [ -n "$OLD" ] && [ -d "$OLD" ]; then mv "$OLD" "$DEST"; fi
    if [ -n "$BACKUP" ] && [ -d "$BACKUP" ]; then mv "$BACKUP" "$DEST"; say "Your earlier /$NAME skill was put back."; fi
  fi
  return 0
}
trap cleanup EXIT

# 1. Claude Code. The files are harmless without it, so a missing Claude Code is a note, not a stop.
if ! command -v claude >/dev/null 2>&1; then
  say "Note: Claude Code was not found on this computer. App Cloning runs inside it: install Claude Code from"
  say "      https://code.claude.com, then type /$NAME in it."
fi

# 2. The release, staged in a temporary folder.
if [ -z "$FROM" ]; then
  command -v curl >/dev/null 2>&1 || fail "curl is needed to download the release"
  curl -fsSL "$RELEASE_URL" -o "$STAGE/release.tar.gz" || fail "the download failed ($RELEASE_URL)"
  FROM="$STAGE/release.tar.gz"
fi
if [ -d "$FROM" ]; then
  cp -R "$FROM" "$STAGE/appcloning"
elif [ -f "$FROM" ]; then
  mkdir "$STAGE/unpacked" && tar -xzf "$FROM" -C "$STAGE/unpacked" || fail "$FROM is not a readable release"
  found="$(find "$STAGE/unpacked" -mindepth 1 -maxdepth 2 -type d -name appcloning | head -n 2)"   # GitHub wraps it in one folder
  [ -n "$found" ] && [ "$(printf '%s\n' "$found" | wc -l | tr -d ' ')" = 1 ] || fail "$FROM has no single appcloning/ folder"
  mv "$found" "$STAGE/appcloning"
else
  fail "$FROM was not found"
fi
PKG="$STAGE/appcloning"

# 3. Every required file, before anything is touched.
for f in SKILL.md NOTICE VERSION; do [ -f "$PKG/$f" ] || fail "the release is missing $f"; done
for s in $STAGES; do [ -f "$PKG/foundation/$s/STAGE.md" ] || fail "the release is missing the $s stage"; done
grep -q '^name: appcloning$' "$PKG/SKILL.md" || fail "the release's SKILL.md is not App Cloning"
VERSION="$(head -n 1 "$PKG/VERSION")"
if [ "$NAME" != "appcloning" ]; then
  sed "s/^name: appcloning$/name: $NAME/" "$PKG/SKILL.md" > "$PKG/SKILL.md.named" && mv "$PKG/SKILL.md.named" "$PKG/SKILL.md"
fi
printf 'App Cloning %s, installed as /%s by install.sh. uninstall.sh removes only folders with this file.\n' \
  "$VERSION" "$NAME" > "$PKG/$MARKER"

# 4. What is already there.
mkdir -p "$SKILLS"
if [ -e "$DEST" ]; then
  if [ -f "$DEST/$MARKER" ]; then
    if [ "$UPDATE" != 1 ] && ! ask "App Cloning ($(head -c 60 "$DEST/$MARKER" | cut -d, -f1)) is already installed as /$NAME. Replace it with $VERSION?"; then
      fail "an earlier App Cloning is installed as /$NAME and was kept. Run again with --update to replace it."
    fi
  elif [ "$REPLACE" = 1 ] || ask "Another skill is already installed as /$NAME at $DEST. Move it aside (it is kept as a backup) and install App Cloning?"; then
    BACKUP="$DEST.backup-$(date +%Y%m%d%H%M%S)"
    mv "$DEST" "$BACKUP"
  else
    fail "another skill is already installed as /$NAME, and it was not touched. Install App Cloning as /$FALLBACK instead with: --name $FALLBACK"
  fi
fi

# 5. One move into place: a failure never leaves half an installation, and the old version comes back.
NEW="$SKILLS/.$NAME.new.$$"
cp -R "$PKG" "$NEW"
[ "${APPCLONING_FAIL_AT:-}" = "copy" ] && { say "test: stopping after the copy"; exit 1; }
if [ -e "$DEST" ]; then OLD="$SKILLS/.$NAME.old.$$"; mv "$DEST" "$OLD"; fi
[ "${APPCLONING_FAIL_AT:-}" = "swap" ] && { say "test: stopping mid-swap"; exit 1; }
mv "$NEW" "$DEST"; NEW=""; DONE=1
[ -n "$OLD" ] && rm -rf "$OLD"; OLD=""
[ -n "$BACKUP" ] && say "Your earlier /$NAME skill was kept at $BACKUP."

# 6. Anything that could still answer to the same name.
[ -f "$HOME/.claude/commands/$NAME.md" ] && say "Note: you also have $HOME/.claude/commands/$NAME.md. The App Cloning skill takes precedence; that file was left alone."
[ -d "$PWD/.claude/skills/$NAME" ] && say "Note: this project has its own /$NAME skill. Your personal App Cloning takes precedence over it."
command -v python3 >/dev/null 2>&1 || say "Note: Python 3 was not found. App Cloning works without it; a few of its checks need it."

say ""
say "App Cloning $VERSION is installed. Open Claude Code and type /$NAME"
say "If /$NAME opens something else, your organization may have its own: run /skills in Claude Code to check,"
say "or install App Cloning as /$FALLBACK with: --name $FALLBACK"
