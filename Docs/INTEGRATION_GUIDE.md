# Step-by-Step Integration Guide
## Combining Orbital Haven + COIN-OPERATED JRPG for VRChat

This guide provides detailed instructions for implementing the integrated Orbital Haven JRPG world in VRChat Creator Companion.

---

## 🚀 Super Quick Setup First!

**Haven't set up yet?** → See **[INSTALLATION.md](INSTALLATION.md)** for quick setup!

Already have the project open in Unity? Great! Continue below.

---

## Prerequisites Checklist

Before starting implementation:
- ✅ VRChat Creator Companion installed
- ✅ Project opened in Unity via VCC
- ✅ VRChat account with upload permissions
- ✅ Basic understanding of Unity Editor (helpful but not required)
- ✅ 10+ GB free disk space

---

## Phase 1: Project Setup (Week 1-2)

### Step 1.1: Create Unity Project via VCC

1. **Launch VRChat Creator Companion**
   ```
   - Open VCC application
   - Click "Projects" tab
   - Click "New" → "Create New Project"
   - Name: "OrbitalHavenJRPG"
   - Select: World project template
   - Unity Version: 2022.3.22f1
   ```

2. **Install Required Packages**
   ```
   VCC will automatically install:
   - VRChat Worlds SDK (3.5.0+)
   - UdonSharp (1.1.8+)
   - VRChat Base SDK
   ```

3. **Open Project in Unity**
   ```
   - Click "Open Project" in VCC
   - Wait for Unity to launch and import packages
   - May take 5-10 minutes on first launch
   ```

### Step 1.2: Import Project Structure

1. **Copy Repository Contents**
   ```bash
   # From the VRCHAT-COIN_Operated folder
   cp -r Assets/* [Unity Project]/Assets/
   cp vpm-manifest.json [Unity Project]/
   cp Packages/manifest.json [Unity Project]/Packages/
   ```

2. **Verify Import**
   ```
   In Unity Project window, verify folders:
   ✓ Assets/Scenes
   ✓ Assets/Scripts/Udon/Core
   ✓ Assets/Scripts/Udon/Battle
   ✓ Assets/Prefabs
   ✓ Assets/Data
   ```

### Step 1.3: Import Orbital Haven Assets

1. **Clone Orbital Haven Repository**
   ```bash
   git clone https://github.com/MatthewPChapdelaine/orbital-haven-vrchat.git
   cd orbital-haven-vrchat
   ```

2. **Copy Orbital World Assets**
   ```
   From orbital-haven-vrchat, copy to Unity project:
   - Scenes → Assets/Scenes/
   - Models/island → Assets/Models/Orbital/
   - Materials → Assets/Materials/Orbital/
   - Scripts (if any Unity scripts) → Assets/Scripts/Legacy/
   ```

3. **Import Free Assets**
   ```
   Download and import from Asset Store:
   1. Free Island Collection
   2. Skybox Series Free
   3. Any modular building packs
   
   Store in: Assets/External/
   ```

### Step 1.4: Create Base Scene

1. **Open Scene**
   ```
   File → New Scene
   Save As: Assets/Scenes/OrbitalHaven_World.unity
   ```

2. **Add VRChat World Descriptor**
   ```
   GameObject → VRChat SDK → World → VRCWorld
   - Set spawn point
   - Configure respawn height
   - Set capacity: 20-40 players
   ```

3. **Add Basic Lighting**
   ```
   - Add Directional Light (sun)
   - Configure Lighting settings
   - Enable baked lighting for performance
   ```

---

## Phase 2: Core System Implementation (Week 3-4)

### Step 2.1: Implement Game Manager

1. **Create GameManager Script**
   ```
   Assets/Scripts/Udon/Core/GameManager.cs
   
   Copy from UDONSHARP_ARCHITECTURE.md
   - GameManager class
   - Game state enums
   - System references
   ```

2. **Add to Scene**
   ```
   - Create Empty GameObject: "_GameSystems"
   - Add Component: GameManager
   - Make it persistent: DontDestroyOnLoad
   ```

3. **Test**
   ```
   - Play scene in Unity
   - Check Console for "GameManager Initialized"
   - Verify no errors
   ```

### Step 2.2: Implement Character System

1. **Create CharacterData Script**
   ```
   Assets/Scripts/Udon/Core/CharacterData.cs
   
   Implement:
   - CharacterStats class
   - AbilityData class
   - EquipmentData class
   - CharacterData UdonBehaviour
   ```

2. **Create Character Prefabs**
   ```
   For each character (Coin, Jinn-Lir, etc.):
   1. Create Empty GameObject in scene
   2. Add CharacterData component
   3. Configure stats in inspector
   4. Save as prefab: Assets/Prefabs/Characters/
   ```

3. **Test Character System**
   ```
   - Create test character in scene
   - Set level to 5
   - Add some test abilities
   - Verify stat calculations work
   - Test level-up functionality
   ```

### Step 2.3: Implement Battle System

1. **Create Battle Scripts**
   ```
   Assets/Scripts/Udon/Battle/
   - BattleManager.cs
   - TurnSystem.cs
   - DamageCalculator.cs
   - CombatAction.cs
   ```

2. **Set Up Battle Scene**
   ```
   File → New Scene
   Save As: Assets/Scenes/BattleTestScene.unity
   
   Add:
   - BattleManager GameObject
   - Test player party (4 characters)
   - Test enemy party (2-3 enemies)
   - Basic camera setup
   ```

3. **Implement Turn Logic**
   ```
   In BattleManager:
   - Calculate turn order (speed-based)
   - Process player actions
   - Execute enemy AI
   - Check win/loss conditions
   ```

4. **Test Battle System**
   ```
   - Play BattleTestScene
   - Trigger a test battle
   - Execute actions (attack, ability)
   - Verify damage calculation
   - Test battle end conditions
   ```

### Step 2.4: Create Battle UI

1. **Design UI Layout**
   ```
   Create UI Canvas in scene:
   - Screen Space - Overlay
   - Canvas Scaler: Scale with Screen Size
   ```

2. **UI Elements**
   ```
   Create under Canvas:
   - Battle status panel (HP/MP bars)
   - Action menu (Attack, Ability, Defend, Item)
   - Target selection
   - Battle log (scrolling text)
   - Damage numbers (floating text)
   ```

3. **Implement BattleUI Script**
   ```
   Assets/Scripts/Udon/UI/BattleUI.cs
   
   Methods:
   - ShowBattleUI()
   - UpdateCombatants()
   - ShowActionMenu()
   - ShowDamageNumber()
   - LogMessage()
   ```

4. **Connect to BattleManager**
   ```
   - Drag UI elements to BattleManager inspector
   - Set up button click events
   - Test UI updates during battle
   ```

---

## Phase 3: Navigation & World Integration (Week 5-6)

### Step 3.1: Implement Orbital Movement

1. **Create Movement Scripts**
   ```
   Assets/Scripts/Udon/Navigation/
   - OrbitalMovement.cs
   - PlayerController.cs
   - CameraController.cs
   ```

2. **OrbitalMovement System**
   ```csharp
   // Rotate world around center point
   void Update()
   {
       if (isOrbiting)
       {
           transform.RotateAround(orbitCenter, 
               Vector3.up, orbitSpeed * Time.deltaTime);
       }
   }
   ```

3. **Player Movement**
   ```
   - Use VRChat's built-in locomotion
   - Add custom movement restrictions
   - Implement zone boundaries
   - Add jump/sprint modifiers
   ```

### Step 3.2: Set Up World Zones

1. **Create Zone Areas**
   ```
   In OrbitalHaven_World.unity:
   
   Zones to create:
   1. Central Hub (spawn area)
   2. Crystal Caves (dungeon)
   3. Zen Garden (safe zone)
   4. Vista Deck (events)
   5. Zero-G Zone (special)
   ```

2. **Add Zone Triggers**
   ```
   For each zone:
   - Add BoxCollider (Is Trigger: true)
   - Add ZoneTrigger script
   - Configure zone properties
   ```

3. **Implement Zone Transitions**
   ```csharp
   public void OnPlayerEnterTrigger(VRCPlayerApi player)
   {
       if (player.isLocal)
       {
           // Update zone information
           // Trigger zone-specific events
           // Change music/ambiance
       }
   }
   ```

### Step 3.3: Create Encounter System

1. **Design Encounter Triggers**
   ```
   Assets/Scripts/Udon/Encounters/EncounterTrigger.cs
   
   Properties:
   - Encounter type (random, fixed, boss)
   - Encounter rate (%)
   - Enemy party configuration
   - Minimum level requirement
   ```

2. **Place Encounters in World**
   ```
   Crystal Caves zone:
   - Add 5-10 encounter triggers
   - Vary enemy difficulty
   - Place boss encounter at end
   
   Other zones:
   - Vista Deck: Story encounters
   - Zen Garden: No encounters (safe zone)
   ```

3. **Implement Battle Transition**
   ```csharp
   void TriggerBattle()
   {
       // Save player position
       SavePlayerPosition();
       
       // Disable orbital movement
       orbitalMovement.enabled = false;
       
       // Load enemy party
       CharacterData[] enemies = LoadEncounterEnemies();
       
       // Start battle
       battleManager.StartBattle(playerParty, enemies);
       
       // Switch camera mode
       cameraController.SetBattleMode(true);
   }
   ```

### Step 3.4: Camera State Management

1. **Create CameraStateManager**
   ```
   Assets/Scripts/Udon/Navigation/CameraStateManager.cs
   
   States:
   - Exploration (follow player)
   - Battle (fixed on combatants)
   - Dialogue (focus on NPC)
   - Menu (UI focus)
   ```

2. **Implement Camera Transitions**
   ```
   - Use Cinemachine for smooth blending
   - Set up virtual cameras for each state
   - Implement priority switching
   - Add VR comfort options
   ```

---

## Phase 4: Content Migration (Week 7-8)

### Step 4.1: Convert Quest Data

1. **Create Quest ScriptableObjects**
   ```
   Assets/Data/Quests/
   
   For each quest from Python JRPG:
   - Create QuestData asset
   - Define objectives
   - Set rewards
   - Add dialogue references
   ```

2. **Example: Convert Python Quest to Unity**
   ```python
   # Original Python
   quest = Quest(
       "awakening",
       "The Awakening",
       "Discover your purpose",
       QuestType.MAIN_STORY
   )
   ```
   
   ```csharp
   // Unity ScriptableObject
   [CreateAssetMenu]
   public class QuestData : ScriptableObject
   {
       public string questID = "awakening";
       public string questName = "The Awakening";
       public string description = "Discover your purpose";
       public QuestType questType = QuestType.MAIN_STORY;
   }
   ```

3. **Implement Quest Manager**
   ```
   Assets/Scripts/Udon/Quest/QuestManager.cs
   
   - Load all quest assets
   - Track active quests
   - Update progress
   - Distribute rewards
   ```

### Step 4.2: Convert Character Data

1. **Create Character Assets**
   ```
   Assets/Data/Characters/
   
   For each character from Python:
   - Coin (protagonist)
   - Jinn-Lir
   - Orbius
   - Typhus
   - Coireena
   ```

2. **Convert Stats**
   ```python
   # Python character
   coin = Coin(age_state="young")
   coin.stats.max_hp = 100
   coin.stats.strength = 10
   ```
   
   ```
   // Unity - Configure in Inspector
   Character: Coin
   - Level: 1
   - Max HP: 100
   - Strength: 10
   - (etc.)
   ```

3. **Add Abilities**
   ```
   For each ability in Python code:
   1. Create AbilityData ScriptableObject
   2. Configure MP cost, power, target type
   3. Add to character's ability list
   4. Set unlock conditions
   ```

### Step 4.3: Convert Enemy Data

1. **Create Enemy Factory**
   ```
   Assets/Scripts/Udon/Encounters/EnemyFactory.cs
   
   Methods:
   - CreateEnemy(enemyType, level)
   - CreateEncounter(encounterType, playerLevel)
   - ScaleEnemyToLevel(enemy, level)
   ```

2. **Convert Python Enemies**
   ```python
   # Python enemy types
   drift_soldier = Enemy("Drift Soldier", level, ...)
   wild_beast = Enemy("Wild Beast", level, ...)
   ```
   
   ```
   // Unity - Create prefabs
   Assets/Prefabs/Enemies/
   - DriftSoldier_Prefab
   - WildBeast_Prefab
   - (configure in inspector)
   ```

### Step 4.4: Import Dialogue Trees

1. **Design Dialogue Format**
   ```json
   {
     "dialogueID": "jinn_lir_intro",
     "nodes": [
       {
         "nodeID": "start",
         "speaker": "Jinn-Lir",
         "text": "Ah, you're awake...",
         "choices": [
           {"text": "Who are you?", "next": "who"},
           {"text": "Where am I?", "next": "where"}
         ]
       }
     ]
   }
   ```

2. **Create Dialogue Manager**
   ```
   Assets/Scripts/Udon/Dialogue/DialogueManager.cs
   
   - Load dialogue trees from JSON
   - Display dialogue UI
   - Handle player choices
   - Trigger quest events
   ```

3. **Place NPCs in World**
   ```
   For each NPC:
   1. Create GameObject in appropriate zone
   2. Add NPC controller script
   3. Assign dialogue tree
   4. Configure interaction trigger
   ```

---

## Phase 5: Networking & Multiplayer (Week 9-10)

### Step 5.1: Implement Network Sync

1. **Battle Networking**
   ```
   Assets/Scripts/Udon/Networking/BattleNetworking.cs
   
   Sync:
   - Turn order
   - Action queue
   - Battle results
   - Player HP/MP
   ```

2. **Use UdonSynced Variables**
   ```csharp
   [UdonSynced] public int currentTurn;
   [UdonSynced] public bool battleActive;
   [UdonSynced] public int[] playerHPArray;
   ```

3. **Implement Host Authority**
   ```csharp
   public void ExecuteAction(CombatAction action)
   {
       if (!Networking.IsMaster) return;
       
       // Host processes action
       ProcessActionOnHost(action);
       
       // Sync to all clients
       RequestSerialization();
       SendCustomNetworkEvent(NetworkEventTarget.All, 
           "OnActionExecuted");
   }
   ```

### Step 5.2: Player Data Persistence

1. **Set Up VRChat PlayerData**
   ```csharp
   // Save player progress
   public void SavePlayerData()
   {
       string json = SerializePlayerState();
       VRC.SDK3.Data.DataDictionary playerData = 
           new VRC.SDK3.Data.DataDictionary();
       playerData.Add("characterData", json);
       Networking.LocalPlayer.SetPlayerTag("gameData", json);
   }
   ```

2. **Load on Join**
   ```csharp
   public override void OnPlayerJoined(VRCPlayerApi player)
   {
       if (player.isLocal)
       {
           LoadPlayerData();
       }
   }
   ```

3. **Handle Data Size Limits**
   ```
   VRChat PlayerData limit: 100KB per player
   
   Store:
   ✓ Character level
   ✓ Completed quest IDs
   ✓ Inventory (compressed)
   ✓ Faction reputation
   
   Don't store:
   ✗ Full dialogue history
   ✗ Detailed combat logs
   ✗ Temporary buffs
   ```

### Step 5.3: Test Multiplayer

1. **Local Multiplayer Test**
   ```
   - Build & Test in VRChat SDK
   - Launch 2 instances (PC + VR)
   - Join same world
   - Test:
     • Encounter sync
     • Battle party formation
     • Turn-based action sync
     • Loot distribution
   ```

2. **Stress Test**
   ```
   Test with maximum players:
   - 20+ players in world
   - Multiple simultaneous battles
   - Check performance metrics
   - Monitor network traffic
   ```

---

## Phase 6: UI & Polish (Week 11-12)

### Step 6.1: Create Menu Systems

1. **Main Menu UI**
   ```
   Create Canvas: MainMenuUI
   - Character status
   - Inventory
   - Quest log
   - Settings
   - Save/Load (if applicable)
   ```

2. **Inventory UI**
   ```
   Display:
   - Items list (with quantities)
   - Equipment slots
   - Currency display
   - Use/Equip buttons
   ```

3. **Quest Log UI**
   ```
   Show:
   - Active quests (expandable)
   - Quest objectives (checkboxes)
   - Quest descriptions
   - Rewards preview
   ```

### Step 6.2: Add Visual Feedback

1. **Damage Numbers**
   ```
   - Floating text on damage/healing
   - Color-coded (damage red, healing green)
   - Critical hits (larger, different color)
   - Smooth animations
   ```

2. **Battle Effects**
   ```
   - Ability VFX (particles, effects)
   - Hit animations
   - Status effect indicators
   - Turn indicators
   ```

3. **Audio**
   ```
   Add sound effects:
   - Menu navigation clicks
   - Battle actions (sword swing, magic cast)
   - Victory/defeat music
   - Ambient zone music
   ```

### Step 6.3: Optimize Performance

1. **Profile the World**
   ```
   Unity → Window → Analysis → Profiler
   
   Check:
   - CPU usage
   - GPU usage
   - Draw calls
   - Memory usage
   ```

2. **Optimization Techniques**
   ```
   - Combine meshes where possible
   - Use texture atlasing
   - Implement LOD (Level of Detail)
   - Occlusion culling
   - Light baking
   ```

3. **Quest Optimization**
   ```
   - Test on Quest 2 device
   - Reduce texture sizes
   - Simplify shaders
   - Remove unnecessary effects
   - Target <30MB world size
   ```

---

## Phase 7: Testing & Deployment (Week 13-14)

### Step 7.1: Comprehensive Testing

1. **Solo Testing Checklist**
   ```
   Test all systems:
   ✓ Character creation and progression
   ✓ Battle system (all actions)
   ✓ Quest progression
   ✓ Inventory management
   ✓ Dialogue trees
   ✓ Zone transitions
   ✓ Camera states
   ✓ UI navigation
   ```

2. **Multiplayer Testing**
   ```
   Test with 4+ players:
   ✓ Party formation
   ✓ Battle synchronization
   ✓ Loot distribution
   ✓ Quest sharing
   ✓ Disconnect handling
   ✓ Host migration
   ```

3. **Bug Tracking**
   ```
   Document all issues:
   - Description
   - Steps to reproduce
   - Expected vs actual behavior
   - Screenshots/video
   - Severity level
   ```

### Step 7.2: Community Labs Preparation

1. **Pre-Submission Checklist**
   ```
   ✓ No console errors
   ✓ Performance targets met (60+ FPS)
   ✓ All assets properly licensed
   ✓ World capacity set correctly
   ✓ Spawn points configured
   ✓ Respawn height set
   ✓ Content warnings (if needed)
   ✓ World thumbnail created
   ✓ Description written
   ```

2. **VRChat SDK Validation**
   ```
   VRChat SDK → Show Control Panel → Builder
   
   Fix all errors and warnings:
   - Missing components
   - Incompatible scripts
   - Performance issues
   - Network optimization
   ```

3. **Create World Thumbnail**
   ```
   - Take screenshot in Unity (1200x900)
   - Use good lighting and composition
   - Show key features of world
   - Save as Assets/WorldThumbnail.png
   ```

### Step 7.3: Upload to VRChat

1. **Build & Publish**
   ```
   VRChat SDK → Build & Publish
   
   Fill out information:
   - World Name: "Orbital Haven JRPG"
   - Description: (detailed, engaging)
   - Capacity: 20-40
   - Tags: JRPG, RPG, Adventure, Multiplayer
   - Content Warnings: (if applicable)
   ```

2. **Set Publish Status**
   ```
   Initial: "Community Labs"
   - Gather feedback
   - Monitor for issues
   - Iterate based on community response
   
   After 30 days with good metrics:
   - Apply for Public publish
   ```

3. **Monitor & Update**
   ```
   - Check world analytics
   - Read community feedback
   - Fix reported bugs
   - Add requested features
   - Regular content updates
   ```

---

## Phase 8: Post-Launch (Ongoing)

### Step 8.1: Content Updates

1. **New Quests**
   ```
   - Add Act 2, 3, 4 content
   - Create seasonal events
   - Add side quest chains
   - Implement achievement system
   ```

2. **New Characters/Enemies**
   ```
   - Expand party member roster
   - Add new enemy types
   - Create superboss encounters
   - Implement pvp battles (optional)
   ```

3. **Quality of Life**
   ```
   - Fast travel system
   - Quest helper/markers
   - Difficulty settings
   - Accessibility features
   ```

### Step 8.2: Community Engagement

1. **Gather Feedback**
   ```
   - VRChat world feedback
   - Discord community
   - GitHub issues
   - In-game suggestion box
   ```

2. **Regular Updates**
   ```
   - Monthly content patches
   - Bug fix releases
   - Balance adjustments
   - New features based on feedback
   ```

---

## Troubleshooting

### Common Issues

#### Issue: Build Errors
```
Solution:
1. Check Unity Console for specific errors
2. Verify all scripts compile without errors
3. Ensure VRChat SDK is up to date
4. Reimport packages if needed
```

#### Issue: Poor Performance
```
Solution:
1. Run Unity Profiler
2. Check draw calls (<300)
3. Optimize textures
4. Enable occlusion culling
5. Bake lighting
```

#### Issue: Network Desync
```
Solution:
1. Verify UdonSynced variables
2. Check network event timing
3. Implement retry logic
4. Add desync detection and correction
```

#### Issue: Quest Not Completing
```
Solution:
1. Check objective progress values
2. Verify quest trigger conditions
3. Test in isolation
4. Add debug logging
```

---

## Additional Resources

### Documentation
- [VRChat Udon Documentation](https://docs.vrchat.com/docs/getting-started-with-udon)
- [UdonSharp Wiki](https://udonsharp.docs.vrchat.com/)
- [VRChat Creator Companion](https://vcc.docs.vrchat.com/)

### Community
- [VRChat Discord](https://discord.gg/vrchat)
- [Udon Discord](https://discord.gg/udon)
- [Reddit /r/VRchat](https://reddit.com/r/VRchat)

### Tools
- [VRChat Creator Companion](https://vrchat.com/home/download)
- [Unity Hub](https://unity.com/download)
- [Blender](https://www.blender.org/) (for 3D modeling)

---

## Success Criteria

Upon completion, your world should have:

✅ Seamless exploration and battle integration
✅ Multiplayer-tested with 4+ players
✅ No critical bugs or errors
✅ 60+ FPS on target hardware
✅ Quest compatibility (<30MB)
✅ Community Labs approved
✅ Complete documentation
✅ Engaging gameplay loop
✅ Positive player feedback
✅ Extensible architecture for future updates

---

**You're now ready to implement the full Orbital Haven JRPG experience in VRChat!** 🚀

Follow this guide step-by-step, test frequently, and don't hesitate to iterate on designs. The VRChat community is supportive and will help troubleshoot issues.

Good luck, and enjoy creating your unique VRChat JRPG world! ✨
