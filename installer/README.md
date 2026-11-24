# Installer

The installer is planned to provide four profiles: VM, Normal, Dualboot, and Test.

## Non-negotiable safeguards

- Show the selected target disk and partition layout before making changes.
- Never assume that the whole disk may be erased.
- Require explicit confirmation before formatting or replacing an existing OS.
- Dualboot must preserve the existing OS and its partitions.
- Abort safely if the disk layout is ambiguous or unsupported.

Implementation has not started. These are requirements, not claims of existing installer functionality.
