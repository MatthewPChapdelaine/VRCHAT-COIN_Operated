# Prefabs

This folder will contain ready-to-use Unity prefabs for the Orbital Haven JRPG theme.

## Planned Structure

```
Prefabs/
├── Core/              # Essential manager prefabs
│   ├── GameManager.prefab
│   ├── BattleManager.prefab
│   ├── QuestManager.prefab
│   ├── InventoryManager.prefab
│   └── PartyManager.prefab
│
├── Battle/            # Combat-related prefabs
│   ├── BattleArena.prefab
│   ├── TurnIndicator.prefab
│   ├── DamageNumbers.prefab
│   └── EnemySpawner.prefab
│
├── UI/                # Interface prefabs
│   ├── MainUI.prefab
│   ├── BattleHUD.prefab
│   ├── InventoryMenu.prefab
│   ├── QuestLog.prefab
│   ├── CharacterSheet.prefab
│   └── DialogueBox.prefab
│
├── Characters/        # Character prefabs
│   ├── PlayerCharacter.prefab
│   ├── NPCTemplate.prefab
│   └── EnemyTemplate.prefab
│
├── World/             # World interaction prefabs
│   ├── QuestGiver.prefab
│   ├── BattleEncounter.prefab
│   ├── SavePoint.prefab
│   ├── TreasureChest.prefab
│   └── TeleportPoint.prefab
│
└── Effects/           # Visual effects prefabs
    ├── HitEffect.prefab
    ├── HealEffect.prefab
    ├── LevelUpEffect.prefab
    └── SpellEffects.prefab
```

## Implementation Status

⚠️ **Prefabs are currently being developed**

Once scripts are implemented, prefabs will be created and tested. Each prefab will be:
- Pre-configured with proper settings
- Network-synchronized where needed
- VR-optimized
- Documented with usage instructions

## Usage

When prefabs are available:

1. Drag prefab into your scene hierarchy
2. Configure settings in Inspector
3. Assign references as needed
4. Test in Play Mode

See [INSTALLATION.md](../Docs/INSTALLATION.md) for setup instructions.
