# Lixel OS

Lixel OS is a customizable desktop Linux operating system for PCs and virtual machines, featuring a Pixel-inspired design, dynamic theming, smooth animations, and a modern desktop experience.

> **Project status:** Early planning and repository scaffold. Lixel is not yet a bootable operating system, and no installable ISO images are available.

## Editions

| Edition | Description |
| --- | --- |
| **Lixel VM** | A VM-focused edition for Hyper-V, VirtualBox, and VMware Workstation. |
| **Lixel Normal** | The standard installation for a PC. Disk replacement is always clearly disclosed and explicitly confirmed. |
| **Lixel Dualboot** | Installs alongside an existing operating system while preserving it. |
| **Lixel Test** | Experimental builds, selectable through Lixel's update settings. |

All editions are intended to share one codebase.

## Project goals

- Adapt the supplied [Strontium OS reference](https://strontium.ingstudios.dev/home) into a desktop-first experience.
- Build an original Linux desktop shell with a clock-centered home experience.
- Support desktop keyboard, mouse, touchpad, and common PC displays.
- Provide expressive theming, smooth animations, settings, and built-in apps.
- Publish real, tested ISO images through [GitHub Releases](https://github.com/hypetech104-sudo/Lixel/releases) when release engineering is ready.

## Repository layout

- `shell/` — desktop shell.
- `apps/` — built-in applications (planned).
- `themes/` — themes and design tokens (planned).
- `installer/` — installation system requirements and implementation.
- `editions/` — edition-specific profiles.
- `docs/` — product specification, design reference, and roadmap.
- `.github/workflows/` — automated repository checks.

## Safety

The installer must never silently erase a disk. Lixel Dualboot must preserve the existing OS. Backups and clear recovery guidance are required before installation.

## Development status

See [the roadmap](docs/ROADMAP.md), [product specification](docs/PRODUCT_SPEC.md), and [reference/design notes](docs/REFERENCE_AND_DESIGN.md).

No ISO files are published yet. We will only attach ISO images to a release after they are built and tested.
