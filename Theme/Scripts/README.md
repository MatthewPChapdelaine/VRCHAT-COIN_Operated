# UdonSharp Scripts

This folder will contain all UdonSharp scripts for the Orbital Haven JRPG theme.

## Planned Structure

```
Scripts/
├── Core/              # Core game systems
│   ├── GameManager.cs
│   ├── NetworkManager.cs
│   └── DataManager.cs
│
├── Battle/            # Combat mechanics
│   ├── BattleManager.cs
│   ├── TurnManager.cs
│   ├── DamageCalculator.cs
│   └── EnemyAI.cs
│
├── Character/         # Character systems
│   ├── PlayerCharacter.cs
│   ├── CharacterStats.cs
│   ├── ProgressionManager.cs
│   └── EquipmentManager.cs
│
├── Quest/             # Quest system
│   ├── QuestManager.cs
│   ├── QuestData.cs
│   ├── DialogueSystem.cs
│   └── NPCController.cs
│
├── Inventory/         # Inventory & items
│   ├── InventoryManager.cs
│   ├── ItemData.cs
│   └── EquipmentSlot.cs
│
├── Party/             # Party management
│   ├── PartyManager.cs
│   └── PartyMember.cs
│
├── UI/                # User interface
│   ├── BattleUI.cs
│   ├── MenuUI.cs
│   ├── InventoryUI.cs
│   └── QuestUI.cs
│
└── Utilities/         # Helper scripts
    ├── SaveSystem.cs
    ├── AudioManager.cs
    └── EffectsManager.cs
```

## Implementation Status

⚠️ **Scripts are currently in development**

The architecture and system design are complete (see `Docs/UDONSHARP_ARCHITECTURE.md`), but individual script files are being implemented.

## For Developers

If you're implementing these scripts:

1. Follow UdonSharp best practices
2. Keep network synchronization in mind
3. Optimize for VR performance (especially Quest)
4. Document all public methods
5. Test in both PC and VR modes

See [UDONSHARP_ARCHITECTURE.md](../Docs/UDONSHARP_ARCHITECTURE.md) for detailed specifications.
