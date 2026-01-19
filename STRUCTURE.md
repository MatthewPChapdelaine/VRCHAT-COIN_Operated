# Repository Structure - Orbital Haven JRPG Theme

This document describes the reorganized repository structure as of January 19, 2026.

---

## Overview

The repository has been redesigned as a **downloadable theme package** for VRChat worlds, rather than a full Unity project. This makes it easier to integrate into existing VRChat world templates.

---

## Directory Structure

```
VRCHAT-COIN_Operated/
│
├── Theme/                          # 🎨 MAIN THEME PACKAGE
│   ├── Scripts/                    # UdonSharp scripts (in development)
│   │   ├── Core/                   # Game managers and core systems
│   │   ├── Battle/                 # Combat mechanics
│   │   ├── Character/              # Character progression
│   │   ├── Quest/                  # Quest system
│   │   ├── Inventory/              # Inventory management
│   │   ├── Party/                  # Party system
│   │   ├── UI/                     # User interface scripts
│   │   └── Utilities/              # Helper scripts
│   │
│   ├── Prefabs/                    # Ready-to-use prefabs (in development)
│   │   ├── Core/                   # Manager prefabs
│   │   ├── Battle/                 # Combat prefabs
│   │   ├── UI/                     # Interface prefabs
│   │   ├── Characters/             # Character templates
│   │   ├── World/                  # World objects
│   │   └── Effects/                # Visual effects
│   │
│   ├── Materials/                  # Theme materials (in development)
│   │   ├── UI/                     # Interface materials
│   │   ├── Effects/                # VFX materials
│   │   ├── World/                  # Environmental materials
│   │   └── Shaders/                # Custom shaders
│   │
│   ├── Documentation/              # Theme-specific docs
│   ├── package.json                # Theme package metadata
│   └── README.md                   # Theme package guide
│
├── Docs/                           # 📚 DOCUMENTATION
│   ├── INSTALLATION.md             # Quick installation guide ⭐ START HERE
│   ├── INTEGRATION_GUIDE.md        # Full implementation guide
│   ├── UDONSHARP_ARCHITECTURE.md   # Code architecture reference
│   ├── BUILD_CHECKLIST.md          # Task checklist
│   └── REPOSITORY_ANALYSIS.md      # Technical analysis
│
├── Packages/                       # Unity package manifest
│   └── manifest.json               # Package dependencies
│
├── .archive/                       # 🗄️ ARCHIVED FILES (reference only)
│   ├── auto-setup.sh               # Old setup script
│   ├── setup.sh                    # Old setup script
│   ├── git-push.sh                 # Old git helper
│   ├── quick-push.sh               # Old git helper
│   ├── QUICKSTART.md               # Old quick start
│   ├── LINUX_SETUP.md              # Old Linux guide
│   ├── SIMPLE_SETUP.md             # Old simple setup
│   ├── TEMPLATE_SETUP_COMPLETE.md  # Old template doc
│   ├── PROJECT_COMPLETE.md         # Old project doc
│   ├── README_NEW.md               # Old readme draft
│   ├── Combine Command Jan15-25.md # Development notes
│   └── README.md                   # Archive description
│
├── README.md                       # 📖 MAIN README (theme package)
├── MIGRATION_NOTES.md              # Reorganization notes
├── vpm-manifest.json               # VRChat package manifest
├── .gitignore                      # Git ignore rules
└── LICENSE                         # License file (if exists)
```

---

## Key Changes from Old Structure

### What Was Removed/Archived

1. **Setup Scripts** → Archived
   - `auto-setup.sh` - No longer needed (simplified installation)
   - `setup.sh` - Replaced by INSTALLATION.md
   - `git-push.sh` / `quick-push.sh` - Development utilities

2. **Old Documentation** → Archived
   - `QUICKSTART.md` - Superseded by INSTALLATION.md
   - `LINUX_SETUP.md` - Installation now platform-agnostic
   - `SIMPLE_SETUP.md` - Combined into main docs
   - Various template/status documents

3. **orbital-haven-vrchat/** - Removed
   - Was an empty placeholder folder
   - Theme now imported into existing projects

### What's New

1. **Theme/** Folder
   - Clean, importable package structure
   - Organized by asset type
   - Ready for Unity import

2. **Docs/** Folder
   - Centralized documentation
   - Clear installation path
   - Reference architecture

3. **Simplified Installation**
   - Copy theme folder into existing project
   - No complex setup scripts
   - Clear 3-step process

---

## Usage Paths

### For New Users (Installing Theme)
1. Read: [README.md](../README.md)
2. Follow: [Docs/INSTALLATION.md](../Docs/INSTALLATION.md)
3. Reference: [Docs/INTEGRATION_GUIDE.md](../Docs/INTEGRATION_GUIDE.md)
4. Copy: `Theme/` → Your Unity Project

### For Developers (Contributing to Theme)
1. Clone repository
2. Work in `Theme/` folder
3. Follow architecture in [Docs/UDONSHARP_ARCHITECTURE.md](../Docs/UDONSHARP_ARCHITECTURE.md)
4. Test with sample VRChat project
5. Submit pull requests

### For Documentation
- All current docs in `Docs/`
- Historical reference in `.archive/`
- Theme-specific info in `Theme/README.md`

---

## File Organization Rules

### Theme Package (`Theme/`)
- **Only importable Unity assets**
- Scripts, prefabs, materials
- Must be VRChat/UdonSharp compatible
- No project-specific files

### Documentation (`Docs/`)
- **Markdown files only**
- Implementation guides
- Architecture references
- Usage instructions

### Archive (`.archive/`)
- **Historical reference**
- No longer maintained
- Kept for context
- May be removed in future

### Root Directory
- **Repository metadata**
- README, manifests, config
- Keep minimal and clean

---

## Version History

- **v0.1.0** (Jan 19, 2026): Repository reorganized as theme package
- **Pre-v0.1.0**: Original project-based structure

---

## Quick Reference

| Need to... | Go to... |
|------------|----------|
| Install theme | [Docs/INSTALLATION.md](../Docs/INSTALLATION.md) |
| Understand architecture | [Docs/UDONSHARP_ARCHITECTURE.md](../Docs/UDONSHARP_ARCHITECTURE.md) |
| Customize systems | [Docs/INTEGRATION_GUIDE.md](../Docs/INTEGRATION_GUIDE.md) |
| Check task progress | [Docs/BUILD_CHECKLIST.md](../Docs/BUILD_CHECKLIST.md) |
| Get theme assets | `Theme/` folder |
| View old docs | `.archive/` folder |

---

**This structure is designed to be:**
- ✅ Easy to import
- ✅ Well documented
- ✅ Clear organization
- ✅ Maintainable
- ✅ VRChat-compatible
