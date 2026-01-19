# Orbital Haven JRPG Theme
### VRChat World Theme Package

A complete JRPG theme package for VRChat worlds featuring turn-based combat systems, character progression, quest mechanics, and orbital navigation for space-themed environments.

---

## 🎯 What is This?

This is a **downloadable theme package** designed to be imported into an existing VRChat world template. It provides all the scripts, prefabs, and documentation needed to add JRPG gameplay mechanics to your VRChat world.

**Perfect for:** World creators who want to add RPG elements to their VRChat worlds without building everything from scratch.

---

## ✨ Theme Features

- **Turn-Based Combat System**: Strategic 4-player party battles with UdonSharp
- **Character Progression**: Leveling, abilities, equipment system (4 tiers)
- **Quest System**: Main story, side quests, and faction quest framework
- **Battle Management**: Instanced battles, turn order, enemy AI
- **Inventory System**: Item management, equipment slots, consumables
- **Party System**: 4-player party formation and management
- **Orbital Navigation**: Space-themed world navigation system
- **VR-Optimized**: Quest 2 compatible UI and interactions

---

## 📦 Package Contents

```
Theme/
├── Scripts/          # UdonSharp scripts for all systems
├── Prefabs/          # Ready-to-use prefabs
├── Materials/        # Theme materials and shaders
└── Documentation/    # Implementation guides

Docs/                 # Full documentation
├── INSTALLATION.md   # Step-by-step installation
├── INTEGRATION_GUIDE.md
├── UDONSHARP_ARCHITECTURE.md
└── BUILD_CHECKLIST.md
```

---

## 🚀 Quick Start

### Prerequisites
- Unity 2022.3.22f1 or later
- VRChat Creator Companion (VCC) installed
- Existing VRChat World project (template)
- VRChat SDK3 - Worlds
- UdonSharp 1.1.8+

### Installation (3 Steps)

1. **Download this theme package**
   ```bash
   git clone https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated.git
   ```

2. **Import into your Unity project**
   - Open your VRChat world project in Unity
   - Copy the `Theme/` folder contents into your `Assets/` folder
   - Wait for Unity to import and compile

3. **Follow the setup guide**
   - See [Docs/INSTALLATION.md](Docs/INSTALLATION.md) for detailed setup
   - Reference [Docs/INTEGRATION_GUIDE.md](Docs/INTEGRATION_GUIDE.md) for customization

**That's it!** 🎉

---

## 📚 Documentation

| Document | Purpose |
|----------|---------|
| **[INSTALLATION.md](Docs/INSTALLATION.md)** | Quick installation guide (start here!) |
| **[INTEGRATION_GUIDE.md](Docs/INTEGRATION_GUIDE.md)** | Full implementation & customization guide |
| **[UDONSHARP_ARCHITECTURE.md](Docs/UDONSHARP_ARCHITECTURE.md)** | Complete code architecture reference |
| **[BUILD_CHECKLIST.md](Docs/BUILD_CHECKLIST.md)** | 200+ task checklist for full implementation |
| **[REPOSITORY_ANALYSIS.md](Docs/REPOSITORY_ANALYSIS.md)** | Technical analysis & design decisions |

---

## 🎮 System Overview

### Core Systems Included

1. **Battle System**
   - Turn-based combat engine
   - 4-player party support
   - Enemy AI behaviors
   - Battle transitions and instancing

2. **Character System**
   - Character stats (HP, MP, ATK, DEF, SPD)
   - Level progression (1-99)
   - Equipment management (4 slots)
   - Ability unlocking system

3. **Quest System**
   - Quest tracking and objectives
   - Multiple quest types (story, side, faction)
   - Reward distribution
   - Progress persistence

4. **Inventory System**
   - Item storage and management
   - Equipment slots
   - Consumable items
   - Rarity tiers (Common → Legendary)

5. **World Navigation**
   - Orbital space theme
   - Zone transitions
   - Fast travel system
   - Map markers

---

## 🛠️ Customization

This theme is designed to be customized! All scripts are well-documented and modular.

**Common customizations:**
- Adjust battle mechanics and damage formulas
- Add new abilities and spells
- Create custom enemy types
- Design new equipment and items
- Modify UI themes and layouts
- Change world aesthetics

See [Docs/INTEGRATION_GUIDE.md](Docs/INTEGRATION_GUIDE.md) for detailed customization instructions.

---

## 🔧 Technical Requirements

- **Unity Version**: 2022.3.22f1 (or later 2022.3.x)
- **VRChat SDK**: 3.5.0+
- **UdonSharp**: 1.1.8+
- **Target Platform**: PC & Quest (VR optimized)
- **Recommended Players**: 20-40 concurrent players

---

## 📝 Version

**Current Version**: 0.1.0  
**Status**: Initial Theme Package Release  
**Last Updated**: January 19, 2026

---

## 🤝 Support & Community

- **Issues**: Report bugs via GitHub Issues
- **Documentation**: All docs included in `Docs/` folder
- **Updates**: Check this repository for theme updates

---

## 📄 License

This theme package is provided as-is for VRChat world development. Please check the LICENSE file for specific terms.

---

## 🌟 Credits

**Theme Package**: Orbital Haven JRPG Theme  
**Author**: Matthew P. Chapdelaine  
**Repository**: https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated

Built with UdonSharp for the VRChat platform.

---

**Ready to get started?** → Open [Docs/INSTALLATION.md](Docs/INSTALLATION.md)


Follow VRChat Community Guidelines and UdonSharp best practices.

---

## 📄 License

CC BY-NC-SA 4.0
- Free to remix and share
- Must credit original author
- Share-alike required
- No commercial use

---

## 🙏 Credits

- **Design**: Matthew P. Chapdelaine
- **Based on**: COIN-OPERATED-JRPG + Orbital Haven VRChat
- **Community**: VRChat creators and contributors

---

## 🔗 Links

- [VRChat Creator Companion](https://vrchat.com/home/download)
- [VRChat SDK Documentation](https://docs.vrchat.com/)
- [UdonSharp Documentation](https://udonsharp.docs.vrchat.com/)
- [GitHub Issues](https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated/issues)

---

**Ready to build?** Start with [Docs/INSTALLATION.md](Docs/INSTALLATION.md) → Then [Docs/INTEGRATION_GUIDE.md](Docs/INTEGRATION_GUIDE.md) 🚀
VRCHAT-COIN_Operated
