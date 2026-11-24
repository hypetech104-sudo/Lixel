# Lixel ISO build

The first build target is a Debian Trixie amd64 live image using KDE Plasma and Debian live-build.

## Build locally

On a Debian-based build machine with root access and the packages listed in the GitHub Actions workflow installed:

```bash
sudo bash build/build-iso.sh VM
```

Supported profiles: `VM`, `Normal`, `Dualboot`, and `Test`.

## GitHub Actions

Open **Actions → Build Lixel OS ISO → Run workflow**, select an edition, and start the workflow. The resulting ISO and SHA-256 checksum are uploaded as a workflow artifact.

## Current prototype limits

- These are live-session prototype images, not finished installers.
- The Normal and Dualboot profiles do not repartition or install to disks.
- The VM profile adds guest integration packages.
- The four profiles are early build targets and still need boot, hardware, installer, and safety testing.
- Do not publish these prototype artifacts as stable releases.
