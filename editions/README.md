# Lixel Editions

All editions share the same Lixel OS source tree. Edition-specific differences belong in installer profiles and configuration.

- `vm/` — VM device defaults and guest integration.
- `normal/` — standard single-OS installation profile.
- `dualboot/` — preserve-existing-OS installation profile.
- `test/` — experimental channel metadata and update policy.

Installer safeguards are mandatory. Do not add destructive disk operations without explicit user confirmation and tests.
