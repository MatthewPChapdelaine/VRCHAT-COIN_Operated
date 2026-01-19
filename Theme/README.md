# Orbital Haven JRPG Theme

Version 0.1.0

A downloadable Unity theme package for adding JRPG gameplay mechanics to VRChat worlds.

## Quick Links

- [Installation Guide](../Docs/INSTALLATION.md)
- [Integration Guide](../Docs/INTEGRATION_GUIDE.md)
- [Architecture Documentation](../Docs/UDONSHARP_ARCHITECTURE.md)
- [Main Repository](../README.md)

## Package Structure

```
Theme/
├── Scripts/           # UdonSharp scripts (to be added)
│   ├── Core/         # Core game systems
│   ├── Battle/       # Combat mechanics
│   ├── Character/    # Character progression
│   ├── Quest/        # Quest system
│   └── UI/           # User interface
│
├── Prefabs/          # Ready-to-use prefabs (to be added)
│   ├── Core/         # Manager prefabs
│   ├── Battle/       # Battle UI and systems
│   ├── UI/           # Interface elements
│   └── World/        # World interaction objects
│
├── Materials/        # Theme materials (to be added)
│   ├── UI/           # Interface materials
│   └── World/        # Environmental materials
│
├── Documentation/    # Additional docs
└── package.json      # Package metadata
```

## Installation

See [Docs/INSTALLATION.md](../Docs/INSTALLATION.md) for complete installation instructions.

### Quick Install

1. Copy the `Theme/` folder into your Unity project's `Assets/` directory
2. Wait for Unity to import and compile
3. Add manager prefabs from `Theme/Prefabs/Core/` to your scene
4. Configure and customize

## Features

- Turn-based combat system
- Character progression (levels, stats, equipment)
- Quest and dialogue systems
- Inventory management
- Party system (4 players)
- VR-optimized UI
- Network-synchronized gameplay

## Requirements

- Unity 2022.3.22f1+
- VRChat SDK3 - Worlds 3.5.0+
- UdonSharp 1.1.8+

## Support

For issues, questions, or contributions:
- GitHub Issues: https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated/issues
- Documentation: See `Docs/` folder

## License

See LICENSE file in root directory.
