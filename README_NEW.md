# Orbital Haven JRPG - VRChat World Project

A unique VRChat experience combining space-themed orbital navigation with deep turn-based JRPG gameplay. Explore a serene floating world while engaging in strategic battles, completing quests, and experiencing a narrative-driven adventure with friends.

---

## ⚡ Quick Start (5 Minutes)

**Want to get started fast?** → See **[QUICKSTART.md](QUICKSTART.md)** for the simplest setup!

**TL;DR:**
1. Install [VRChat Creator Companion](https://vrchat.com/home/download)
2. Add this project folder in VCC
3. Click "Open Project" → Unity launches
4. VRChat SDK → Build & Test
5. Done! 🎉

---

## 🎮 Features

### Exploration
- **Orbital Mechanics**: Realistic orbital world rotation around a gas giant
- **Multiple Zones**: Crystal caves, zen gardens, vista decks, zero-G areas
- **Interactive Elements**: Touch-activated crystals, warp pads, campfires
- **Social Spaces**: Mirrors, video player, avatar pedestals

### JRPG Systems
- **Turn-Based Combat**: Strategic party-based battles (up to 4 players)
- **Character Progression**: Level system, abilities, equipment
- **Quest System**: Main story, side quests, and faction quests
- **Dialogue System**: Branching conversations with NPCs
- **Inventory Management**: Dual currency (Coins & Magical Essence)
- **Equipment Tiers**: Common → Rare → Epic → Legendary

### Multiplayer
- **20-40 Players**: Shared exploration with instanced battles
- **Host-Authoritative**: Secure battle resolution and state management
- **Persistent Progress**: VRChat PlayerData API integration
- **Party System**: Team up with friends for battles

## 📋 Requirements

- Unity 2022.3.22f1
- VRChat SDK3 - Worlds (3.5.0+)
- UdonSharp (1.1.8+)
- VRChat Creator Companion

## � Full Documentation

For detailed implementation, see:
- **[QUICKSTART.md](QUICKSTART.md)** - Get running in 5 minutes
- **[INTEGRATION_GUIDE.md](INTEGRATION_GUIDE.md)** - Step-by-step implementation (14 weeks)
- **[UDONSHARP_ARCHITECTURE.md](UDONSHARP_ARCHITECTURE.md)** - Complete code architecture
- **[BUILD_CHECKLIST.md](BUILD_CHECKLIST.md)** - 200+ item checklist
- **[REPOSITORY_ANALYSIS.md](REPOSITORY_ANALYSIS.md)** - Technical deep dive

## 📁 Project Structure

```
VRCHAT-COIN_Operated/
├── Assets/
│   ├── Scenes/
│   │   └── OrbitalHaven_World.unity      # Main world scene
│   ├── Scripts/
│   │   └── Udon/                         # All UdonSharp scripts
│   │       ├── Core/                     # GameManager, CharacterData
│   │       ├── Battle/                   # BattleManager, TurnSystem
│   │       ├── Navigation/               # OrbitalMovement, Camera
│   │       ├── UI/                       # BattleUI, MenuSystem
│   │       ├── Progression/              # Inventory, Equipment
│   │       ├── Quest/                    # QuestManager, Objectives
│   │       ├── Dialogue/                 # DialogueSystem, NPCs
│   │       ├── Networking/               # NetworkSyncManager
│   │       └── Encounters/               # EncounterTriggers
│   ├── Prefabs/                          # Reusable game objects
│   ├── Data/                             # ScriptableObjects for content
│   ├── Models/                           # 3D models and meshes
│   ├── Materials/                        # Materials and shaders
│   └── Audio/                            # Sound effects and music
├── Packages/
│   └── manifest.json                     # Unity package dependencies
├── ProjectSettings/                      # Unity project settings
├── vpm-manifest.json                     # VRChat package manifest
├── README.md                             # This file
├── REPOSITORY_ANALYSIS.md                # Detailed repo analysis
├── UDONSHARP_ARCHITECTURE.md             # Architecture documentation
└── Combine Command Jan15-25.md           # Original prompt document
```

## 🎯 Game Systems

### Combat System
- **Turn-Based**: Speed stat determines action order
- **Party Size**: Up to 4 characters per party
- **Actions**: Attack, Abilities, Defend, Items, Flee
- **Damage Types**: Physical and Magical
- **Status Effects**: Buffs, debuffs, and conditions

### Progression System
- **Leveling**: Experience-based character growth
- **Abilities**: Unlock new skills as you level
- **Equipment**: Find and equip gear with stat bonuses
- **Currency**: Earn Domminnian Coins and Magical Essence
- **Factions**: Build reputation with 4 different factions

### Quest System
- **Quest Types**: Main Story, Side Quests, Faction Quests
- **Objectives**: Track multiple quest objectives
- **Rewards**: Experience, coins, essence, items
- **Branching**: Choices that affect story progression

## 🔧 Development Guide

### Adding New Content

#### Creating a New Enemy
1. Create `EnemyData` ScriptableObject in `Assets/Data/Characters/`
2. Configure stats, abilities, and loot
3. Create prefab in `Assets/Prefabs/Enemies/`
4. Reference in encounter data

#### Creating a New Quest
1. Create `QuestData` ScriptableObject in `Assets/Data/Quests/`
2. Define objectives and rewards
3. Add quest trigger to NPC dialogue or event
4. Register in QuestManager

#### Adding New Abilities
1. Create `AbilityData` ScriptableObject in `Assets/Data/Abilities/`
2. Define MP cost, power, and target type
3. Add to character's ability list
4. Implement any special effects in BattleManager

### Testing

#### Local Testing
```bash
# In Unity, use VRChat SDK Control Panel
VRChat SDK → Build & Test
```

#### Multiplayer Testing
- Build & Publish to VRChat
- Set world to "Friends+" or "Invite Only"
- Test with at least 4 players for party battles

## 📚 Documentation

- **[Repository Analysis](REPOSITORY_ANALYSIS.md)**: Comprehensive analysis of source repositories
- **[UdonSharp Architecture](UDONSHARP_ARCHITECTURE.md)**: Complete class architecture documentation
- **[Prompt Engineering Document](Combine%20Command%20Jan15-25.md)**: Original integration requirements

## 🎨 Art & Assets

### Asset Sources
All assets used are free and VRChat-compatible:
- **Island Base**: [Free Island Collection](https://assetstore.unity.com/packages/3d/environments/landscapes/free-island-collection-104753)
- **Skybox**: [Skybox Series Free](https://assetstore.unity.com/packages/2d/textures-materials/sky/skybox-series-free-103633)
- **Models**: Various free sources (see Assets/External/ASSET_LINKS.txt)

### Performance Targets
- **Quest Compatibility**: <30MB world size
- **Frame Rate**: 60+ FPS on mid-tier VR hardware
- **Draw Calls**: <300 in typical scenes
- **Lighting**: Baked where possible

## 🌐 Networking & Multiplayer

### Battle Instances
- Max 4 players per battle party
- Host-authoritative battle resolution
- Synchronized turn actions
- Graceful disconnect handling

### World State
- Defeated enemies persist
- Quest progress synced
- Shared loot distribution
- Faction reputation tracking

## 🐛 Known Issues & Limitations

- [ ] Quest system needs content migration from Python
- [ ] Some abilities lack VFX/SFX
- [ ] Voice acting not yet implemented
- [ ] Mobile optimization in progress

## 🤝 Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly in VRChat
5. Submit a Pull Request

Follow VRChat Community Guidelines and Unity/Udon best practices.

## 📄 License

This project is licensed under CC BY-NC-SA 4.0.
- ✅ Free to remix and share
- ✅ Must credit original author
- ✅ Share-alike required
- ❌ No commercial use

## 🙏 Credits

- **Design & Development**: Matthew P. Chapdelaine
- **Original JRPG**: COIN-OPERATED-JRPG repository
- **Orbital Haven World**: orbital-haven-vrchat repository
- **VRChat Community**: For tools, assets, and support

## 📞 Support & Contact

- **GitHub Issues**: [Report bugs or request features](https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated/issues)
- **VRChat**: Find the world in Community Labs (coming soon)

## 🗺️ Roadmap

### Phase 1: Core Systems (Current)
- [x] Repository analysis and mapping
- [x] UdonSharp architecture design
- [x] Project structure setup
- [ ] Core script implementation

### Phase 2: Content Migration
- [ ] Character data migration
- [ ] Quest content conversion
- [ ] Dialogue tree implementation
- [ ] Enemy and encounter setup

### Phase 3: UI Development
- [ ] Battle UI system
- [ ] Menu and inventory UI
- [ ] Quest log UI
- [ ] Dialogue interface

### Phase 4: Integration
- [ ] Orbital world + battle system
- [ ] Encounter triggers in zones
- [ ] Camera state transitions
- [ ] Network synchronization

### Phase 5: Polish & Testing
- [ ] Performance optimization
- [ ] Quest compatibility
- [ ] Multiplayer stress testing
- [ ] Community Labs submission

---

**Ready to build a unique VRChat JRPG experience!** 🚀✨
