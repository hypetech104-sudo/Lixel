# Lixel OS Roadmap

This roadmap tracks the project from specification to installable releases. Items are not complete until implementation and tests exist.

## Phase 0 — Project foundation
- [x] Create the public repository and initial project specification.
- [ ] Confirm the reference UI details and document desktop adaptations.
- [ ] Choose the Linux base distribution and release/update strategy.
- [ ] Choose the desktop-shell toolkit and architecture.

## Phase 1 — Desktop prototype
- [ ] Build the desktop shell window/session.
- [ ] Implement the clock, date, home surface, navigation, and app launcher.
- [ ] Implement settings, theme selection, and dynamic accent colors.
- [ ] Add keyboard navigation, accessibility, and responsive desktop layouts.
- [ ] Add visual regression screenshots and basic automated tests.

## Phase 2 — Linux integration
- [ ] Package and launch the shell in a Linux desktop session.
- [ ] Integrate networking, audio, display, power, storage, and user-session controls.
- [ ] Add core desktop utilities and application management.
- [ ] Test on physical hardware and supported virtual machines.

## Phase 3 — Installers and editions
- [ ] Create the VM installer profile.
- [ ] Create the Normal installer with explicit destructive-action safeguards.
- [ ] Create the Dualboot installer with partition-preservation safeguards.
- [ ] Add the in-system Test update channel.

## Phase 4 — Release engineering
- [ ] Build reproducible ISO images in CI.
- [ ] Run boot, install, and upgrade smoke tests.
- [ ] Publish checksums and release notes.
- [ ] Publish tested images to GitHub Releases.

## Release policy

No placeholder, empty, or untested ISO files. A release page should only advertise images that were actually generated and passed the project's release checks.
