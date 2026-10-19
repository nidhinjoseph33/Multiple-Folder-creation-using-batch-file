# Folder Creation Tool

A simple Windows automation tool for creating folders in bulk, helping reduce repetitive manual work and keep files organised.

## About

This project automates folder creation using scripts on Windows. Instead of creating folders one by one, you can use a script to create the required directory structure in a specified location.

## Features

- Create multiple folders automatically.
- Set a target directory for folder creation.
- Reduce repetitive manual work.
- Use Windows batch files and PowerShell for automation.
- Simplify directory organisation for projects and daily tasks.

## Requirements

- Windows 10 or Windows 11
- Windows PowerShell
- Write permission for the target directory

## Usage

1. Download or clone this repository.
2. Open the project folder.
3. Configure the target directory in the script.
4. Run the `.bat` file.
5. Check the target directory to verify that the folders were created.

## Configuration

Update the target path in the script to match your system.

```bat
set "TARGET=C:\Users\USER\Desktop\coinonia"
```

Replace the example path with your preferred destination.

## Error Handling

If the folders are not created:

- Check whether the target directory exists.
- Verify that you have permission to write to it.
- Confirm that PowerShell is available.
- Review the script output or error log, if configured.

## Purpose

This project is part of my hands-on work with Windows scripting and automation. The goal is simple: spend less time on repetitive tasks and more time on the work that matters.

## Author

**Nidhin Joseph**

GitHub: [@nidhinjoseph33](https://github.com/nidhinjoseph33)

---

*Built to make everyday tasks a little easier.*
