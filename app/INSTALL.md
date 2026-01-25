# ClaudeUsageBar - Installation Guide

## Quick Install (Recommended)

### Option 1: DMG Installer (Easiest)

1. **Download** `ClaudeUsageBar-Installer.dmg`
2. **Double-click** the DMG file to mount it
3. **Drag** the ClaudeUsageBar app to the Applications folder
4. **Eject** the DMG from Finder
5. **Open** ClaudeUsageBar from Applications folder
   - First time: Right-click → Open (to bypass macOS security)
   - After that: Just open normally

### Option 2: ZIP File

1. **Download** `ClaudeUsageBar.zip`
2. **Extract** the ZIP (double-click)
3. **Drag** ClaudeUsageBar.app to Applications folder
4. **Right-click** → Open (first time only)

## First Launch

When you first open ClaudeUsageBar:

1. You'll see: **"👋 Welcome! Set your session cookie below to get started."**
2. Click **"Set Session Cookie"**
3. Follow the instructions to get your cookie from claude.ai
4. Paste the cookie and click **"Save Cookie & Fetch"**
5. Your usage will appear in the menu bar! 🎉

## Getting Your Session Cookie

1. Go to **Settings > Usage** on claude.ai
2. Press **F12** (or Cmd+Option+I on Mac)
3. Go to **Network** tab
4. Refresh the page, click any request
5. Find **'Cookie'** in Request Headers
6. Copy the **full cookie value**
   (starts with anthropic-device-id=...)
7. Paste into ClaudeUsageBar

## Features

✅ Real-time session (5-hour) and weekly (7-day) usage tracking
✅ Color-coded menu bar icon (🟢 green / 🟡 yellow / 🔴 red)
✅ Notifications at 25%, 50%, 75%, 90% usage
✅ Cmd+U keyboard shortcut to toggle popup
✅ Auto-refresh every 5 minutes
✅ Pro plan: Weekly Sonnet usage tracking

## Settings

### Notifications
- **Enable/Disable**: Toggle to receive usage alerts
- **Test Button**: Click "Test Notification" to verify notifications work
- **No permissions needed**: Uses NSUserNotification API

### Keyboard Shortcut (Cmd+U)
- **Toggle popup from anywhere** on your Mac
- **Requires Accessibility permission**:
  1. Click "Enable Keyboard Shortcut" button
  2. System Settings → Privacy & Security → Accessibility
  3. Enable ClaudeUsageBar
  4. Restart the app

### Launch at Login
- **Auto-start**: Enable to launch ClaudeUsageBar when you log in

## Troubleshooting

**"App can't be opened because it's from an unidentified developer"**
- Right-click → Open (instead of double-clicking)
- Or: System Settings → Privacy & Security → Open Anyway

**"No data yet" message**
- Make sure you've pasted your session cookie
- Click "Save Cookie & Fetch"
- Check that you're copying the full cookie string

**Usage not updating**
- Cookie may have expired - get a new one from claude.ai
- Click "Clear Cookie" and re-add
- Manual refresh: Click the refresh button in popup

**Notifications not appearing**
- Click "Test Notification" in Settings
- Check macOS Focus mode isn't blocking notifications
- Notifications work without permission dialogs

**Cmd+U shortcut not working**
- Click "Enable Keyboard Shortcut" in Settings
- Grant Accessibility permission in System Settings
- Restart the app after granting permission

## Uninstall

1. Quit ClaudeUsageBar (right-click icon → Quit)
2. Drag ClaudeUsageBar from Applications to Trash
3. (Optional) Remove saved data:
   ```bash
   defaults delete com.claude.usagebar
   ```

## Privacy & Security

- ✅ All data stays on your Mac (stored in UserDefaults)
- ✅ Session cookies stored locally only
- ✅ No analytics, no tracking, no external services
- ✅ No hardcoded credentials (org ID extracted from your cookie)
- ✅ Open source - review the code yourself

## System Requirements

- **macOS**: 12.0 (Monterey) or later
- **Architecture**: Apple Silicon (M1/M2/M3) or Intel
- **Account**: Active Claude.ai account (Free or Pro)

## Support

Issues? Questions?
- Check the README.md for more details
- Report bugs on GitHub Issues
- Cookie expires? Get a new one from claude.ai

## What Data is Tracked?

The app displays:
- **Session usage**: Current 5-hour chat session limit
- **Weekly usage**: 7-day conversation limit
- **Weekly Sonnet** (Pro plan only): Sonnet model weekly quota
- **Reset times**: When limits refresh

All data is fetched directly from claude.ai using your cookie.

## Notes

- Notifications use the legacy NSUserNotification API (no permissions required)
- Keyboard shortcuts require Accessibility permission
- The app is a menu bar utility (no Dock icon)
- Auto-refresh happens every 5 minutes
- Manual refresh available anytime
