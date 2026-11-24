# Lixel OS

Lixel OS is a customizable desktop Linux operating system for PCs and virtual machines, based on Debian and powered by KDE Plasma. It features a subtle Pixel-inspired design, dynamic theming, smooth animations, and a modern desktop experience.

> **Project status:** Early development. Lixel is not yet a bootable operating system, and no installable ISO images are available.

## Technology

- **Core operating system:** Debian Linux.
- **Desktop environment:** KDE Plasma.
- **Design direction:** KDE Plasma with subtle Pixel-inspired details and original Lixel branding.

## Editions

| Edition | Description |
| --- | --- |
| **Lixel VM** | A VM-focused edition for Hyper-V, VirtualBox, and VMware Workstation. |
| **Lixel Normal** | The standard installation for a PC. Disk replacement is always clearly disclosed and explicitly confirmed. |
| **Lixel Dualboot** | Installs alongside an existing operating system while preserving it. |
| **Lixel Test** | Experimental builds, selectable through Lixel's update settings. |

All editions share one codebase.

## Project goals

- Use Debian as the foundation and KDE Plasma as the desktop environment.
- Customize KDE Plasma with Lixel branding, wallpapers, icons, panels, widgets, and themes.
- Add subtle Pixel-inspired design elements.
- Support desktop keyboards, mice, touchpads, and common PC displays.
- Provide expressive theming, smooth animations, settings, and useful built-in apps.
- Publish real, tested ISO images through [GitHub Releases](https://github.com/hypetech104-sudo/Lixel/releases).

## Repository layout

- `plasma/` — KDE Plasma customization and configuration.
- `apps/` — built-in applications.
- `themes/` — themes, icons, and design tokens.
- `installer/` — installation system.
- `editions/` — edition-specific profiles.
- `docs/` — product specification, design reference, and roadmap.
- `.github/workflows/` — automated build and testing workflows.

## Safety

The installer must never silently erase a disk. Lixel Dualboot must preserve the existing operating system. Backups and clear recovery guidance are required before installation.

## Development status

See the [roadmap](docs/ROADMAP.md), [product specification](docs/PRODUCT_SPEC.md), and [reference/design notes](docs/REFERENCE_AND_DESIGN.md).

No ISO files are published yet. ISO images will only be attached to GitHub Releases after they are built and tested.
