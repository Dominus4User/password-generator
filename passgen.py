#!/usr/bin/env python3
"""
Password Generator - Interactive password creation tool
Author: dominusUser
GitHub: https://github.com/yourusername/password-generator
"""

import random
import string
import sys

def get_yes_no_input(prompt):
    """Get yes/no input from user, default to 'y' if just Enter is pressed"""
    while True:
        response = input(prompt).strip().lower()
        if response == 'n':
            return False
        elif response == 'y' or response == '':
            return True
        else:
            print("Please enter 'y' for yes or 'n' for no (or just press Enter for YES)")

def get_length_input():
    """Get password length from user with validation"""
    while True:
        try:
            length = input("Enter password length (1-30): ").strip()
            if length == '':
                print("Please enter a number between 1 and 30")
                continue
            length = int(length)
            if 1 <= length <= 30:
                return length
            else:
                print("Password length must be between 1 and 30 characters")
        except ValueError:
            print("Please enter a valid number")

def generate_password(length, use_symbols, use_numbers, use_uppercase):
    """Generate password based on user preferences"""
    # Start with lowercase letters (always included)
    characters = string.ascii_lowercase
    
    # Add character sets based on user choices
    if use_uppercase:
        characters += string.ascii_uppercase
    if use_numbers:
        characters += string.digits
    if use_symbols:
        characters += "!@#$%^&*()-_+=[]{}|;:,.<>?"
    
    # Generate password
    password = ''.join(random.choice(characters) for _ in range(length))
    return password

def main():
    print("=== Password Generator ===")
    print()
    
    # Get user preferences
    length = get_length_input()
    use_symbols = get_yes_no_input("Include symbols? [n/Y]: ")
    use_numbers = get_yes_no_input("Include numbers? [n/Y]: ")
    use_uppercase = get_yes_no_input("Include uppercase letters? [n/Y]: ")
    
    # Generate and display password
    password = generate_password(length, use_symbols, use_numbers, use_uppercase)
    
    print()
    print("Generated Password:")
    print("=" * 20)
    print(password)
    print("=" * 20)
    print()
    
    # Show what character types were included
    included = ["lowercase letters"]
    if use_uppercase:
        included.append("uppercase letters")
    if use_numbers:
        included.append("numbers")
    if use_symbols:
        included.append("symbols")
    
    print(f"Length: {length} characters")
    print(f"Includes: {', '.join(included)}")

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\nPassword generation cancelled.")
        sys.exit(0)
    except Exception as e:
        print(f"\nAn error occurred: {e}")
        sys.exit(1)