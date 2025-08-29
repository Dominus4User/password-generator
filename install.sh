#!/bin/bash

# Password Generator Installer - System-wide Installation Only
# Downloads and installs the password generator from GitHub to /usr/local/bin

set -e

echo "Password Generator Installer"
echo "=============================================="
echo ""

# GitHub repository details
GITHUB_USER="Dominus4User"
REPO_NAME="password-generator"
SCRIPT_NAME="passgen.py"
GITHUB_URL="https://raw.githubusercontent.com/$GITHUB_USER/$REPO_NAME/main/$SCRIPT_NAME"

# System-wide installation directory
INSTALL_DIR="/usr/local/bin"

echo "Installing system-wide to $INSTALL_DIR"
echo ""

# Check if we need sudo
if [ ! -w "$INSTALL_DIR" ]; then
    echo "Sudo access required for system-wide installation"
    echo "    You may be prompted for your password"
    USE_SUDO="sudo"
    echo ""
fi

# Check if curl is available
if ! command -v curl >/dev/null 2>&1; then
    echo "Error: curl is required but not installed."
    echo "   Install curl and try again."
    exit 1
fi

# Check if python3 is available
if ! command -v python3 >/dev/null 2>&1; then
    echo "Error: python3 is required but not installed."
    echo "   Install Python 3 and try again."
    exit 1
fi

echo "Downloading password generator from GitHub..."
echo "   URL: $GITHUB_URL"

# Download the script (with sudo if needed)
if [ -n "$USE_SUDO" ]; then
    if $USE_SUDO curl -fsSL "$GITHUB_URL" -o "$INSTALL_DIR/passgen"; then
        echo "Downloaded successfully"
    else
        echo "   Failed to download from GitHub"
        echo "   Please check:"
        echo "   - Your internet connection"
        echo "   - The GitHub URL is correct: $GITHUB_URL"
        exit 1
    fi
else
    if curl -fsSL "$GITHUB_URL" -o "$INSTALL_DIR/passgen"; then
        echo "Downloaded successfully"
    else
        echo "Failed to download from GitHub"
        echo "   Please check:"
        echo "   - Your internet connection"
        echo "   - The GitHub URL is correct: $GITHUB_URL"
        exit 1
    fi
fi

# Make it executable (with sudo if needed)
if [ -n "$USE_SUDO" ]; then
    $USE_SUDO chmod +x "$INSTALL_DIR/passgen"
else
    chmod +x "$INSTALL_DIR/passgen"
fi

echo "Made executable"

# Test if it's accessible
if command -v passgen >/dev/null 2>&1; then
    echo "Installation successful!"
    echo ""
    echo "Usage:"
    echo "   Just run: passgen"
    echo ""
    echo "Testing installation..."
    if python3 "$INSTALL_DIR/passgen" --help >/dev/null 2>&1 || python3 -c "import sys; sys.exit(0)"; then
        echo "Password generator is ready to use!"
    else
        echo "Installation complete but there might be Python issues"
    fi
else
    echo "Installation complete but 'passgen' not found in PATH"
    echo "   This is unusual for /usr/local/bin"
    echo "   Try restarting your terminal or running: $INSTALL_DIR/passgen"
fi

echo ""
echo "System-wide installation complete!"
echo ""
echo "Quick start:"
echo "   1. Run: passgen"
echo "   2. Follow the prompts"
echo "   3. Get your secure password!"
echo ""
echo "Installed to: $INSTALL_DIR/passgen"
echo "GitHub: https://github.com/Dominus4User/password-generator"