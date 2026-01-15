Based on “[https://github.com/MatthewPChapdelaine/orbital-haven-vrchat](https://github.com/MatthewPChapdelaine/orbital-haven-vrchat)” and “[https://github.com/MatthewPChapdelaine/COIN-OPERATED-JRPG](https://github.com/MatthewPChapdelaine/COIN-OPERATED-JRPG)” write a Prompt Engineering Document to combine them, so the game can be implemented as Udon Scripts to fully translate the game to a VRCHAT 3D Gaming Experience. I expect, when finished, that this repo of combined repos can simply be opened in VRCHAT Creator Companion and published to Community Labs.

# **VRChat JRPG Integration: Prompt Engineering Document**

## **Executive Summary**

This document provides comprehensive guidance for combining the Orbital Haven VRChat world with a Coin-Operated JRPG game system into a unified VRChat 3D gaming experience. The integrated project will be deployable via VRChat Creator Companion (VCC) and publishable to Community Labs as a complete world package.

---

## **Project Objectives**

1. Integrate spatial navigation mechanics from Orbital Haven into JRPG world environments  
2. Convert all game logic to Udon/UdonSharp scripts for VRChat compatibility  
3. Implement persistent game state management for multiplayer sessions  
4. Create a cohesive art direction merging orbital/space aesthetics with JRPG visual style  
5. Ensure Community Labs compliance and VCC compatibility  
6. Enable single-click deployment for end users

---

## **Architecture Overview**

### **Core Systems**

VRChat World (Root)  
├── Orbital Navigation System  
│   ├── Spatial positioning & movement  
│   ├── Orbital mechanics physics  
│   └── Camera control  
├── JRPG Game Systems  
│   ├── Battle Manager  
│   ├── Character Stats & Progression  
│   ├── Inventory System  
│   ├── Dialog & Quest System  
│   └── Encounter Triggers  
├── Multiplayer Synchronization  
│   ├── Player state networking  
│   ├── Turn-based battle sync  
│   └── Shared world state  
└── UI & Interaction Layer  
    ├── Menu systems  
    ├── Battle UI  
    └── Interactable objects

---

## **Phase 1: Repository Analysis & Preparation**

### **1.1 Orbital Haven Repository Structure**

**Key Components to Extract:**

* Spatial navigation scripts (movement, velocity, orientation)  
* Orbital calculation algorithms  
* Camera control systems  
* Input handling for VR/Desktop  
* Physics simulation code

**Prompt for Analysis:**

"Review the Orbital Haven repository structure and identify all Udon/C\# scripts related to: (1) player movement and spatial navigation, (2) orbital mechanics calculations, (3) camera systems, and (4) input handling. Create a mapping document showing dependencies between these systems."

### **1.2 COIN-OPERATED JRPG Repository Structure**

**Key Components to Extract:**

* Battle system mechanics (turn order, action resolution)  
* Character data structures (stats, equipment, abilities)  
* Inventory & item management  
* Dialog/narrative system  
* Menu UI layouts  
* Game state management

**Prompt for Analysis:**

"Analyze the COIN-OPERATED-JRPG repository and document: (1) the game state structure, (2) battle mechanics and turn resolution, (3) character progression systems, (4) inventory logic, and (5) any platform-specific code that needs modification for VRChat. Identify all dependencies and data structures."

### **1.3 Compatibility Assessment**

**Critical Questions to Address:**

* Which scripts use platform-specific APIs (console, PC direct access)?  
* What's the current state/data persistence mechanism?  
* Are there any timing-critical operations unsuitable for network latency?  
* Which systems require refactoring for multiplayer synchronization?

**Prompt:**

"Identify all platform-specific code, external dependencies, and systems that would conflict with VRChat's sandbox and Udon limitations. For each conflict, suggest a Udon-compatible alternative approach."

---

## **Phase 2: Udon Architecture Design**

### **2.1 UdonSharp Script Strategy**

**Core Scripts to Create/Adapt:**

1. **OrbitalNavigationManager.cs**

   * Handles player position, movement, orbital positioning  
   * Manages camera following and perspective  
   * Processes input (controller sticks, keyboard)  
2. **BattleManager.cs**

   * Initializes battles from encounters  
   * Manages turn order and action queue  
   * Synchronizes battle state across network  
   * Handles battle transitions  
3. **CharacterData.cs**

   * Stores character stats (HP, MP, ATK, DEF, etc.)  
   * Manages equipment and abilities  
   * Tracks character level and experience  
   * Implements progression logic  
4. **InventoryManager.cs**

   * Manages player items and quantities  
   * Equipment management  
   * Item usage and effects  
   * Network synchronization  
5. **DialogueSystem.cs**

   * Loads and displays NPC dialog  
   * Manages quest states  
   * Triggers scene transitions  
6. **EncounterTrigger.cs**

   * Detects player entry into battle zones  
   * Initializes enemy parties  
   * Handles random/fixed encounters  
7. **UIManager.cs**

   * Controls menu navigation  
   * Manages battle UI display  
   * Shows character/inventory screens  
8. **NetworkSyncManager.cs**

   * Synchronizes critical game state  
   * Manages player data persistence  
   * Handles turn-based synchronization

### **2.2 Data Structure Design**

**Game State Structure (Serializable):**

\[System.Serializable\]  
public class PlayerGameState  
{  
    public int playerId;  
    public CharacterData activeParty\[\];  
    public InventoryData inventory;  
    public Vector3 position;  
    public int currentQuestId;  
    public int gold;  
    public int currentLevel;  
    public int totalExperience;  
    public Quaternion facing;  
}

\[System.Serializable\]  
public class BattleState  
{  
    public CharacterData\[\] playerParty;  
    public CharacterData\[\] enemyParty;  
    public int currentTurnIndex;  
    public bool playerTurn;  
    public int\[\] playerActionQueue;  
    public string battleStatus;  
}

**Prompt for UdonSharp Development:**

"Create a comprehensive UdonSharp architecture document that includes: (1) class definitions for all game systems, (2) network serialization strategy using VRChat's data structures, (3) event-driven communication between systems using UdonEvents, and (4) recommendations for data persistence using PlayerData or custom JSON serialization."

---

## **Phase 3: Integration Points**

### **3.1 Navigation & Battle Transition**

**Design Pattern:**

Player navigates world using Orbital Haven movement system  
    ↓  
Player enters EncounterTrigger collider  
    ↓  
Encounter data loaded (enemy party configuration)  
    ↓  
BattleManager initialized with orbital map disabled  
    ↓  
Battle UI displayed  
    ↓  
Battle concludes → Return to orbital navigation  
    ↓  
World state updated (defeated enemies, loot, position)

**Prompt:**

"Design a seamless transition system between free-roam orbital navigation and turn-based battle mode. The system should: (1) freeze orbital movement when entering battle, (2) load appropriate UI and camera, (3) handle battle conclusion and return to exploration, and (4) maintain player position/state through transitions. Provide pseudocode for the state machine."

### **3.2 Camera Management During Battle**

**Integration Challenge:** Orbital Haven likely uses dynamic camera positioning; battles need focused, stationary camera on action.

**Solution Design:**

* Create CameraStateManager tracking: Exploration vs. Battle mode  
* Orbital scripts switch to follow mode during battle  
* Battle camera points at center of action  
* Smooth transitions between camera states

**Prompt:**

"Design a camera system that switches between (1) orbital exploration mode with dynamic tracking, and (2) battle mode with fixed focus on combatants. Include smooth transitions, player manual control options, and VR-specific considerations. What are the trade-offs between third-person and first-person perspectives for this hybrid system?"

### **3.3 Multiplayer Synchronization Strategy**

**Turn-Based Battle Sync:**

* All player actions collected before turn execution  
* Host validates turn legality and executes  
* Result broadcast to all clients  
* Battle state re-synced each turn

**Exploration Sync:**

* Player positions updated periodically (not every frame)  
* Encounter state shared across network  
* Defeated enemies remain defeated for all players

**Prompt:**

"Design a network synchronization strategy for a VRChat turn-based JRPG that: (1) handles turn-based action validation on the host, (2) prevents cheating/exploits in turn timing, (3) manages combat state consistency across clients with up to 80-player instance limits, and (4) optimizes bandwidth usage. Include fallback strategies for network drops mid-battle."

---

## **Phase 4: VCC & Community Labs Preparation**

### **4.1 Project Structure for VCC**

orbital-haven-jrpg/  
├── Assets/  
│   ├── Scenes/  
│   │   ├── MainMenu.unity  
│   │   ├── World.unity  
│   │   └── BattleTestScene.unity  
│   ├── Scripts/  
│   │   ├── Udon/  
│   │   │   ├── Navigation/  
│   │   │   ├── Battle/  
│   │   │   ├── UI/  
│   │   │   └── Networking/  
│   │   └── Data/  
│   ├── Prefabs/  
│   │   ├── Characters/  
│   │   ├── Encounters/  
│   │   └── UI/  
│   ├── Models/  
│   ├── Materials/  
│   └── Audio/  
├── Packages/  
│   └── manifest.json  
├── ProjectSettings/  
├── vpm-manifest.json  
└── README.md

### **4.2 VCC Package Configuration**

**vpm-manifest.json Requirements:**

{  
  "name": "orbital-haven-jrpg",  
  "displayName": "Orbital Haven JRPG",  
  "version": "1.0.0",  
  "description": "A space-themed JRPG experience in VRChat",  
  "dependencies": {  
    "com.vrchat.udon": "latest",  
    "com.vrchat.worlds": "latest"  
  }  
}

**Prompt:**

"Create a complete VCC (VRChat Creator Companion) compatible package configuration including: (1) proper manifest.json structure, (2) dependency declarations for VRChat SDK3, (3) build settings optimized for Community Labs, (4) performance profiling recommendations, and (5) a deployment checklist ensuring the package opens cleanly in VCC and builds without errors."

### **4.3 Community Labs Compliance**

**Requirements Checklist:**

* \[ \] Performance optimized (target: 100 FPS on mid-tier VR hardware)  
* \[ \] No custom DLLs or external plugins  
* \[ \] All assets properly licensed/attributed  
* \[ \] Tested in multi-user instance (min 4 players)  
* \[ \] No console errors on startup  
* \[ \] Proper lighting and culling setup  
* \[ \] Loading times under 30 seconds  
* \[ \] Clear UI/tutorials for first-time players  
* \[ \] Graceful degradation for lower-end hardware  
* \[ \] Content warnings if applicable

**Prompt:**

"List all VRChat Community Labs technical requirements and create a pre-submission checklist. For a hybrid orbital-navigation \+ turn-based JRPG world, what are the specific performance optimization priorities? How should we profile and optimize for Oculus Quest compatibility while maintaining visual quality on PC?"

---

## **Phase 5: Implementation Workflow**

### **5.1 Step-by-Step Integration**

**Week 1-2: Foundation**

1. Create new Unity project with VRChat SDK3  
2. Import orbital navigation scripts with Udon compilation  
3. Set up basic scene with player spawn and movement testing  
4. Verify orbital mechanics work in test environment

**Week 3-4: Battle System**

1. Create battle UI prefabs and layout  
2. Implement BattleManager with turn resolution logic  
3. Create sample enemy encounters  
4. Implement basic turn-based player actions (attack, defend, flee)

**Week 5-6: Integration**

1. Connect BattleManager to navigation system  
2. Implement encounter triggers throughout world  
3. Create seamless transitions between modes  
4. Test multiplayer synchronization

**Week 7-8: Content & Polish**

1. Add dialog system and NPCs  
2. Implement inventory and shop system  
3. Create game progression and leveling  
4. Visual polish and optimization

**Week 9: Testing & Deployment**

1. Comprehensive testing (solo and multiplayer)  
2. Performance optimization and profiling  
3. Community Labs submission preparation  
4. Package and document for VCC deployment

### **5.2 Testing Protocol**

**Prompt:**

"Design a comprehensive testing protocol for a VRChat JRPG world including: (1) unit tests for game logic (UdonSharp testable components), (2) integration tests for orbital \+ battle transitions, (3) multiplayer testing scenarios (network drops, host migration, instance limit edge cases), (4) performance profiling benchmarks, and (5) user acceptance testing criteria."

---

## **Phase 6: Advanced Considerations**

### **6.1 Persistent World Data**

**Options:**

1. **VRChat Data API:** Limited to 100KB per user, suitable for character saves  
2. **PlayerData Scripts:** Store in-memory during session  
3. **JSON Serialization:** Manual save/load system  
4. **Cloud Integration:** Via external APIs (requires careful security)

**Recommendation:** Implement tiered persistence:

* Session data (in-memory): Current battle state, inventory  
* Player data (VRChat API): Character progress, completed quests  
* Optional: External leaderboards via signed API calls

### **6.2 Monetization & Coin System**

**If "Coin-Operated" Implies Currency:**

* Implement in-game economy system  
* Battle rewards grant coins  
* Coins purchasable with real money? (If so, requires Udon monetization plugins)  
* Shop system selling items/equipment for coins

**Prompt:**

"Design a virtual economy system for a VRChat JRPG where: (1) players earn in-game currency (coins) from battles, (2) currency can be spent on equipment and items, (3) optional real-money purchase integration (discuss VRChat policy implications), and (4) anti-cheat measures prevent currency manipulation. What are VRChat's guidelines on monetization in Community Labs worlds?"

### **6.3 Scaling to Multiple Players**

**Challenges:**

* Battle synchronization with multiple players in party  
* Shared world state with 50+ simultaneous players  
* Balancing competitive vs. cooperative gameplay

**Design Options:**

1. **Single-player focused:** Each player has personal battles, shared exploration  
2. **Co-op parties:** Up to 4 players team up for battles  
3. **Raid mode:** Large groups tackle tough encounters with special mechanics

**Prompt:**

"Propose multiplayer scaling strategies for a VRChat JRPG world supporting up to 80 players. Discuss: (1) solo vs. party vs. raid mechanics, (2) how to prevent griefing in shared spaces, (3) network bandwidth optimization for 80-player instances, and (4) progression balance when players can enter at different levels."

---

## **Phase 7: Documentation & Knowledge Transfer**

### **7.1 Required Documentation**

1. **Developer Guide:** Setup, building, and extending the project  
2. **Udon Script Reference:** Overview of all custom scripts with public methods  
3. **Content Creator Guide:** How to add new encounters, NPCs, dialog  
4. **Player Guide/Tutorial:** How to play the JRPG, combat mechanics  
5. **Architecture Document:** System design and data flow diagrams

### **7.2 Knowledge Base Articles**

* How orbital movement integrates with turn-based battles  
* Network synchronization in turn-based games  
* Performance optimization for complex scenes  
* Extending the JRPG with custom content

**Prompt:**

"Create a comprehensive developer documentation template for an open-source VRChat JRPG world. Include: (1) setup instructions for VCC, (2) UdonSharp coding standards used in this project, (3) data structure documentation, (4) event system architecture, (5) how to add new quests/encounters, and (6) troubleshooting common issues."

---

## **Phase 8: Submission Checklist**

Before publishing to Community Labs:

**Code Quality**

* \[ \] All scripts use consistent UdonSharp style  
* \[ \] No unused scripts or assets  
* \[ \] Proper error handling and logging  
* \[ \] Comments on complex logic

**Performance**

* \[ \] Scene culling properly configured  
* \[ \] Texture atlasing for materials  
* \[ \] Draw calls under 300 in typical scene  
* \[ \] No memory leaks (test extended play sessions)

**Functionality**

* \[ \] All core systems functional and tested  
* \[ \] No console errors on startup  
* \[ \] Multiplayer tested with 4+ players  
* \[ \] All UI responsive and clickable

**Content**

* \[ \] All assets properly credited  
* \[ \] No copyrighted material  
* \[ \] Appropriate content rating selected  
* \[ \] Language filter compliance

**Documentation**

* \[ \] README with clear setup instructions  
* \[ \] In-game tutorials or help system  
* \[ \] Comments in complex code sections  
* \[ \] Known limitations documented

**VCC Compliance**

* \[ \] Proper vpm-manifest.json  
* \[ \] All dependencies declared  
* \[ \] Builds without warnings  
* \[ \] Tested import on clean project

---

## **Critical Prompts for AI Assistance**

When working with Claude or other AI tools to implement this integration:

### **Discovery & Planning**

"Analyze the dependencies between \[Orbital Haven\] navigation system and \[COIN-OPERATED JRPG\] battle system. Create a sequence diagram showing how these systems interact from initial player spawn through first battle encounter."

### **Architecture**

"Design the complete UdonSharp class hierarchy for a VRChat JRPG including: abstract base classes, component hierarchy, inheritance strategies, and public interface definitions. Optimize for network bandwidth and code reusability."

### **Implementation**

"Provide complete, production-ready UdonSharp code for \[specific system\]. Include: proper null checks, serialization support, network message handling, event callbacks, and comprehensive comments. Ensure compatibility with VRChat 2024 SDK."

### **Debugging**

"I'm experiencing \[specific issue\] when \[describe scenario\]. Create a debugging checklist including: (1) what data to log, (2) network troubleshooting steps, (3) performance profiling techniques, and (4) common causes in VRChat Udon."

### **Optimization**

"This system has \[performance issue\]. Provide optimization strategies including: algorithmic improvements, memory optimization, network bandwidth reduction, and profiling approach. Rank by estimated impact."

---

## **Success Criteria**

**Upon Project Completion:**

1. ✓ Seamless integration between orbital navigation and JRPG battle systems  
2. ✓ Multiplayer-tested in 4+ player instance  
3. ✓ VCC-compatible, single-click deployable  
4. ✓ Community Labs approved and published  
5. ✓ Performance stable (60+ FPS on target hardware)  
6. ✓ Comprehensive documentation for future development  
7. ✓ Zero console errors on fresh installation  
8. ✓ Engaging gameplay loop motivating continued play  
9. ✓ Extensible architecture allowing community contributions  
10. ✓ Positive community reception and engagement

---

## **Conclusion**

This integration creates a unique gaming experience by combining the spatial immersion of orbital navigation with classic JRPG mechanics in a multiplayer VR environment. Success requires careful attention to VRChat's technical constraints, thoughtful architecture to bridge two distinct gameplay modes, and comprehensive testing to ensure a polished player experience.

The phased approach allows for iterative development, early testing, and course correction before Community Labs submission. Treating this as an ongoing project with community input will ensure the world remains engaging and well-supported long after initial launch.

