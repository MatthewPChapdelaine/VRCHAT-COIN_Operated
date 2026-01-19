#!/bin/bash
# Repository Cleanup Script
# Moves files to their correct locations per the redesign

echo "🔧 Starting Repository Cleanup..."
echo ""

# Check if we're in the right directory
if [ ! -f "vpm-manifest.json" ]; then
    echo "❌ Error: Must run from repository root"
    exit 1
fi

# Create necessary directories if they don't exist
echo "📁 Ensuring directories exist..."
mkdir -p Docs
mkdir -p .archive

echo ""
echo "📚 Moving documentation files to Docs/..."

# Move documentation to Docs folder
if [ -f "INTEGRATION_GUIDE.md" ]; then
    mv INTEGRATION_GUIDE.md Docs/
    echo "  ✅ Moved INTEGRATION_GUIDE.md"
fi

if [ -f "UDONSHARP_ARCHITECTURE.md" ]; then
    mv UDONSHARP_ARCHITECTURE.md Docs/
    echo "  ✅ Moved UDONSHARP_ARCHITECTURE.md"
fi

if [ -f "BUILD_CHECKLIST.md" ]; then
    mv BUILD_CHECKLIST.md Docs/
    echo "  ✅ Moved BUILD_CHECKLIST.md"
fi

if [ -f "REPOSITORY_ANALYSIS.md" ]; then
    mv REPOSITORY_ANALYSIS.md Docs/
    echo "  ✅ Moved REPOSITORY_ANALYSIS.md"
fi

echo ""
echo "🗄️  Archiving legacy files..."

# Move legacy files to .archive
legacy_files=(
    "QUICKSTART.md"
    "LINUX_SETUP.md"
    "SIMPLE_SETUP.md"
    "TEMPLATE_SETUP_COMPLETE.md"
    "PROJECT_COMPLETE.md"
    "README_NEW.md"
    "Combine Command Jan15-25.md"
    "auto-setup.sh"
    "setup.sh"
    "git-push.sh"
    "quick-push.sh"
)

for file in "${legacy_files[@]}"; do
    if [ -e "$file" ]; then
        mv "$file" .archive/
        echo "  ✅ Archived $file"
    fi
done

echo ""
echo "🧹 Cleaning up empty directories..."

# Remove empty orbital-haven-vrchat folder if it exists and is empty
if [ -d "orbital-haven-vrchat" ]; then
    if [ -z "$(ls -A orbital-haven-vrchat)" ]; then
        rmdir orbital-haven-vrchat
        echo "  ✅ Removed empty orbital-haven-vrchat folder"
    else
        echo "  ⚠️  Warning: orbital-haven-vrchat is not empty, skipping"
    fi
fi

echo ""
echo "✅ Cleanup complete!"
echo ""
echo "📋 Summary:"
echo "  - Documentation moved to Docs/"
echo "  - Legacy files moved to .archive/"
echo "  - Empty folders removed"
echo ""
echo "🔍 Next steps:"
echo "  1. Review the changes"
echo "  2. Test that all links work"
echo "  3. Commit the reorganization"
echo ""
