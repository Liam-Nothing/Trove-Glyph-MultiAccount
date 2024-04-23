# Trove Multi-Account Management Script

This README provides instructions on how to use the provided AutoHotkey script for managing multiple Trove game accounts simultaneously. The script automates the login process and provides hotkeys for controlling each game instance.

## Requirements

- **AutoHotkey**: Ensure AutoHotkey is installed on your system.
- **Trove and Glyph**: Installed and properly configured.

## Configuration

First, replace the placeholders in the `users` array with your actual account details. Each account must have:
- `email`: Your account email.
- `password`: Your account password.
- `x`, `y`: The desired screen coordinates for the game window.

```
users := [
    {email: "your@email.com", password: "yourpassword", x: -5, y: -5},
    {email: "your@email.com", password: "yourpassword", x: 295, y: -5},
    {email: "your@email.com", password: "yourpassword", x: -5, y: 230},
    {email: "your@email.com", password: "yourpassword", x: 295, y: 230},
    {email: "your@email.com", password: "yourpassword", x: -5, y: 460},
    {email: "your@email.com", password: "yourpassword", x: 295, y: 460},
]
```

## Script Functions

### Main Features

- **ProcessUser**: Handles the login procedure for each user.
- **Tooltip Feedback**: Provides real-time status updates via tooltips.

### Hotkeys

- **^Numpad1**: Open inventory for all accounts.
- **^Numpad2**: Click a specific UI element in all accounts.
- **^Numpad3 to ^Numpad5**: Send specific keystrokes to all accounts.
- **^Numpad7 to ^Numpad9**: Custom actions like restarting a game or collecting loot.

## Usage

1. Start the script with AutoHotkey.
2. Ensure the Glyph client is open but not logged in.
3. The script will automate the login for each account and position the windows according to the coordinates specified.

## Note

- The script is meant for personal use and managing your own accounts. Ensure compliance with Trove's terms of service.
- Modify the script according to your screen resolution and account needs.

## Debugging

Uncomment the debug lines within the script to receive more detailed tooltip information during execution.
