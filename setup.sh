#!/bin/bash
# Automated Setup Script for Orbital Haven JRPG
# This script helps automate the initial project setup

set -e

echo "🎮 Orbital Haven JRPG - Automated Setup"
echo "========================================"
echo ""

# Check if VRChat Creator Companion is installed
echo "📋 Checking prerequisites..."
if ! command -v vcc &> /dev/null; then
    echo "⚠️  VRChat Creator Companion (VCC) not found in PATH"
    echo "   Please install VCC from: https://vrchat.com/home/download"
    echo "   After installation, run this script again"
    exit 1
fi

echo "✓ VCC detected"
echo ""

# Check if Unity Hub is installed
if command -v unityhub &> /dev/null; then
    echo "✓ Unity Hub detected"
else
    echo "⚠️  Unity Hub not detected (optional, VCC can manage Unity)"
fi
echo ""

# Create necessary directories if they don't exist
echo "📁 Verifying project structure..."
mkdir -p Assets/Scenes
mkdir -p Assets/Scripts/Udon/Core
mkdir -p Assets/Prefabs
mkdir -p ProjectSettings
echo "✓ Directory structure verified"
echo ""

# Check if vpm-manifest.json exists
if [ -f "vpm-manifest.json" ]; then
    echo "✓ VCC manifest found"
else
    echo "❌ Error: vpm-manifest.json not found"
    echo "   This file is required for VCC to recognize the project"
    exit 1
fi
echo ""

# Display next steps
echo "✅ Prerequisites check complete!"
echo ""
echo "🚀 Next Steps:"
echo "1. Open VRChat Creator Companion"
echo "2. Click 'Add' → 'Add Existing Project'"
echo "3. Select this folder: $(pwd)"
echo "4. Click 'Open Project' to launch Unity"
echo "5. In Unity: VRChat SDK → Build & Test"
echo ""
echo "📖 For detailed instructions, see QUICKSTART.md"
echo ""
echo "Need help? Visit: https://github.com/MatthewPChapdelaine/VRCHAT-COIN_Operated"
echo ""
