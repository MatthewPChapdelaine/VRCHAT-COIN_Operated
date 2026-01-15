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

## Step 2: Clone or Download This Project

1. **Clone the repository:**
```bash
git clone https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated.git
cd VRCHAT-COIN_Operated/orbital-haven-vrchat/
```

Or if you already have the project, navigate to it:
```bash
cd /path/to/VRCHAT-COIN_Operated/orbital-haven-vrchat/
```

## Step 3: Install VRChat SDK Using vrc-get

1. **Add the official VRChat package repository:**
```bash
vrc-get repo add https://vpm.vrchat.com/curated
```

**Important:** Do NOT try to add this GitHub repository URL as a VPM repository. Only add the official VRChat curated repository shown above.

2. **Navigate to the Unity project folder:**
```bash
cd /path/to/VRCHAT-COIN_Operated/orbital-haven-vrchat/
```

3. **Install VRChat SDK and dependencies:**
```bash
vrc-get install vrc-worlds
vrc-get install udonsharp
```

4. **Verify the installation:**
```bash
vrc-get list
```

### Using VCC GUI (if using Wine method)

If you're using the Windows VCC with Wine:

1. Launch VCC
2. Click "Add Existing Project"
3. Navigate to: `/path/to/VRCHAT-COIN_Operated/orbital-haven-vrchat/`
4. Select the `orbital-haven-vrchat` folder
5. Click "Manage Project" and install required packages

## Step 4: Install Unity Hub and Unity Editor

1. **Install Unity Hub:**
```bash
# Download Unity Hub from https://unity.com/download
wget https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage

# Make it executable
chmod +x UnityHub.AppImage

# Run Unity Hub
./UnityHub.AppImage
```

2. **In Unity Hub, install Unity 2022.3.6f1:**
   - Click "Installs" in the left sidebar
   - Click "Install Editor"
   - Select version 2022.3.6f1
   - Include modules: Linux Build Support

3. **Add the project to Unity Hub:**
   - Click "Projects" in the left sidebar
   - Click "Add"
   - Navigate to `/workspaces/VRCHAT-COIN_Operated/orbital-haven-vrchat/`
   - Select the folder

4. **Open the project:**
   - Click on the project in Unity Hub to open it
   - Wait for initial import (5-10 minutes)
   - Sign in with VRChat account when prompted

## Troubleshooting

### "Failed to download the repository. Expected value at line 8 column 1"

**Problem**: You tried to add this GitHub repository as a VPM package repository.

**Solution**: Only add the official VRChat repository. Do NOT add the GitHub project URL:
```bash
# CORRECT - Add VRChat's official repository:
vrc-get repo add https://vpm.vrchat.com/curated

# WRONG - Don't add this project's GitHub URL as a repo
# vrc-get repo add https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated
```

### vrc-get command not found

**Solution**: Make sure the binary is in your PATH:
```bash
# Add to your ~/.bashrc or ~/.zshrc
export PATH="$HOME/.local/bin:$PATH"
source ~/.bashrc
```

### Unity version mismatch

**Solution**: Install the exact version 2022.3.6f1 through Unity Hub. Other versions may not be compatible with this project.

### Missing VRChat SDK

**Solution**: Run these commands in the project directory:
```bash
cd /workspaces/VRCHAT-COIN_Operated/orbital-haven-vrchat/
vrc-get install vrc-worlds
vrc-get install udonsharp
```

### Permission issues on Linux

**Solution**: Make sure you have write permissions for the project folder:
```bash
chmod -R u+w /workspaces/VRCHAT-COIN_Operated/orbital-haven-vrchat/
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
