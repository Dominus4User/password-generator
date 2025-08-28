Password Generator
A simple, secure, and interactive command-line password generator that works on Mac and Linux. Generate strong passwords with customizable options for length, symbols, numbers, and case sensitivity.
Show Image
Show Image
Show Image
Features
Interactive prompts - No command-line arguments to remember
Customizable length - Choose password length from 1-30 characters
Character options - Toggle symbols, numbers, and uppercase letters
Easy installation - One-command install script
Cross-platform - Works on both Mac and Linux
Secure - Uses Python's cryptographically secure random module
No dependencies - Uses only Python standard library
Quick Install
One-Line Install
bash
curl -sSL https://raw.githubusercontent.com/yourusername/password-generator/main/install.sh | bash
Manual Install
bash
# Download installer
curl -o install.sh https://raw.githubusercontent.com/yourusername/password-generator/main/install.sh

# Make executable and run
chmod +x install.sh
./install.sh
System-wide Install (requires sudo)
bash
sudo curl -sSL https://raw.githubusercontent.com/yourusername/password-generator/main/install.sh | bash
Usage
After installation, simply run:
bash
passgen
The interactive prompts will guide you through password creation:
=== Password Generator ===

Enter password length (1-30): 16
Include symbols? [n/Y]: y
Include numbers? [n/Y]: y
Include uppercase letters? [n/Y]: y

Generated Password:
====================
K9#mX2$vL!pQ8@Wz
====================

Length: 16 characters
Includes: lowercase letters, uppercase letters, numbers, symbol Options
Option	Description	Default
Length	Password length (1-30 characters)	User input required
Symbols	Include special characters `!@#$%^&*()-_+=[]{}	;:,.<>?`
Numbers	Include digits 0-9	No (n)
Uppercase	Include uppercase letters A-Z	No (n)
Note: Lowercase letters are always included to ensure a valid password.
Examples
Basic Password (lowercase only)
bash
$ passgen
Enter password length (1-30): 12
Include symbols? [n/Y]: n
Include numbers? [n/Y]: n  
Include uppercase letters? [n/Y]: n

Generated Password: randomletters
Strong Password (all options)
bash
$ passgen
Enter password length (1-30): 20
Include symbols? [n/Y]: y
Include numbers? [n/Y]: y
Include uppercase letters? [n/Y]: y

Generated Password: X7#kL9@mN2$pQ5!wR8&t
Quick Setup (press Enter for defaults)
bash
$ passgen
Enter password length (1-30): 16
Include symbols? [n/Y]: ↵
Include numbers? [n/Y]: ↵
Include uppercase letters? [n/Y]: ↵

Generated Password: abcdefghijklmnop
🛠️ Manual Installation
If you prefer to install manually:
Download the script:
bash
curl -o passgen.py https://raw.githubusercontent.com/yourusername/password-generator/main/passgen.py
Make it executable:
bash
chmod +x passgen.py
Move to PATH:
bash
# System-wide (requires sudo)
sudo mv passgen.py /usr/local/bin/passgen

# User-only
mkdir -p ~/.local/bin
mv passgen.py ~/.local/bin/passgen
export PATH="$HOME/.local/bin:$PATH"  # Add to ~/.bashrc or ~/.zshrc
Development
Running from Source
bash
git clone https://github.com/yourusername/password-generator.git
cd password-generator
python3 passgen.py
Requirements
Python 3.6 or higher
No external dependencies
Testing the Installer
bash
# Test installer locally
bash install.sh
Security Notes
Uses Python's random.choice() with string module for character selection
Includes a wide variety of symbols for maximum entropy
Lowercase letters are always included to ensure password validity
No passwords are stored or logged anywhere
Contributing
Contributions are welcome! Here are some ways you can help:
Bug Reports - Open an issue if you find a bug
Feature Requests - Suggest new features or improvements
Pull Requests - Submit code improvements
Documentation - Help improve the README or add examples
Development Setup
bash
git clone https://github.com/yourusername/password-generator.git
cd password-generator
# Make changes
python3 passgen.py  # Test your changes
License
This project is licensed under the MIT License - see the LICENSE file for details.
Troubleshooting
Command not found: passgen
Solution 1: Restart your terminal
Solution 2: Check if it's in your PATH: echo $PATH
Solution 3: Run directly: ~/.local/bin/passgen or /usr/local/bin/passgen
Python not found
Mac: Install with brew install python3 or download from python.org
Linux: Install with your package manager: sudo apt install python3 (Ubuntu) or sudo yum install python3 (CentOS)
Permission denied
Make sure the script is executable: chmod +x /usr/local/bin/passgen
For system-wide install, you might need sudo: sudo chmod +x /usr/local/bin/passgen
Installation fails
Check your internet connection
Verify the GitHub URL is accessible: https://github.com/yourusername/password-generator
Try manual installation instead
Support
If you find this tool useful, please consider:
Starring this repository
Reporting bugs or issues
Suggesting new features
Contributing to the code
Made with for secure password generation
Replace yourusername with your actual GitHub username before publishing.
