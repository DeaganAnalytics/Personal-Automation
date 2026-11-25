# Mirror files and directories using Robocopy

# Define source and destination directories
$source = "Y:\media\music"
$dest   = "D:\Backups\Music"

# Execute directory mirror
robocopy $source $dest /MIR /COPY:DAT /DCOPY:DAT /R:2 /W:2 /MT:16

# Parameter descriptions:
# /MIR       Mirror the source directory, including empty subdirectories
# /COPY:DAT  Preserve file data, attributes and timestamps
# /DCOPY:DAT Preserve directory data, attributes and timestamps
# /R:2       Retry failed copies twice
# /W:2       Wait 2 seconds between retries
# /MT:16     Use 16 threads for multithreaded copying

# WARNING:
# /MIR deletes files and directories from the destination
# that no longer exist in the source.
# Always verify source and destination paths before execution.
#
# Add /L to the Robocopy command to preview changes
# without copying or deleting any files.
