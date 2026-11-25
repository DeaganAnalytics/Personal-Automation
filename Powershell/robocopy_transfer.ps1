# Copy files and directories using Robocopy

# Define source and destination directories
$source = "C:\Path\To\Source"
$dest   = "D:\Path\To\Destination"

# Execute file transfer
robocopy $source $dest /E /COPY:DAT /DCOPY:DAT /R:2 /W:2 /MT:16 /Z

# Parameter descriptions:
# /E         Copy all subdirectories, including empty ones
# /COPY:DAT  Preserve file data, attributes and timestamps
# /DCOPY:DAT Preserve directory data, attributes and timestamps
# /R:2       Retry failed copies twice
# /W:2       Wait 2 seconds between retries
# /MT:16     Use 16 threads for multithreaded copying
# /Z         Enable restartable mode for interrupted transfers
