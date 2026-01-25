# ClaudeUsageBar - Distribution Guide

## ✅ Security Check Completed

All sensitive data has been removed:
- ✅ No hardcoded org IDs (now extracted dynamically from user's cookie)
- ✅ No hardcoded session cookies
- ✅ All user data stored locally using UserDefaults

## How to Distribute Your App

### Option 1: Simple ZIP Distribution (Recommended for Quick Sharing)

1. **Build the app** (already done):
   ```bash
   cd "/Users/mb/Desktop/Local Apps/Internal Scripts/ClaudeUsageBar"
   ./build.sh
   ```

2. **Locate the built app**:
   ```
   build/ClaudeUsageBar.app
   ```

3. **Create a ZIP file**:
   - Right-click on `ClaudeUsageBar.app`
   - Select "Compress ClaudeUsageBar"
   - This creates `ClaudeUsageBar.zip`

4. **Share the ZIP**:
   - Upload to Google Drive, Dropbox, or GitHub Releases
   - Share the download link
   - Users extract and drag to Applications folder

**User Installation**:
```
1. Download ClaudeUsageBar.zip
2. Extract it (double-click)
3. Drag ClaudeUsageBar.app to Applications folder
4. Right-click > Open (first time only, to bypass Gatekeeper)
5. Set session cookie and enjoy!
```

### Option 2: GitHub Release (Recommended for Open Source)

1. **Create a GitHub repository**:
   ```bash
   cd "/Users/mb/Desktop/Local Apps/Internal Scripts/ClaudeUsageBar"
   git init
   git add ClaudeUsageBar.swift Info.plist build.sh README.md
   git commit -m "Initial commit"
   git remote add origin <your-repo-url>
   git push -u origin main
   ```

2. **Create a Release**:
   - Go to GitHub → Releases → "Create a new release"
   - Tag: `v1.0.0`
   - Title: `ClaudeUsageBar v1.0.0`
   - Upload `ClaudeUsageBar.zip` as an asset
   - Publish release

3. **Share the release link**:
   ```
   https://github.com/yourusername/ClaudeUsageBar/releases/latest
   ```

### Option 3: Code Signing (For Professional Distribution)

If you want to avoid the "unidentified developer" warning:

1. **Get an Apple Developer account** ($99/year):
   - https://developer.apple.com

2. **Code sign the app**:
   ```bash
   codesign --force --deep --sign "Developer ID Application: Your Name" \
     "build/ClaudeUsageBar.app"
   ```

3. **Notarize with Apple** (optional but recommended):
   ```bash
   xcrun notarytool submit ClaudeUsageBar.zip \
     --apple-id your@email.com \
     --team-id TEAMID \
     --password app-specific-password
   ```

### Option 4: Homebrew Cask (For Advanced Users)

Create a Homebrew formula for easy installation:
```
brew install --cask claudeusagebar
```

This requires creating a tap repository and formula.

## Recommended Approach

**For most users, use Option 1 or 2:**

1. ✅ Build the app with `./build.sh`
2. ✅ ZIP the `build/ClaudeUsageBar.app` file
3. ✅ Upload to GitHub Releases or file hosting
4. ✅ Share the download link

## What to Include in Your Distribution

### README.md (already exists)
Should include:
- What the app does
- Installation instructions
- How to get session cookie
- Screenshot

### LICENSE (add this)
Choose a license:
- MIT License (most permissive)
- Apache 2.0
- GPL v3

### Privacy Notice
Add to README:
```markdown
## Privacy & Security

- All data stays on your Mac (stored in UserDefaults)
- Session cookies are stored locally and never sent anywhere except claude.ai
- No analytics, no tracking, no external services
- Open source - you can review all code
```

## Current Status

✅ **Ready for Distribution!**
- No hardcoded sensitive data
- Org ID extracted dynamically from user's cookie
- All user data stays local
- App works independently for each user

## Quick Distribution Checklist

- [x] Remove hardcoded org IDs
- [x] Remove hardcoded session cookies
- [x] Test app works with fresh install
- [ ] Create README with installation instructions
- [ ] Add LICENSE file
- [ ] Add privacy notice
- [ ] Create GitHub repository
- [ ] Build and ZIP the app
- [ ] Create GitHub Release
- [ ] Share download link!

## Building for Distribution

Run this command to create a clean build:
```bash
cd "/Users/mb/Desktop/Local Apps/Internal Scripts/ClaudeUsageBar"
rm -rf build
./build.sh
cd build
zip -r ClaudeUsageBar.zip ClaudeUsageBar.app
```

The `ClaudeUsageBar.zip` is now ready for distribution! 🎉
