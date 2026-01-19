# Pending File Reorganization

## Status
The repository redesign is structurally complete, but some files still need to be moved to their final locations.

## Files to Move

### Documentation Files (move to Docs/)
```bash
mv INTEGRATION_GUIDE.md Docs/
mv UDONSHARP_ARCHITECTURE.md Docs/
mv BUILD_CHECKLIST.md Docs/
mv REPOSITORY_ANALYSIS.md Docs/
```

### Legacy Files (move to .archive/)
```bash
mv QUICKSTART.md .archive/
mv LINUX_SETUP.md .archive/
mv SIMPLE_SETUP.md .archive/
mv TEMPLATE_SETUP_COMPLETE.md .archive/
mv PROJECT_COMPLETE.md .archive/
mv README_NEW.md .archive/
mv "Combine Command Jan15-25.md" .archive/
mv auto-setup.sh .archive/
mv setup.sh .archive/
mv git-push.sh .archive/
mv quick-push.sh .archive/
```

### Empty Folder (remove)
```bash
rmdir orbital-haven-vrchat  # if empty
```

## Quick Fix

Run the provided cleanup script:
```bash
chmod +x cleanup-repo.sh
./cleanup-repo.sh
```

Or execute the commands above manually.

## Why This Matters

Currently, documentation links in README.md point to `Docs/INTEGRATION_GUIDE.md` etc., but these files are still in the root directory, creating broken links.

Once files are moved, all documentation links will work correctly.

## When to Do This

Before the next commit after this one, or as soon as possible to fix broken documentation links.
