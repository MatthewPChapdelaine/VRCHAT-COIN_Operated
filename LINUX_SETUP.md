# VRChat Creative Companion Setup for Linux Mint

This guide will help you set up ALCOM (VRChat Creator Companion for Linux) to open this VRChat world template.

## Prerequisites

- Linux Mint (or other Debian-based Linux distro)
- Internet connection
- VRChat account

## Step 1: Install ALCOM (VCC for Linux)

ALCOM is the community-maintained version of VRChat Creator Companion for Linux.

### Option A: Using the Official VCC (with Wine)

1. Install Wine:
```bash
sudo apt update
sudo apt install wine64 winetricks
```

2. Download VCC from https://vrchat.com/home/download

3. Run VCC with Wine:
```bash
wine VRChatCreatorCompanion.exe
```

### Option B: Using ALCOM (Recommended for Linux)

1. Check the ALCOM repository: https://github.com/vrcget/vrc-get

2. Follow installation instructions for your distro

3. ALCOM provides native Linux support with similar functionality to VCC

## Step 2: Add This Project to VCC/ALCOM

1. **Launch VCC/ALCOM**

2. **Click "Add Existing Project"**

3. **Navigate to the project folder:**
   - Browse to: `/path/to/VRCHAT-COIN_Operated/orbital-haven-vrchat/`
   - **Important**: Select the `orbital-haven-vrchat` folder, NOT the repository root

4. **VCC will detect the project:**
   - It will recognize it as a Unity 2022.3.6f1 project
   - It will show required VRChat SDK dependencies

5. **Install Dependencies:**
   - Click "Manage Project"
   - Install/Update VRChat Worlds SDK
   - Install/Update UdonSharp
   - Wait for the process to complete

## Step 3: Open the Project in Unity

1. **In VCC/ALCOM, click "Open Project"**
   - Unity Hub will launch (install if prompted)
   - Unity 2022.3.6f1 will be downloaded if not present
   - The project will open in Unity

2. **First-time setup in Unity:**
   - Wait for initial package import (can take 5-10 minutes)
   - VRChat SDK will initialize
   - You may see a VRChat SDK login prompt - sign in with your VRChat account

3. **Verify Installation:**
   - Check that "VRChat SDK" appears in the top menu bar
   - Open `Assets/Scenes/SampleScene.unity`
   - The scene should load without errors

## Troubleshooting

### VCC doesn't detect the project

**Solution**: Make sure you're selecting the `orbital-haven-vrchat` folder, which contains:
- `Assets/` folder
- `Packages/` folder
- `ProjectSettings/` folder

### Unity version mismatch

**Solution**: VCC will automatically download Unity 2022.3.6f1. If you have a different version, let VCC manage the installation.

### Missing VRChat SDK

**Solution**: In VCC, click "Manage Project" and install the VRChat Worlds SDK from the packages list.

### Permission issues on Linux

**Solution**: Make sure you have write permissions for the project folder:
```bash
chmod -R u+w /path/to/VRCHAT-COIN_Operated/orbital-haven-vrchat/
```

### Wine/Compatibility issues

**Solution**: 
- Update Wine: `sudo apt update && sudo apt upgrade wine64`
- Try ALCOM as a native Linux alternative
- Check VCC logs in `~/.wine/drive_c/users/[username]/AppData/Local/VRChatCreatorCompanion/`

## Next Steps

Once the project opens successfully in Unity:

1. **Read the project README**: See `orbital-haven-vrchat/README.md`
2. **Check the QUICKSTART guide**: See `QUICKSTART.md` in the repository root
3. **Start building**: Follow `INTEGRATION_GUIDE.md` for implementation steps

## Additional Resources

- **VRChat Creator Companion Docs**: https://vcc.docs.vrchat.com/
- **ALCOM (VCC for Linux)**: https://github.com/vrcget/vrc-get
- **VRChat SDK Documentation**: https://creators.vrchat.com/
- **UdonSharp Documentation**: https://udonsharp.docs.vrchat.com/

## Support

If you encounter issues:

1. Check the [VCC documentation](https://vcc.docs.vrchat.com/)
2. Visit the [VRChat Discord](https://discord.gg/vrchat) #sdk-support channel
3. Check the [ALCOM GitHub Issues](https://github.com/vrcget/vrc-get/issues) for Linux-specific problems

---

**Project Status**: ✅ Template ready for VCC/ALCOM

**Tested On**: Linux Mint 21.x, Ubuntu 22.04
