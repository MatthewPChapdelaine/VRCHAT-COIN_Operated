# VRChat Creative Companion Setup for Linux Mint

This guide will help you set up ALCOM (VRChat Creator Companion for Linux) to open this VRChat world template.

## Prerequisites

- Linux Mint (or other Debian-based Linux distro)
- Internet connection
- VRChat account

## Step 1: Install vrc-get (VCC CLI for Linux)

The recommended tool for Linux is `vrc-get`, a command-line interface that provides VCC functionality natively.

### Installation

1. Download the latest release from: https://github.com/vrcget/vrc-get/releases

2. For Debian/Ubuntu-based systems, download the `.deb` package:
```bash
# Download latest version (check GitHub for actual version number)
wget https://github.com/vrcget/vrc-get/releases/latest/download/vrc-get_X.X.X_amd64.deb

# Install the package
sudo dpkg -i vrc-get_X.X.X_amd64.deb
```

3. Or install using the install script:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://vrc-get.anatawa12.com/installer/linux.sh | bash
```

4. Verify installation:
```bash
vrc-get --version
```

### Alternative: Using Official VCC with Wine (Not Recommended)

If you prefer the GUI version, you can run the Windows VCC with Wine, but this may have compatibility issues:
```bash
sudo apt install wine64 winetricks
# Download VCC from https://vrchat.com/home/download
wine VRChatCreatorCompanion.exe
```

## Step 2: Import This Template Using vrc-get

### Complete Setup Process:

1. **First, add the VRChat package repository (one-time setup):**
```bash
vrc-get repo add https://vpm.vrchat.com/curated
```

2. **Clone this template project to your local directory:**
```bash
# Clone to your home directory (recommended)
cd ~
git clone https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated.git
cd VRCHAT-COIN_Operated/orbital-haven-vrchat/

# OR clone to a specific location:
cd /path/to/your/projects/
git clone https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated.git
cd VRCHAT-COIN_Operated/orbital-haven-vrchat/
```

**If you need to re-clone** (to get a fresh copy):
```bash
# Remove the old directory first
rm -rf ~/VRCHAT-COIN_Operated

# Then clone again
cd ~
git clone https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated.git
cd VRCHAT-COIN_Operated/orbital-haven-vrchat/
```

3. **Install VRChat SDK packages into the project:**
```bash
# Make sure you're in the orbital-haven-vrchat folder
vrc-get install vrc-worlds
vrc-get install udonsharp
```

4. **Verify packages are installed:**
```bash
vrc-get list
```

You should see output showing `com.vrchat.worlds` and `com.vrchat.udonsharp` installed.

### If You Already Have the Project Downloaded:

```bash
# Navigate to the Unity project folder (not the repo root!)
cd /path/to/VRCHAT-COIN_Operated/orbital-haven-vrchat/

# Install packages
vrc-get install vrc-worlds
vrc-get install udonsharp

# Verify
vrc-get list
```

### Using VCC GUI (if using Wine method)

If you're using the Windows VCC with Wine instead of vrc-get:

1. Launch VCC
2. Click "Add Existing Project"
3. Browse to and select: `/path/to/VRCHAT-COIN_Operated/orbital-haven-vrchat/`
4. Click "Manage Project" and install required packages (VRChat Worlds SDK, UdonSharp)

## Step 3: Open in Unity

Now that the VRChat SDK packages are installed, open the project in Unity:

1. **Install Unity Hub (if not already installed):**
```bash
# Download Unity Hub
wget https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage
chmod +x UnityHub.AppImage
./UnityHub.AppImage
```

2. **Install Unity 2022.3.6f1 in Unity Hub:**
   - Click "Installs" → "Install Editor"
   - Select version **2022.3.6f1**
   - Include: Linux Build Support

3. **Add and open the project:**
   - Click "Projects" → "Add"
   - Select: `/path/to/VRCHAT-COIN_Operated/orbital-haven-vrchat/`
   - Click on the project to open it
   - Wait 5-10 minutes for initial package import
   - Sign in with your VRChat account when prompted

4. **Verify everything loaded:**
   - Check for "VRChat SDK" in the top menu bar
   - Open `Assets/Scenes/SampleScene.unity`
   - No errors should appear in the Console

## Troubleshooting

### "Failed to download the repository" Error

**Problem**: You tried to run `vrc-get repo add https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated`

**Solution**: Don't add the project GitHub URL. Only add VRChat's official repository:
```bash
# CORRECT:
vrc-get repo add https://vpm.vrchat.com/curated

# WRONG - Don't do this:
# vrc-get repo add https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated
```

### "Command not found" or vrc-get not working

**Solution**: 
```bash
# Ensure vrc-get is in your PATH
export PATH="$HOME/.local/bin:$PATH"
source ~/.bashrc

# Verify it works
vrc-get --version
```

### Packages not installing / "Project not found"

**Problem**: You're running vrc-get commands from the wrong directory.

**Solution**: You MUST be inside the `orbital-haven-vrchat` folder (the Unity project folder):
```bash
# Wrong - don't run from repo root
cd /path/to/VRCHAT-COIN_Operated
vrc-get install vrc-worlds  # This will fail!

# Correct - run from Unity project folder
cd /path/to/VRCHAT-COIN_Operated/orbital-haven-vrchat
vrc-get install vrc-worlds  # This works!
```

### Missing VRChat SDK after install

**Solution**: 
```bash
cd /path/to/VRCHAT-COIN_Operated/orbital-haven-vrchat/
vrc-get install vrc-worlds
vrc-get install udonsharp
vrc-get list  # Verify they're installed
```

### Permission issues

**Solution**:
```bash
chmod -R u+w /path/to/VRCHAT-COIN_Operated/orbital-haven-vrchat/
```

## Quick Reference

**Complete setup in order:**
```bash
# 1. Install vrc-get (one-time)
curl --proto '=https' --tlsv1.2 -sSf https://vrc-get.anatawa12.com/installer/linux.sh | bash

# 2. Add VRChat repo (one-time)
vrc-get repo add https://vpm.vrchat.com/curated

# 3. Clone template
git clone https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated.git
cd VRCHAT-COIN_Operated/orbital-haven-vrchat/

# 4. Install packages
vrc-get install vrc-worlds
vrc-get install udonsharp

# 5. Open in Unity Hub
# Then open the orbital-haven-vrchat folder as a Unity project
```

## Additional Resources

### Project Repository
- **This Project on GitHub**: https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated
- **Clone Command**: `git clone https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated.git`
- **Quick Setup**: After cloning, navigate to `orbital-haven-vrchat/` and follow Step 2 above

### VRChat Development Resources
- **vrc-get Documentation**: https://github.com/vrcget/vrc-get
- **VRChat Creator Companion Docs**: https://vcc.docs.vrchat.com/
- **VRChat SDK Documentation**: https://creators.vrchat.com/
- **UdonSharp Documentation**: https://udonsharp.docs.vrchat.com/

## Support

If you encounter issues:

1. Check the [vrc-get documentation](https://github.com/vrcget/vrc-get)
2. Visit the [VRChat Discord](https://discord.gg/vrchat) #sdk-support channel
3. Check the [vrc-get GitHub Issues](https://github.com/vrcget/vrc-get/issues) for Linux-specific problems

---

**Project Status**: ✅ Template ready for vrc-get/VCC

**Tested On**: Linux Mint 21.x, Ubuntu 22.04
