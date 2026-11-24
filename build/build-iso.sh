#!/usr/bin/env bash
set -Eeuo pipefail

EDITION="${1:-}"
case "$EDITION" in
  VM|Normal|Dualboot|Test) ;;
  *)
    echo "Usage: $0 {VM|Normal|Dualboot|Test}" >&2
    exit 2
    ;;
esac

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

mkdir -p "$WORK/config"
cp -a "$ROOT/build/package-lists" "$WORK/config/package-lists"
cd "$WORK"

# Keep the edition identity inside the live filesystem.
mkdir -p config/includes.chroot/etc
printf '%s\n' "$EDITION" > config/includes.chroot/etc/lixel-edition

# Install the Lixel wallpaper and apply it once for each user's first Plasma login.
WALLPAPER_SOURCE="$ROOT/build/wallpapers/Lixel-Wallpaper.png"
if [[ ! -f "$WALLPAPER_SOURCE" ]]; then
  echo "Missing default wallpaper: $WALLPAPER_SOURCE" >&2
  exit 1
fi

install -D -m 0644 "$WALLPAPER_SOURCE" \
  config/includes.chroot/usr/share/wallpapers/Lixel/Lixel-Wallpaper.png

mkdir -p config/includes.chroot/usr/local/bin config/includes.chroot/etc/xdg/autostart
cat > config/includes.chroot/usr/local/bin/lixel-set-default-wallpaper <<'WALLPAPER_SCRIPT'
#!/usr/bin/env bash
set -eu

WALLPAPER="/usr/share/wallpapers/Lixel/Lixel-Wallpaper.png"
MARKER="${XDG_CONFIG_HOME:-$HOME/.config}/lixel/default-wallpaper-applied"

# Do not overwrite a wallpaper the user has chosen after the first login.
if [[ -e "$MARKER" || ! -f "$WALLPAPER" ]]; then
  exit 0
fi

# Give Plasma a moment to finish starting its desktop session.
sleep 5
if plasma-apply-wallpaperimage --fill-mode preserveAspectCrop "$WALLPAPER"; then
  mkdir -p "$(dirname "$MARKER")"
  touch "$MARKER"
fi
WALLPAPER_SCRIPT
chmod 0755 config/includes.chroot/usr/local/bin/lixel-set-default-wallpaper

cat > config/includes.chroot/etc/xdg/autostart/lixel-default-wallpaper.desktop <<'AUTOSTART'
[Desktop Entry]
Type=Application
Name=Lixel Default Wallpaper
Comment=Apply the Lixel wallpaper on first login
Exec=/usr/local/bin/lixel-set-default-wallpaper
OnlyShowIn=KDE;
X-KDE-autostart-after=plasma-desktop
AUTOSTART

if [[ "$EDITION" == "VM" ]]; then
  cat config/package-lists/lixel-vm.list.chroot >> config/package-lists/lixel-base.list.chroot
fi

lb config \
  --mode debian \
  --distribution trixie \
  --architectures amd64 \
  --archive-areas "main contrib non-free non-free-firmware" \
  --binary-images iso-hybrid \
  --debian-installer none \
  --apt-recommends true \
  --bootappend-live "boot=live components username=lixel hostname=lixel"

lb build

ISO="$(find . -maxdepth 1 -type f -name '*.iso' -print -quit)"
if [[ -z "$ISO" ]]; then
  echo "live-build completed but no ISO file was found." >&2
  exit 1
fi

mkdir -p "$ROOT/dist"
cp "$ISO" "$ROOT/dist/Lixel-${EDITION}-amd64.iso"
sha256sum "$ROOT/dist/Lixel-${EDITION}-amd64.iso" > "$ROOT/dist/Lixel-${EDITION}-amd64.iso.sha256"
echo "Built $ROOT/dist/Lixel-${EDITION}-amd64.iso"
