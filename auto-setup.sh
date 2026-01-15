#!/bin/bash

# VRChat Unity Template - Automated Setup Script
# This script will automatically set up the VRChat SDK packages for you

echo "🚀 VRChat Unity Template - Automated Setup"
echo "=========================================="
echo ""

# Check if we're in the right directory
if [ ! -d "orbital-haven-vrchat" ]; then
    echo "❌ Error: orbital-haven-vrchat folder not found!"
    echo "Please run this script from the VRCHAT-COIN_Operated folder."
    exit 1
fi

# Check if vrc-get is installed
if ! command -v vrc-get &> /dev/null; then
    echo "📥 vrc-get not found. Installing..."
    echo ""
    
    # Install vrc-get
    curl --proto '=https' --tlsv1.2 -sSf https://vrc-get.anatawa12.com/installer/linux.sh | bash
    
    # Add to PATH for this session
    export PATH="$HOME/.local/bin:$PATH"
    
    # Verify installation
    if ! command -v vrc-get &> /dev/null; then
        echo "❌ Failed to install vrc-get. Please install manually from:"
        echo "   https://github.com/vrcget/vrc-get/releases"
        exit 1
    fi
    
    echo "✅ vrc-get installed successfully!"
    echo ""
fi

# Add VRChat repository
echo "📦 Adding VRChat package repository..."
vrc-get repo add https://vpm.vrchat.com/curated 2>/dev/null || echo "   (Repository already added)"
echo ""

# Navigate to Unity project folder
cd orbital-haven-vrchat

# Install VRChat SDK
echo "📥 Installing VRChat Worlds SDK..."
vrc-get install vrc-worlds

echo ""
echo "📥 Installing UdonSharp..."
vrc-get install udonsharp

echo ""
echo "📋 Verifying installation..."
vrc-get list

echo ""
echo "✅ Setup Complete!"
echo ""
echo "📂 Your project is ready at: $(pwd)"
echo ""
echo "Next Steps:"
echo "1. Install Unity Hub from: https://unity.com/download"
echo "2. Install Unity 2022.3.6f1 in Unity Hub"
echo "3. Add this folder to Unity Hub: $(pwd)"
echo "4. Open the project and start building!"
echo ""
echo "Need help? Check LINUX_SETUP.md for troubleshooting."
