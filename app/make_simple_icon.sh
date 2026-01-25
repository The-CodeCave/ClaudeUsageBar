#!/bin/bash

# Create icon directory
ICONSET="ClaudeUsageBar.iconset"
mkdir -p "$ICONSET"

# Use ImageMagick or create using Swift
cat > CreateIcon.swift << 'SWIFT'
import Cocoa

let sizes = [16, 32, 64, 128, 256, 512, 1024]

for size in sizes {
    let img = NSImage(size: NSSize(width: size, height: size))
    img.lockFocus()
    
    // Green background circle
    let greenColor = NSColor(red: 0.13, green: 0.77, blue: 0.37, alpha: 1.0)
    greenColor.setFill()
    
    let path = NSBezierPath(ovalIn: NSRect(x: 0, y: 0, width: size, height: size))
    path.fill()
    
    img.unlockFocus()
    
    // Save as PNG
    if let tiffData = img.tiffRepresentation,
       let bitmap = NSBitmapImageRep(data: tiffData),
       let pngData = bitmap.representation(using: .png, properties: [:]) {
        let filename = "ClaudeUsageBar.iconset/icon_\(size)x\(size).png"
        try? pngData.write(to: URL(fileURLWithPath: filename))
        
        // Create @2x versions
        if size <= 512 {
            let filename2x = "ClaudeUsageBar.iconset/icon_\(size/2)x\(size/2)@2x.png"
            try? pngData.write(to: URL(fileURLWithPath: filename2x))
        }
    }
}

print("Icons created!")
SWIFT

swiftc -o CreateIcon CreateIcon.swift -framework Cocoa
./CreateIcon
rm CreateIcon CreateIcon.swift

# Convert to icns
iconutil -c icns "$ICONSET" -o ClaudeUsageBar.icns

# Copy to app bundle Resources
mkdir -p build/ClaudeUsageBar.app/Contents/Resources
cp ClaudeUsageBar.icns build/ClaudeUsageBar.app/Contents/Resources/

# Update Info.plist to reference icon
/usr/libexec/PlistBuddy -c "Add :CFBundleIconFile string ClaudeUsageBar" build/ClaudeUsageBar.app/Contents/Info.plist 2>/dev/null || \
/usr/libexec/PlistBuddy -c "Set :CFBundleIconFile ClaudeUsageBar" build/ClaudeUsageBar.app/Contents/Info.plist

# Clean up
rm -rf "$ICONSET"

echo "✅ Icon created and added to app!"
