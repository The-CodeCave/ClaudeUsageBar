#!/bin/bash

ICON_DIR="ClaudeUsageBar.iconset"
mkdir -p "$ICON_DIR"

# Create a simple green circle PNG using shortcuts
# We'll use a green emoji circle as icon

# Create HTML to render emoji as image
cat > /tmp/icon_template.html << 'HTML'
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"></head>
<body style="margin:0;padding:0;background:transparent;display:flex;align-items:center;justify-content:center;width:1024px;height:1024px;">
<div style="font-size:900px;line-height:1024px;">🟢</div>
</body>
</html>
HTML

# Take a screenshot of the HTML using webkit2png or screencapture
# For simplicity, let's just copy a system icon and tint it green

# Better approach: Use iconutil with existing template
# Create base image files
for size in 16 32 128 256 512; do
    # Create a simple colored PNG
    cat > /tmp/create_png_$size.py << PYTHON
from Cocoa import NSImage, NSColor, NSBezierPath, NSGraphicsContext, NSCompositingOperationSourceOver
from Foundation import NSMakeRect
import objc

# Create image
size = $size
img = NSImage.alloc().initWithSize_((size, size))
img.lockFocus()

# Draw green circle
NSColor.colorWithRed_green_blue_alpha_(0.13, 0.77, 0.37, 1.0).setFill()
path = NSBezierPath.bezierPathWithOvalInRect_(NSMakeRect(0, 0, size, size))
path.fill()

img.unlockFocus()
data = img.TIFFRepresentation()

# Save as PNG
bitmap = NSBitmapImageRep.imageRepWithData_(data)
png_data = bitmap.representationUsingType_properties_(4, None)  # 4 = PNG
png_data.writeToFile_atomically_("/tmp/icon_${size}.png", True)
PYTHON

    python3 /tmp/create_png_$size.py 2>/dev/null || {
        # Fallback: use a default icon
        echo "Creating fallback icon for size $size"
        # Just create empty placeholder
        sips -z $size $size /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/GenericApplicationIcon.icns --out "$ICON_DIR/icon_${size}x${size}.png" 2>/dev/null
    }
    
    if [ -f "/tmp/icon_${size}.png" ]; then
        mv "/tmp/icon_${size}.png" "$ICON_DIR/icon_${size}x${size}.png"
        # Create @2x version
        if [ $size -le 512 ]; then
            cp "$ICON_DIR/icon_${size}x${size}.png" "$ICON_DIR/icon_$((size/2))x$((size/2))@2x.png"
        fi
    fi
done

# Create 1024 version
cp "$ICON_DIR/icon_512x512.png" "$ICON_DIR/icon_512x512@2x.png" 2>/dev/null

# Convert to icns if we have icons
if [ -f "$ICON_DIR/icon_16x16.png" ]; then
    iconutil -c icns "$ICON_DIR" -o ClaudeUsageBar.icns
    echo "✅ Icon created: ClaudeUsageBar.icns"
else
    echo "❌ Failed to create icon"
fi

# Clean up
rm -rf "$ICON_DIR"
rm -f /tmp/icon_*.png /tmp/create_png_*.py
