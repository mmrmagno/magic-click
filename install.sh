#!/bin/bash

# Define the app name and bundle structure
APP_NAME="MagicMouseApp"
BUNDLE_DIR="$APP_NAME.app"
CONTENTS_DIR="$BUNDLE_DIR/Contents"
MACOS_DIR="$CONTENTS_DIR/MacOS"
RESOURCES_DIR="$CONTENTS_DIR/Resources"
PLIST_FILE="$CONTENTS_DIR/Info.plist"

# Create the necessary directory structure
echo "Creating app bundle structure..."
mkdir -p "$MACOS_DIR"
mkdir -p "$RESOURCES_DIR"

# Check if the compiled binary exists
if [ ! -f "$APP_NAME" ]; then
  echo "Compiled binary '$APP_NAME' not found. Please compile your app first."
  exit 1
fi

# Move the compiled binary to the MacOS directory
echo "Moving the compiled binary to the app bundle..."
mv "$APP_NAME" "$MACOS_DIR/"

# Create Info.plist if it doesn't exist
if [ ! -f "$PLIST_FILE" ]; then
  echo "Creating Info.plist..."
  cat <<EOL > "$PLIST_FILE"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleName</key>
    <string>$APP_NAME</string>
    <key>CFBundleIdentifier</key>
    <string>com.marc.$APP_NAME</string>
    <key>CFBundleVersion</key>
    <string>1.0</string>
    <key>CFBundleExecutable</key>
    <string>$APP_NAME</string>
    <key>NSPrincipalClass</key>
    <string>NSApplication</string>
</dict>
</plist>
EOL
fi

# Make sure the app is executable
echo "Setting executable permissions..."
chmod +x "$MACOS_DIR/$APP_NAME"

# Notify the user and provide instructions to run the app
echo "Installation complete. You can run the app using the following command:"
echo "open $BUNDLE_DIR"
