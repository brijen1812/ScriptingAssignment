backupFolder="D:\Backup"
daysToKeep=7
currDate=$(date +%F)

Get-ChildItem $backupFolder -Recurse | Where-Object { $_.Extension -eq ".bak" -and ( $currDate - $_.LastWriteTime ).Days -gt $daysToKeep } | Remove-Item -Force

