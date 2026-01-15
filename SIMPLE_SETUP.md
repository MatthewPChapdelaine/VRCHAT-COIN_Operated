# VRChat Unity Template - Simple Setup (3 Steps!)

## Step 1: Download the Template

**Option A: Download as ZIP** (Easiest - No git required!)
1. Go to: https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated
2. Click the green **"Code"** button
3. Click **"Download ZIP"**
4. Extract the ZIP file to a folder like `~/Projects/` or your Desktop

**Option B: Clone with Git**
```bash
cd ~
git clone https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated.git
```

---

## Step 2: Run the Setup Script

Open a terminal in the extracted folder and run:

```bash
cd VRCHAT-COIN_Operated
bash auto-setup.sh
```

**That's it!** The script will automatically:
- ✅ Install vrc-get (if needed)
- ✅ Add VRChat package repository
- ✅ Install VRChat Worlds SDK
- ✅ Install UdonSharp

---

## Step 3: Open in Unity

1. **Install Unity Hub**: https://unity.com/download
2. **Install Unity 2022.3.6f1** in Unity Hub
3. **Add project**: In Unity Hub, click "Add" and select the `orbital-haven-vrchat` folder
4. **Open and build!**

---

## That's All!

You now have a ready-to-use VRChat world template!

**Need help?** See [LINUX_SETUP.md](LINUX_SETUP.md) for detailed troubleshooting.

---

## What if the script fails?

If `auto-setup.sh` doesn't work, manually run these commands:

```bash
# Install vrc-get
curl --proto '=https' --tlsv1.2 -sSf https://vrc-get.anatawa12.com/installer/linux.sh | bash

# Add repository
vrc-get repo add https://vpm.vrchat.com/curated

# Go to Unity project folder
cd VRCHAT-COIN_Operated/orbital-haven-vrchat/

# Install packages
vrc-get install vrc-worlds
vrc-get install udonsharp
```
