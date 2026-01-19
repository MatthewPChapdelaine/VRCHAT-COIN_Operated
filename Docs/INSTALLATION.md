# Installation Guide
## Orbital Haven JRPG Theme for VRChat

This guide will walk you through installing the Orbital Haven JRPG theme into your existing VRChat world project.

---

## Prerequisites

Before you begin, ensure you have:

- ✅ **Unity 2022.3.22f1** (or later 2022.3.x version)
- ✅ **VRChat Creator Companion (VCC)** installed
- ✅ **Existing VRChat World project** (or create a new one)
- ✅ **VRChat SDK3 - Worlds** (installed via VCC)
- ✅ **UdonSharp 1.1.8+** (installed via VCC)
- ✅ **10+ GB free disk space**

---

## Installation Methods

Choose the method that works best for you:

### Method 1: Direct Copy (Recommended)

This is the fastest and simplest method.

#### Step 1: Download the Theme

```bash
# Clone the repository
git clone https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated.git

# Or download as ZIP from GitHub and extract
```

#### Step 2: Prepare Your Unity Project

1. Open your VRChat world project in Unity
2. Make sure the project has:
   - VRChat Worlds SDK installed
   - UdonSharp installed
3. Close Unity (important for file copying)

#### Step 3: Copy Theme Files

```bash
# Navigate to your Unity project folder
cd /path/to/your/VRChatProject

# Copy theme contents
cp -r /path/to/VRCHAT-COIN_Operated/Theme/* Assets/OrbitalHavenTheme/

# Alternative: Manual copy via file manager
# Copy the entire Theme/ folder into your Assets/ directory
```

#### Step 4: Import in Unity

1. Open your Unity project
2. Unity will automatically detect and import the new files
3. Wait for compilation to complete (may take 2-5 minutes)
4. Check the Console for any errors

✅ **Done!** Proceed to [Configuration](#configuration)

---

### Method 2: Unity Package Import

If you prefer using Unity's package system:

#### Step 1: Export as Unity Package (One-time setup)

```bash
# In Unity, with the theme files already in a test project:
# 1. Select the Theme folder in Project window
# 2. Right-click → Export Package
# 3. Save as "OrbitalHavenJRPG-Theme.unitypackage"
```

#### Step 2: Import into Your Project

1. Open your VRChat world project in Unity
2. Go to **Assets → Import Package → Custom Package**
3. Select the `OrbitalHavenJRPG-Theme.unitypackage` file
4. Click **Import All**
5. Wait for import to complete

✅ **Done!** Proceed to [Configuration](#configuration)

---

### Method 3: Git Submodule (Advanced)

For developers who want to track updates:

```bash
cd /path/to/your/VRChatProject

# Add as submodule
git submodule add https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated.git Assets/OrbitalHavenTheme

# Update submodule
git submodule update --init --recursive
```

To update the theme later:
```bash
cd Assets/OrbitalHavenTheme
git pull origin main
```

---

## Configuration

After installation, configure the theme for your world:

### Step 1: Verify Installation

Check that these folders exist in your Assets:

```
Assets/
├── OrbitalHavenTheme/
│   ├── Scripts/
│   ├── Prefabs/
│   ├── Materials/
│   └── Documentation/
```

### Step 2: Add Core Managers to Scene

1. Open your main world scene
2. Locate the following prefabs in `Assets/OrbitalHavenTheme/Prefabs/Core/`:
   - `GameManager.prefab`
   - `BattleManager.prefab`
   - `QuestManager.prefab`
   - `InventoryManager.prefab`
3. Drag these into your scene hierarchy (at root level)

### Step 3: Configure World Settings

1. Select the `GameManager` object in hierarchy
2. In the Inspector, configure:
   - **Max Players**: 20-40 (recommended)
   - **Battle Mode**: "Instanced" or "Open World"
   - **Respawn Point**: Assign your spawn point transform

### Step 4: Add UI Canvas

1. Find `Assets/OrbitalHavenTheme/Prefabs/UI/MainUI.prefab`
2. Drag into your scene hierarchy
3. Position the UI in your world (or keep as overlay)

### Step 5: Test Basic Functionality

1. Enter Play Mode in Unity
2. Check the Console for any errors
3. Verify managers are initialized (green checkmarks in Inspector)
4. Test basic interactions

✅ **Configuration Complete!**

---

## Verification Checklist

After installation, verify everything is working:

- [ ] No errors in Unity Console
- [ ] All manager scripts show "Initialized" in Play Mode
- [ ] UI elements are visible and responsive
- [ ] UdonSharp scripts compiled successfully
- [ ] Materials and prefabs load correctly
- [ ] Test scene plays without crashes

---

## Common Installation Issues

### Issue: "UdonSharp not found"

**Solution:**
1. Open VRChat Creator Companion
2. Select your project
3. Install/update UdonSharp to 1.1.8+
4. Restart Unity

### Issue: "Missing script references"

**Solution:**
1. Close Unity
2. Delete `Library/` folder in your project
3. Reopen Unity (will rebuild library)
4. Reimport theme files

### Issue: "Compilation errors"

**Solution:**
1. Check that all theme files were copied completely
2. Verify Unity version is 2022.3.22f1 or later
3. Check Console for specific error messages
4. See [Troubleshooting Guide](INTEGRATION_GUIDE.md#troubleshooting)

### Issue: "Performance issues in VR"

**Solution:**
1. Check that Quality Settings are set to "VR Low" for Quest
2. Disable complex shaders if on Quest
3. Reduce particle effects
4. See [Performance Optimization](INTEGRATION_GUIDE.md#performance)

---

## Next Steps

Now that the theme is installed:

1. **📖 Read the Integration Guide**: [INTEGRATION_GUIDE.md](INTEGRATION_GUIDE.md)
   - Learn how to customize systems
   - Add your own content
   - Configure advanced features

2. **🏗️ Follow the Build Checklist**: [BUILD_CHECKLIST.md](BUILD_CHECKLIST.md)
   - Systematic implementation guide
   - Track your progress
   - 200+ tasks organized by phase

3. **💻 Understand the Architecture**: [UDONSHARP_ARCHITECTURE.md](UDONSHARP_ARCHITECTURE.md)
   - Deep dive into code structure
   - Learn how systems communicate
   - Reference for customization

4. **🎨 Customize Your World**:
   - Replace placeholder assets with your own
   - Adjust colors, materials, and UI
   - Add custom abilities and items
   - Design your quest lines

---

## Getting Help

- **Documentation**: Check the `Docs/` folder for detailed guides
- **GitHub Issues**: Report bugs or request features
- **VRChat Forums**: Community support and discussions

---

## Uninstallation

To remove the theme from your project:

1. Close Unity
2. Delete the `Assets/OrbitalHavenTheme/` folder
3. Delete the `Assets/OrbitalHavenTheme.meta` file
4. Reopen Unity
5. Remove any theme GameObjects from your scene

---

**Installation complete!** 🎉  
Ready to start building your JRPG world.

Return to: [Main README](../README.md)
