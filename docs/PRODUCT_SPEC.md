# Lixel OS — Product Specification

## Vision

Lixel OS is a desktop-only Linux operating system for personal computers and virtual machines. Its visual direction is inspired by the supplied Strontium OS reference and the expressive, clock-centered interface discussed during project planning. Lixel will implement its own code, assets, branding, and desktop adaptations rather than copying another project's source or proprietary assets.

## Platforms

- Physical x86-64 desktop and laptop PCs.
- Hyper-V, VirtualBox, and VMware Workstation virtual machines.
- Keyboard, mouse, touchpad, common display resolutions, and multi-monitor setups.

Mobile phones and tablets are out of scope.

## Editions

| Edition | Purpose |
| --- | --- |
| Lixel VM | VM-friendly installation and device defaults for Hyper-V, VirtualBox, and VMware Workstation. |
| Lixel Normal | Main installation for a PC. Replacing an existing OS must require an explicit, clearly worded confirmation. |
| Lixel Dualboot | Installs alongside an existing OS without silently deleting or formatting its partitions. |
| Lixel Test | Experimental builds and opt-in update channel exposed from the installed Lixel system. |

The editions should share one source tree and differ through installer profiles, packages, and configuration—not separate operating-system codebases.

## Experience goals

- Preserve the reference's overall visual character and interaction patterns where practical.
- Rework layouts for desktop-sized displays and pointer/keyboard interaction.
- Provide a coherent desktop shell, clock/date experience, navigation, settings, and app launching.
- Use responsive layouts, smooth transitions, accessible contrast, and scalable typography.
- Support a consistent theme system and dynamic accent colors.

## Safety and reliability

- Never erase or repartition a disk without explicit user confirmation.
- The Dualboot installer must clearly identify the target disk and partitions and preserve the existing OS.
- Explain destructive actions in plain language and require a second confirmation.
- Provide recovery guidance and recommend backups before installation.
- Do not publish an ISO as a release until it has been built and smoke-tested.

## Current status

This repository is the initial project scaffold. It is not yet a bootable operating system and does not contain installable ISO images.
