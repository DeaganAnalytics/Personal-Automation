$source = "Y:\media\music"
$dest   = "D:\Backups\Music"

robocopy $source $dest /MIR /COPY:DAT /DCOPY:DAT /R:2 /W:2 /MT:16
