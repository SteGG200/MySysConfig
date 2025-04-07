$PWSH_SOURCE = "$pwd\powershell\profile.ps1"
$PWSH_DESTINATION = $PROFILE
$TEMP = (Get-Item $PROFILE)
$PWSH_BACKUP = "$($TEMP.Directory)\$($TEMP.BaseName).bak"

if(Test-Path -Path $PWSH_DESTINATION -PathType Leaf){
	echo "Creating backup directory for powershell profile..."
	Move-Item -Path $PWSH_DESTINATION -Destination $PWSH_BACKUP
}

New-Item -Path $PWSH_DESTINATION -ItemType SymbolicLink -Value $PWSH_SOURCE
