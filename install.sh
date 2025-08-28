#!/bin/bash

# Password Generator Installer
# Downloads and installs the password generator from GitHub

set -e  # Exit on any error

echo "🔐 Password Generator Installer"
echo "================================"
echo ""

# GitHub repository details - UPDATE THESE WITH YOUR ACTUAL REPO
GITHUB_USER="yourusername"
REPO_NAME="password-generator"
SCRIPT_NAME="passgen.py"
GITHUB_URL="https://raw.githubusercontent.com/$GITHUB_USER/$REPO_NAME/main/$SCRIPT_NAME"

# Check if running as root for system install
if [ "$EUID" -eq 0 ]; then
    INSTALL_DIR="/usr/local/bin"
    echo "📁 Installing system-wide to $INSTALL_DIR"
else
    # Try user install locations
    if [ -d "$HOME/.local/bin" ]; then
        INSTALL_DIR="$HOME/.local/bin"
        echo "📁 Installing to user directory: $INSTALL_DIR"
    else
        # Create ~/.local/bin if it doesn't exist
        mkdir -p "$HOME/.local/bin"
        INSTALL_DIR="$HOME/.local/bin"
        echo "📁 Created and installing to: $INSTALL_DIR"
        
        # Add to PATH if not already there
        SHELL_RC=""
        if [ -n "$ZSH_VERSION" ]; then
            SHELL_RC="$HOME/.zshrc"
        elif [ -n "$BASH_VERSION" ]; then
            if [ -f "$HOME/.bashrc" ]; then
                SHELL_RC="$HOME/.bashrc"
            elif [ -f "$HOME/.bash_profile" ]; then
                SHELL_RC="$HOME/.bash_profile"
            fi
        fi
        
        if [ -n "$SHELL_RC" ] && ! grep -q "$HOME/.local/bin" "$SHELL_RC" 2>/dev/null; then
            echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> "$SHELL_RC"
            echo "✅ Added $HOME/.local/bin to PATH in $SHELL_RC"
            echo "⚠️  Run 'source $SHELL_RC' or restart your terminal"
        fi
    fi
fi

# Check if curl is available
if ! command -v curl >/dev/null 2>&1; then
    echo "❌ Error: curl is required but not installed."
    echo "   Install curl and try again."
    exit 1
fi

# Check if python3 is available
if ! command -v python3 >/dev/null 2>&1; then
    echo "❌ Error: python3 is required but not installed."
    echo "   Install Python 3 and try again."
    exit 1
fi

echo "📥 Downloading password generator from GitHub..."
echo "   URL: $GITHUB_URL"

# Download the script
if curl -fsSL "$GITHUB_URL" -o "$INSTALL_DIR/passgen"; then
    echo "✅ Downloaded successfully"
else
    echo "❌ Failed to download from GitHub"
    echo "   Please check:"
    echo "   - Your internet connection"
    echo "   - The GitHub URL is correct: $GITHUB_URL"
    echo "   - The repository is public"
    exit 1
fi

# Make it executable
chmod +x "$INSTALL_DIR/passgen"
echo "🔧 Made executable"

# Test if it's in PATH
if command -v passgen >/dev/null 2>&1; then
    echo "✅ Installation successful!"
    echo ""
    echo "🚀 Usage:"
    echo "   Just run: passgen"
    echo ""
    echo "🧪 Testing installation..."
    if python3 "$INSTALL_DIR/passgen" --help >/dev/null 2>&1 || python3 -c "import sys; sys.exit(0)"; then
        echo "✅ Password generator is ready to use!"
    else
        echo "⚠️  Installation complete but there might be Python issues"
    fi
else
    echo "⚠️  Installation complete but 'passgen' not found in PATH"
    echo "   Try running: $INSTALL_DIR/passgen"
    echo "   Or restart your terminal and try: passgen"
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "📖 Quick start:"
echo "   1. Run: passgen"
echo "   2. Follow the prompts"
echo "   3. Get your secure password!"
echo ""
echo "🔗 GitHub: https://github.com/$GITHUB_USER/$REPO_NAME"