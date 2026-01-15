#!/bin/bash
# Quick Git Push Script
# Run this from the repository root

cd "$(dirname "$0")"

echo "🚀 Pushing VRChat Unity Template to GitHub..."
echo ""

git add -A

echo "📋 Changes to commit:"
git status --short

echo ""
echo "💾 Committing..."
git commit -m "Add VRChat Unity project template with Linux Mint/ALCOM support

- Created complete Unity project structure in orbital-haven-vrchat/
- Added ProjectSettings for Unity 2022.3.6f1
- Set up Packages manifest with VRChat SDK scoped registry
- Created sample scene with basic Unity components
- Added comprehensive Linux setup guide (LINUX_SETUP.md)
- Updated main README with Linux/ALCOM instructions
- Added template setup documentation (TEMPLATE_SETUP_COMPLETE.md)
- Configured proper .gitignore for Unity projects
- Ready to open in VRChat Creative Companion on Linux Mint

The repository is now a fully functional VRChat World template."

echo ""
echo "📤 Pushing to GitHub..."
git push origin main

echo ""
echo "✅ Complete! View at:"
echo "https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated"
