# PowerShell file transfer and backup

Both scripts run on Windows and use Robocopy. Edit `$source` and `$dest` in the script for your machine before running it. The paths must be accessible from the PowerShell session.

| Script | Behavior |
| --- | --- |
| [robocopy_transfer.ps1](robocopy_transfer.ps1) | Copies a folder tree, including empty subdirectories, using restartable mode. Destination-only files remain in place. |
| [backup_music.ps1](backup_music.ps1) | Mirrors the source music folder to a backup drive. Files and folders found only at the destination are deleted. |

Review the source and destination paths before running either script. To preview changes, add `/L` to the Robocopy command in the script. Check the planned deletions before removing `/L` from the mirror command.

From the repository root in PowerShell, run the script you configured:

```powershell
.\Powershell\robocopy_transfer.ps1
.\Powershell\backup_music.ps1
```

Robocopy exit codes from 0 through 7 describe outcomes such as copied files, extra files, or mismatches. A code of 8 or higher indicates a copy failure.
