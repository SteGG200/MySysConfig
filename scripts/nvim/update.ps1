$Source = ".\nvim\"
$Destination = "$($env:LOCALAPPDATA)\nvim\"

Copy-Item -Path $Source\* -Destination $Destination -Recurse -Force
