$Source = ".\nvim\"
$Destination = "$($env:LOCALAPPDATA)\nvim\"
# 
# Remove-item -LiteralPath $Destination -Recurse -Force
# # Copy-Item -Path $Source -Destination $Destination -Recurse -Force
# Get-Chilren 
Copy-Item -Path $Source\* -Destination $Destination -Recurse -Force
