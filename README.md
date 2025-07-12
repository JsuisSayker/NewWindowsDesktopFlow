# Virtual Desktop Mover
This AutoHotkey script allows you to quickly switch between virtual desktops and move windows between them using keyboard shortcuts.
It is designed to enhance your workflow by providing easy access to virtual desktops on Windows.

In the future, it may also provide a GUI to customize the shortcuts, as well as the creation of new virtual desktops.

# Table of Contents
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)

## Features
- Switch to virtual desktops 1-9 using `Ctrl + Alt + 1` to `Ctrl + Alt + 9`
- Move the active window to virtual desktops 1-9 using `Alt + Shift + 1` to `Alt + Shift + 9`

## Requirements
- [AutoHotkey v2.0 or higher](https://www.autohotkey.com/)
- VirtualDesktopAccessor.dll (included in the project)

## Installation
1. Download and install AutoHotkey v2.0 or higher from [https://www.autohotkey.com/](https://www.autohotkey.com/).
2. Clone this repository.
    ```bash
    git clone git@github.com:JsuisSayker/NewWindowsDesktopFlow.git
    ```
3. Run the `launch.bat` file to compile the script and add it to your startup folder (or double-click on it).

## Usage
- Use the specified keyboard shortcuts to switch between or move windows to different virtual desktops.
- You can customize the script by editing the `script.ahk` file.
- The script will automatically start with Windows if you run the `launch.bat` file.