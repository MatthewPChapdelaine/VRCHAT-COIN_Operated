# UdonSharp Architecture Design Document

## Overview

This document defines the complete UdonSharp architecture for the integrated VRCHAT-COIN_Operated JRPG world. All classes are designed to work within VRChat's Udon sandbox limitations and support networked multiplayer gameplay.

## Architecture Principles

1. **Event-Driven Communication**: Use UdonEvents for system interaction
2. **Host-Authoritative**: Host validates all game state changes
3. **Serializable Data**: All game state can be synced over network
4. **Modular Design**: Systems are independent and reusable
5. **Performance-First**: Optimize for VR framerates (60+ FPS)

---

## Core System Classes

### GameManager.cs
**Purpose**: Central game state management and system coordination

```csharp
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

public class GameManager : UdonSharpBehaviour
{
    // Singleton instance
    public static GameManager Instance;
    
    // Game State
    [UdonSynced] public int currentGameState = 0; // 0=Exploration, 1=Battle, 2=Menu, 3=Dialogue
    [UdonSynced] public int currentAct = 1;
    
    // System References
    public CharacterManager characterManager;
    public BattleManager battleManager;
    public QuestManager questManager;
    public DialogueSystem dialogueSystem;
    public InventoryManager inventoryManager;
    public NetworkSyncManager networkManager;
    
    // Player References
    private VRCPlayerApi localPlayer;
    private bool isHost = false;
    
    void Start()
    {
        Instance = this;
        localPlayer = Networking.LocalPlayer;
        isHost = Networking.IsMaster;
        
        InitializeSystems();
    }
    
    void InitializeSystems()
    {
        characterManager.Initialize();
        battleManager.Initialize();
        questManager.Initialize();
        dialogueSystem.Initialize();
        inventoryManager.Initialize();
        networkManager.Initialize();
    }
    
    public void ChangeGameState(int newState)
    {
        if (!isHost) return;
        
        currentGameState = newState;
        RequestSerialization();
        
        // Notify all systems of state change
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "OnGameStateChanged");
    }
    
    public override void OnGameStateChanged()
    {
        switch (currentGameState)
        {
            case 0: // Exploration
                EnableExploration();
                break;
            case 1: // Battle
                EnableBattle();
                break;
            case 2: // Menu
                EnableMenu();
                break;
            case 3: // Dialogue
                EnableDialogue();
                break;
        }
    }
    
    void EnableExploration()
    {
        battleManager.DisableBattle();
        // Enable orbital movement, etc.
    }
    
    void EnableBattle()
    {
        battleManager.EnableBattle();
        // Disable movement, show UI
    }
    
    void EnableMenu()
    {
        // Show menu UI
    }
    
    void EnableDialogue()
    {
        dialogueSystem.ShowDialogue();
    }
}
```

### CharacterData.cs
**Purpose**: Store and manage character stats, abilities, and equipment

```csharp
using UdonSharp;
using UnityEngine;
using System;

[Serializable]
public class CharacterStats
{
    public int level = 1;
    public int currentHP = 100;
    public int maxHP = 100;
    public int currentMP = 50;
    public int maxMP = 50;
    public int strength = 10;
    public int defense = 10;
    public int magic = 10;
    public int magicDefense = 10;
    public int speed = 10;
    public int experience = 0;
    public int experienceToNextLevel = 100;
}

[Serializable]
public class AbilityData
{
    public string abilityName;
    public int mpCost;
    public int basePower;
    public string targetType; // "single", "all_enemies", "all_allies", "self"
    public string abilityType; // "physical", "magical", "healing", "utility"
    public bool unlocked = false;
}

[Serializable]
public class EquipmentData
{
    public string equipmentName;
    public string slot; // "weapon", "armor", "accessory"
    public int rarityLevel = 0; // 0=Common, 1=Rare, 2=Epic, 3=Legendary
    public int strengthBonus = 0;
    public int defenseBonus = 0;
    public int magicBonus = 0;
    public int magicDefenseBonus = 0;
    public int hpBonus = 0;
    public int mpBonus = 0;
}

public class CharacterData : UdonSharpBehaviour
{
    public string characterName = "Coin";
    public CharacterStats stats;
    public AbilityData[] abilities;
    public EquipmentData weapon;
    public EquipmentData armor;
    public EquipmentData accessory;
    
    public bool isPlayable = true;
    public int factionID = 0; // 0=Independent, 1=Drift, 2=Light Cabal, 3=Dark Cabal
    
    void Start()
    {
        if (stats == null)
        {
            stats = new CharacterStats();
        }
    }
    
    public bool IsAlive()
    {
        return stats.currentHP > 0;
    }
    
    public void GainExperience(int amount)
    {
        stats.experience += amount;
        
        while (stats.experience >= stats.experienceToNextLevel)
        {
            LevelUp();
        }
    }
    
    void LevelUp()
    {
        stats.level++;
        stats.experience -= stats.experienceToNextLevel;
        stats.experienceToNextLevel = (int)(stats.experienceToNextLevel * 1.5f);
        
        // Stat increases
        stats.maxHP += 10;
        stats.maxMP += 5;
        stats.strength += 2;
        stats.defense += 2;
        stats.magic += 2;
        stats.magicDefense += 2;
        stats.speed += 1;
        
        // Heal to full on level up
        stats.currentHP = stats.maxHP;
        stats.currentMP = stats.maxMP;
    }
    
    public int GetTotalStrength()
    {
        int total = stats.strength;
        if (weapon != null) total += weapon.strengthBonus;
        if (armor != null) total += armor.strengthBonus;
        if (accessory != null) total += accessory.strengthBonus;
        return total;
    }
    
    public int GetTotalDefense()
    {
        int total = stats.defense;
        if (weapon != null) total += weapon.defenseBonus;
        if (armor != null) total += armor.defenseBonus;
        if (accessory != null) total += accessory.defenseBonus;
        return total;
    }
    
    public int GetTotalMagic()
    {
        int total = stats.magic;
        if (weapon != null) total += weapon.magicBonus;
        if (armor != null) total += armor.magicBonus;
        if (accessory != null) total += accessory.magicBonus;
        return total;
    }
    
    public int GetTotalMagicDefense()
    {
        int total = stats.magicDefense;
        if (weapon != null) total += weapon.magicDefenseBonus;
        if (armor != null) total += armor.magicDefenseBonus;
        if (accessory != null) total += accessory.magicDefenseBonus;
        return total;
    }
    
    public void TakeDamage(int damage)
    {
        stats.currentHP = Mathf.Max(0, stats.currentHP - damage);
    }
    
    public void Heal(int amount)
    {
        stats.currentHP = Mathf.Min(stats.maxHP, stats.currentHP + amount);
    }
    
    public void RestoreMP(int amount)
    {
        stats.currentMP = Mathf.Min(stats.maxMP, stats.currentMP + amount);
    }
    
    public bool UseMP(int amount)
    {
        if (stats.currentMP >= amount)
        {
            stats.currentMP -= amount;
            return true;
        }
        return false;
    }
    
    public AbilityData[] GetUnlockedAbilities()
    {
        int count = 0;
        foreach (var ability in abilities)
        {
            if (ability.unlocked) count++;
        }
        
        AbilityData[] unlocked = new AbilityData[count];
        int index = 0;
        foreach (var ability in abilities)
        {
            if (ability.unlocked)
            {
                unlocked[index] = ability;
                index++;
            }
        }
        return unlocked;
    }
}
```

---

## Battle System Classes

### BattleManager.cs
**Purpose**: Manage turn-based combat flow and state

```csharp
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;

public class BattleManager : UdonSharpBehaviour
{
    // Battle State
    [UdonSynced] public bool battleActive = false;
    [UdonSynced] public int currentTurn = 0;
    [UdonSynced] public int currentCombatantIndex = 0;
    
    // Combatants
    public CharacterData[] playerParty;
    public CharacterData[] enemyParty;
    public CharacterData[] turnOrder;
    
    // UI References
    public BattleUI battleUI;
    
    // Systems
    private TurnSystem turnSystem;
    private DamageCalculator damageCalculator;
    
    public void Initialize()
    {
        turnSystem = GetComponent<TurnSystem>();
        damageCalculator = GetComponent<DamageCalculator>();
    }
    
    public void StartBattle(CharacterData[] players, CharacterData[] enemies)
    {
        if (!Networking.IsMaster) return;
        
        playerParty = players;
        enemyParty = enemies;
        battleActive = true;
        currentTurn = 0;
        
        // Calculate turn order based on speed
        turnOrder = CalculateTurnOrder();
        
        RequestSerialization();
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "OnBattleStart");
    }
    
    public override void OnBattleStart()
    {
        battleUI.ShowBattleUI();
        battleUI.UpdateCombatants(playerParty, enemyParty);
        ProcessNextTurn();
    }
    
    CharacterData[] CalculateTurnOrder()
    {
        CharacterData[] allCombatants = new CharacterData[playerParty.Length + enemyParty.Length];
        playerParty.CopyTo(allCombatants, 0);
        enemyParty.CopyTo(allCombatants, playerParty.Length);
        
        // Sort by speed (bubble sort for Udon compatibility)
        for (int i = 0; i < allCombatants.Length - 1; i++)
        {
            for (int j = 0; j < allCombatants.Length - i - 1; j++)
            {
                if (allCombatants[j].stats.speed < allCombatants[j + 1].stats.speed)
                {
                    CharacterData temp = allCombatants[j];
                    allCombatants[j] = allCombatants[j + 1];
                    allCombatants[j + 1] = temp;
                }
            }
        }
        
        return allCombatants;
    }
    
    public void ProcessNextTurn()
    {
        if (!battleActive) return;
        
        // Check win/loss conditions
        if (CheckBattleEnd())
        {
            EndBattle();
            return;
        }
        
        // Get next alive combatant
        while (currentCombatantIndex < turnOrder.Length && !turnOrder[currentCombatantIndex].IsAlive())
        {
            currentCombatantIndex++;
        }
        
        if (currentCombatantIndex >= turnOrder.Length)
        {
            // New round
            currentTurn++;
            currentCombatantIndex = 0;
            ProcessNextTurn();
            return;
        }
        
        CharacterData currentCombatant = turnOrder[currentCombatantIndex];
        
        // Check if player or enemy
        bool isPlayerTurn = IsInPlayerParty(currentCombatant);
        
        if (isPlayerTurn)
        {
            battleUI.ShowActionMenu(currentCombatant);
        }
        else
        {
            ExecuteEnemyTurn(currentCombatant);
        }
    }
    
    bool IsInPlayerParty(CharacterData character)
    {
        foreach (var p in playerParty)
        {
            if (p == character) return true;
        }
        return false;
    }
    
    public void ExecuteAction(string actionType, CharacterData actor, CharacterData target, AbilityData ability)
    {
        if (!Networking.IsMaster) return;
        
        switch (actionType)
        {
            case "attack":
                ExecuteAttack(actor, target);
                break;
            case "ability":
                ExecuteAbility(actor, target, ability);
                break;
            case "defend":
                ExecuteDefend(actor);
                break;
            case "item":
                // TODO: Implement items
                break;
        }
        
        currentCombatantIndex++;
        SendCustomNetworkEvent(VRC.Udon.Common.Interfaces.NetworkEventTarget.All, "OnActionExecuted");
    }
    
    void ExecuteAttack(CharacterData attacker, CharacterData target)
    {
        int damage = damageCalculator.CalculatePhysicalDamage(attacker, target);
        target.TakeDamage(damage);
        
        battleUI.ShowDamageNumber(target, damage);
        battleUI.LogMessage($"{attacker.characterName} attacks {target.characterName} for {damage} damage!");
    }
    
    void ExecuteAbility(CharacterData caster, CharacterData target, AbilityData ability)
    {
        if (!caster.UseMP(ability.mpCost))
        {
            battleUI.LogMessage($"{caster.characterName} doesn't have enough MP!");
            return;
        }
        
        if (ability.abilityType == "healing")
        {
            int healAmount = damageCalculator.CalculateHealing(caster, ability);
            target.Heal(healAmount);
            battleUI.ShowHealNumber(target, healAmount);
            battleUI.LogMessage($"{caster.characterName} uses {ability.abilityName} and heals {target.characterName} for {healAmount} HP!");
        }
        else if (ability.abilityType == "magical")
        {
            int damage = damageCalculator.CalculateMagicalDamage(caster, target, ability);
            target.TakeDamage(damage);
            battleUI.ShowDamageNumber(target, damage);
            battleUI.LogMessage($"{caster.characterName} uses {ability.abilityName} on {target.characterName} for {damage} damage!");
        }
    }
    
    void ExecuteDefend(CharacterData defender)
    {
        // Defending increases defense temporarily (handled by turn system)
        battleUI.LogMessage($"{defender.characterName} takes a defensive stance!");
    }
    
    void ExecuteEnemyTurn(CharacterData enemy)
    {
        // Simple AI: attack random player
        CharacterData target = GetRandomAlivePlayer();
        
        if (target != null)
        {
            ExecuteAttack(enemy, target);
        }
        
        currentCombatantIndex++;
        SendCustomEventDelayedSeconds("ProcessNextTurn", 1.5f);
    }
    
    CharacterData GetRandomAlivePlayer()
    {
        CharacterData[] alivePlayers = new CharacterData[playerParty.Length];
        int count = 0;
        
        foreach (var player in playerParty)
        {
            if (player.IsAlive())
            {
                alivePlayers[count] = player;
                count++;
            }
        }
        
        if (count == 0) return null;
        
        int randomIndex = Random.Range(0, count);
        return alivePlayers[randomIndex];
    }
    
    bool CheckBattleEnd()
    {
        bool allEnemiesDead = true;
        bool allPlayersDead = true;
        
        foreach (var enemy in enemyParty)
        {
            if (enemy.IsAlive())
            {
                allEnemiesDead = false;
                break;
            }
        }
        
        foreach (var player in playerParty)
        {
            if (player.IsAlive())
            {
                allPlayersDead = false;
                break;
            }
        }
        
        return allEnemiesDead || allPlayersDead;
    }
    
    void EndBattle()
    {
        battleActive = false;
        
        bool victory = true;
        foreach (var player in playerParty)
        {
            if (player.IsAlive())
            {
                victory = true;
                break;
            }
        }
        
        if (victory)
        {
            HandleVictory();
        }
        else
        {
            HandleDefeat();
        }
    }
    
    void HandleVictory()
    {
        // Calculate rewards
        int totalExp = 0;
        int totalCoins = 0;
        
        foreach (var enemy in enemyParty)
        {
            totalExp += enemy.stats.level * 20;
            totalCoins += enemy.stats.level * 10;
        }
        
        // Distribute experience
        foreach (var player in playerParty)
        {
            if (player.IsAlive())
            {
                player.GainExperience(totalExp);
            }
        }
        
        // Give coins
        GameManager.Instance.inventoryManager.AddCoins(totalCoins);
        
        battleUI.ShowVictoryScreen(totalExp, totalCoins);
    }
    
    void HandleDefeat()
    {
        battleUI.ShowDefeatScreen();
    }
    
    public void EnableBattle()
    {
        battleUI.gameObject.SetActive(true);
    }
    
    public void DisableBattle()
    {
        battleUI.gameObject.SetActive(false);
    }
}
```

### DamageCalculator.cs
**Purpose**: Calculate damage, healing, and other combat values

```csharp
using UdonSharp;
using UnityEngine;

public class DamageCalculator : UdonSharpBehaviour
{
    public int CalculatePhysicalDamage(CharacterData attacker, CharacterData target)
    {
        int baseDamage = attacker.GetTotalStrength() * 2;
        int variance = Random.Range(-5, 6);
        int defense = target.GetTotalDefense();
        
        int damage = Mathf.Max(1, baseDamage + variance - defense);
        return damage;
    }
    
    public int CalculateMagicalDamage(CharacterData caster, CharacterData target, AbilityData ability)
    {
        float baseDamage = (caster.GetTotalMagic() * 1.5f) + ability.basePower;
        int variance = Random.Range(-5, 6);
        int magicDefense = target.GetTotalMagicDefense();
        
        int damage = Mathf.Max(1, (int)baseDamage + variance - magicDefense);
        return damage;
    }
    
    public int CalculateHealing(CharacterData caster, AbilityData ability)
    {
        float baseHealing = (caster.GetTotalMagic() * 1.2f) + ability.basePower;
        int variance = Random.Range(-3, 4);
        
        int healing = Mathf.Max(1, (int)baseHealing + variance);
        return healing;
    }
}
```

---

## Progression System Classes

### InventoryManager.cs
**Purpose**: Manage items, equipment, and currency

```csharp
using UdonSharp;
using UnityEngine;
using System;

[Serializable]
public class ItemData
{
    public string itemName;
    public int quantity = 0;
    public string itemType; // "consumable", "key_item"
    public string description;
    public int healingAmount = 0;
    public int mpRestoreAmount = 0;
}

public class InventoryManager : UdonSharpBehaviour
{
    [UdonSynced] public int domminnianCoins = 100;
    [UdonSynced] public int magicalEssence = 0;
    
    public ItemData[] items;
    public EquipmentData[] equipment;
    
    public int maxItemQuantity = 99;
    
    public void Initialize()
    {
        // Initialize with starter items
        items = new ItemData[50]; // Max 50 item types
        equipment = new EquipmentData[100]; // Max 100 equipment pieces
    }
    
    public void AddCoins(int amount)
    {
        if (!Networking.IsMaster) return;
        
        domminnianCoins += amount;
        RequestSerialization();
    }
    
    public void AddEssence(int amount)
    {
        if (!Networking.IsMaster) return;
        
        magicalEssence += amount;
        RequestSerialization();
    }
    
    public bool SpendCoins(int amount)
    {
        if (!Networking.IsMaster) return false;
        
        if (domminnianCoins >= amount)
        {
            domminnianCoins -= amount;
            RequestSerialization();
            return true;
        }
        return false;
    }
    
    public bool SpendEssence(int amount)
    {
        if (!Networking.IsMaster) return false;
        
        if (magicalEssence >= amount)
        {
            magicalEssence -= amount;
            RequestSerialization();
            return true;
        }
        return false;
    }
    
    public void AddItem(ItemData item, int quantity)
    {
        // Find existing item or empty slot
        for (int i = 0; i < items.Length; i++)
        {
            if (items[i] != null && items[i].itemName == item.itemName)
            {
                items[i].quantity = Mathf.Min(maxItemQuantity, items[i].quantity + quantity);
                return;
            }
        }
        
        // Add to first empty slot
        for (int i = 0; i < items.Length; i++)
        {
            if (items[i] == null)
            {
                item.quantity = quantity;
                items[i] = item;
                return;
            }
        }
    }
    
    public bool RemoveItem(string itemName, int quantity)
    {
        for (int i = 0; i < items.Length; i++)
        {
            if (items[i] != null && items[i].itemName == itemName)
            {
                if (items[i].quantity >= quantity)
                {
                    items[i].quantity -= quantity;
                    if (items[i].quantity <= 0)
                    {
                        items[i] = null;
                    }
                    return true;
                }
                return false;
            }
        }
        return false;
    }
    
    public void AddEquipment(EquipmentData equip)
    {
        for (int i = 0; i < equipment.Length; i++)
        {
            if (equipment[i] == null)
            {
                equipment[i] = equip;
                return;
            }
        }
    }
    
    public bool RemoveEquipment(string equipmentName)
    {
        for (int i = 0; i < equipment.Length; i++)
        {
            if (equipment[i] != null && equipment[i].equipmentName == equipmentName)
            {
                equipment[i] = null;
                return true;
            }
        }
        return false;
    }
}
```

---

## Quest System Classes

### QuestManager.cs
**Purpose**: Track and manage quest progress

```csharp
using UdonSharp;
using UnityEngine;
using System;

[Serializable]
public class QuestObjective
{
    public string description;
    public int currentProgress = 0;
    public int requiredProgress = 1;
    public bool completed = false;
}

[Serializable]
public class QuestData
{
    public string questID;
    public string questName;
    public string description;
    public int questType = 0; // 0=Main, 1=Side, 2=Faction
    public QuestObjective[] objectives;
    public bool isActive = false;
    public bool isCompleted = false;
    
    // Rewards
    public int expReward = 0;
    public int coinReward = 0;
    public int essenceReward = 0;
}

public class QuestManager : UdonSharpBehaviour
{
    public QuestData[] allQuests;
    public QuestData[] activeQuests;
    public QuestData[] completedQuests;
    
    private int maxActiveQuests = 10;
    
    public void Initialize()
    {
        allQuests = new QuestData[100]; // Max 100 quests
        activeQuests = new QuestData[maxActiveQuests];
        completedQuests = new QuestData[100];
        
        LoadQuestDatabase();
    }
    
    void LoadQuestDatabase()
    {
        // Quests loaded from ScriptableObjects or JSON
        // For now, this is a placeholder
    }
    
    public bool StartQuest(string questID)
    {
        QuestData quest = GetQuestByID(questID);
        if (quest == null || quest.isActive || quest.isCompleted) return false;
        
        // Find empty active slot
        for (int i = 0; i < activeQuests.Length; i++)
        {
            if (activeQuests[i] == null)
            {
                quest.isActive = true;
                activeQuests[i] = quest;
                return true;
            }
        }
        
        return false; // No active quest slots available
    }
    
    public void UpdateQuestProgress(string questID, int objectiveIndex, int progress)
    {
        QuestData quest = GetActiveQuestByID(questID);
        if (quest == null) return;
        
        if (objectiveIndex < quest.objectives.Length)
        {
            quest.objectives[objectiveIndex].currentProgress += progress;
            
            if (quest.objectives[objectiveIndex].currentProgress >= quest.objectives[objectiveIndex].requiredProgress)
            {
                quest.objectives[objectiveIndex].completed = true;
            }
            
            CheckQuestCompletion(quest);
        }
    }
    
    void CheckQuestCompletion(QuestData quest)
    {
        bool allCompleted = true;
        foreach (var objective in quest.objectives)
        {
            if (!objective.completed)
            {
                allCompleted = false;
                break;
            }
        }
        
        if (allCompleted)
        {
            CompleteQuest(quest);
        }
    }
    
    void CompleteQuest(QuestData quest)
    {
        quest.isCompleted = true;
        quest.isActive = false;
        
        // Remove from active quests
        for (int i = 0; i < activeQuests.Length; i++)
        {
            if (activeQuests[i] != null && activeQuests[i].questID == quest.questID)
            {
                activeQuests[i] = null;
                break;
            }
        }
        
        // Add to completed quests
        for (int i = 0; i < completedQuests.Length; i++)
        {
            if (completedQuests[i] == null)
            {
                completedQuests[i] = quest;
                break;
            }
        }
        
        // Give rewards
        GiveQuestRewards(quest);
    }
    
    void GiveQuestRewards(QuestData quest)
    {
        if (quest.expReward > 0)
        {
            // Give experience to party
            // TODO: Implement
        }
        
        if (quest.coinReward > 0)
        {
            GameManager.Instance.inventoryManager.AddCoins(quest.coinReward);
        }
        
        if (quest.essenceReward > 0)
        {
            GameManager.Instance.inventoryManager.AddEssence(quest.essenceReward);
        }
    }
    
    QuestData GetQuestByID(string questID)
    {
        foreach (var quest in allQuests)
        {
            if (quest != null && quest.questID == questID)
            {
                return quest;
            }
        }
        return null;
    }
    
    QuestData GetActiveQuestByID(string questID)
    {
        foreach (var quest in activeQuests)
        {
            if (quest != null && quest.questID == questID)
            {
                return quest;
            }
        }
        return null;
    }
}
```

---

## Dialogue System Classes

### DialogueSystem.cs
**Purpose**: Handle NPC conversations and dialogue trees

```csharp
using UdonSharp;
using UnityEngine;
using UnityEngine.UI;
using System;

[Serializable]
public class DialogueNode
{
    public string dialogueID;
    public string speakerName;
    public string dialogueText;
    public string[] choiceTexts;
    public string[] nextNodeIDs;
    public string questTrigger; // Quest ID to start/update
}

public class DialogueSystem : UdonSharpBehaviour
{
    public DialogueNode[] dialogueDatabase;
    public GameObject dialoguePanel;
    public Text speakerNameText;
    public Text dialogueText;
    public GameObject[] choiceButtons;
    
    private DialogueNode currentNode;
    private bool dialogueActive = false;
    
    public void Initialize()
    {
        dialoguePanel.SetActive(false);
    }
    
    public void StartDialogue(string startNodeID)
    {
        currentNode = GetNodeByID(startNodeID);
        if (currentNode == null) return;
        
        dialogueActive = true;
        dialoguePanel.SetActive(true);
        DisplayCurrentNode();
    }
    
    void DisplayCurrentNode()
    {
        speakerNameText.text = currentNode.speakerName;
        dialogueText.text = currentNode.dialogueText;
        
        // Setup choice buttons
        for (int i = 0; i < choiceButtons.Length; i++)
        {
            if (i < currentNode.choiceTexts.Length)
            {
                choiceButtons[i].SetActive(true);
                choiceButtons[i].GetComponentInChildren<Text>().text = currentNode.choiceTexts[i];
            }
            else
            {
                choiceButtons[i].SetActive(false);
            }
        }
    }
    
    public void OnChoiceSelected(int choiceIndex)
    {
        if (choiceIndex < currentNode.nextNodeIDs.Length)
        {
            string nextNodeID = currentNode.nextNodeIDs[choiceIndex];
            
            if (nextNodeID == "END")
            {
                EndDialogue();
            }
            else
            {
                // Check for quest triggers
                if (!string.IsNullOrEmpty(currentNode.questTrigger))
                {
                    GameManager.Instance.questManager.StartQuest(currentNode.questTrigger);
                }
                
                currentNode = GetNodeByID(nextNodeID);
                DisplayCurrentNode();
            }
        }
    }
    
    void EndDialogue()
    {
        dialogueActive = false;
        dialoguePanel.SetActive(false);
        GameManager.Instance.ChangeGameState(0); // Return to exploration
    }
    
    DialogueNode GetNodeByID(string nodeID)
    {
        foreach (var node in dialogueDatabase)
        {
            if (node != null && node.dialogueID == nodeID)
            {
                return node;
            }
        }
        return null;
    }
    
    public void ShowDialogue()
    {
        // Called when game state changes to dialogue
        if (dialogueActive)
        {
            dialoguePanel.SetActive(true);
        }
    }
}
```

---

## Network Synchronization Classes

### NetworkSyncManager.cs
**Purpose**: Handle multiplayer synchronization

```csharp
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;

public class NetworkSyncManager : UdonSharpBehaviour
{
    // Player tracking
    private VRCPlayerApi[] connectedPlayers;
    private int playerCount = 0;
    
    // Sync intervals
    private float positionSyncInterval = 0.2f;
    private float lastPositionSync = 0f;
    
    public void Initialize()
    {
        connectedPlayers = new VRCPlayerApi[80]; // Max 80 players
        UpdatePlayerList();
    }
    
    void Update()
    {
        if (Time.time - lastPositionSync >= positionSyncInterval)
        {
            SyncPlayerPositions();
            lastPositionSync = Time.time;
        }
    }
    
    void UpdatePlayerList()
    {
        VRCPlayerApi[] allPlayers = new VRCPlayerApi[VRCPlayerApi.GetPlayerCount()];
        VRCPlayerApi.GetPlayers(allPlayers);
        
        playerCount = 0;
        foreach (var player in allPlayers)
        {
            if (player != null)
            {
                connectedPlayers[playerCount] = player;
                playerCount++;
            }
        }
    }
    
    void SyncPlayerPositions()
    {
        // Position syncing handled by VRChat's built-in system
        // This is for additional game-specific data
    }
    
    public override void OnPlayerJoined(VRCPlayerApi player)
    {
        UpdatePlayerList();
        
        // Send current game state to new player
        if (Networking.IsMaster)
        {
            SendGameStateToPlayer(player);
        }
    }
    
    public override void OnPlayerLeft(VRCPlayerApi player)
    {
        UpdatePlayerList();
        
        // Handle player leaving during battle
        if (GameManager.Instance.battleManager.battleActive)
        {
            RemovePlayerFromBattle(player);
        }
    }
    
    void SendGameStateToPlayer(VRCPlayerApi player)
    {
        // Send quest progress, defeated enemies, etc.
        // Implementation depends on data structure
    }
    
    void RemovePlayerFromBattle(VRCPlayerApi player)
    {
        // Remove player's character from battle
        // Continue battle without them
    }
}
```

---

## Summary

This UdonSharp architecture provides:

1. ✅ **Modular Systems**: Each system is independent and reusable
2. ✅ **Network-Ready**: All critical data is synced via UdonSynced
3. ✅ **VRChat Compatible**: Uses only Udon-supported features
4. ✅ **Performance-Optimized**: Minimal updates per frame
5. ✅ **Extensible**: Easy to add new features and content

### Next Steps:
1. Implement UI classes (BattleUI, MenuSystem)
2. Create Navigation/Movement classes
3. Implement Encounter system
4. Build test scenes for each system
5. Add content (quests, abilities, items, dialogues)
