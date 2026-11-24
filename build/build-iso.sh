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

cp -a "$ROOT/build/." "$WORK/"
cd "$WORK"

# Keep the edition identity inside the live filesystem.
mkdir -p config/includes.chroot/etc
printf '%s\n' "$EDITION" > config/includes.chroot/etc/lixel-edition

if [[ "$EDITION" == "VM" ]]; then
  cat config/package-lists/lixel-vm.list.chroot >> config/package-lists/lixel-base.list.chroot
fi

lb config \
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
