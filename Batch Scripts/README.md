# About
This folder is for Windows batch automation. Earlier experiments are kept in [archive/](archive/). The examples require Windows and the specified programs.

I started exploring batch files during one job where I had automated saving files into a document management system (M-Files), complete with metadata - some of which was dynamically generated, like dates - using R or Python depending on the use case. When I expanded this workflow to the accounting team, they weren’t allowed to use R or Python, so I looked into batch files as a workaround to run compiled `.exe` versions of the scripts and let them input parameters.

Archived examples:

| Script Name         | Description                                         | Purpose                                                                      |
|---------------------|-----------------------------------------------------|------------------------------------------------------------------------------|
| [open_programs.bat](archive/open_programs.bat) | Open a few programs while closing others            | Opens Outlook, Teams, and Edge; closes Lifesize                              |
| [close_programs.bat](archive/close_programs.bat) | Close common applications I have open               | Closes Outlook, Teams, Excel, Word, RStudio, PyCharm, Edge, etc.             |

Check the installation paths in `open_programs.bat` before running it. Both scripts use `taskkill /F` to force-close processes, which can discard unsaved work.

Nothing here is particularly clever or production-ready - just saved for reference from when I was messing around with batch automation.
