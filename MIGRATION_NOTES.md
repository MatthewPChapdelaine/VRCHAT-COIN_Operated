# Repository Reorganization

This repository has been reorganized from a full Unity project structure to a theme package format.

## What Changed

### Old Structure (Pre-Jan 2026)
- Full Unity project with orbital-haven-vrchat folder
- Multiple setup scripts for Linux/VCC
- Project-specific build configurations
- Mixed documentation and project files

### New Structure (Jan 2026)
- Clean theme package in `/Theme/` folder
- Organized documentation in `/Docs/` folder
- Simple installation process
- Import into existing VRChat projects

## Migration Path

If you cloned this repository before the reorganization:

1. **Existing Unity Project Users**: 
   - Back up your current project
   - Follow new installation guide in `Docs/INSTALLATION.md`
   - Import theme from `/Theme/` folder

2. **Documentation Users**:
   - All guides moved to `/Docs/` folder
   - Updated with theme package approach
   - Old guides archived in `/.archive/`

## Archived Files

The following files have been archived for reference:
- Setup scripts (auto-setup.sh, setup.sh, etc.)
- Old documentation (QUICKSTART.md, LINUX_SETUP.md, etc.)
- Legacy manifests and configs

See `/.archive/` folder for historical files.

## Questions?

See the updated [README.md](README.md) or [INSTALLATION.md](Docs/INSTALLATION.md) for current instructions.
