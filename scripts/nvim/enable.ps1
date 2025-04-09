$NVIM_SOURCE = "$pwd\nvim"
$NVIM_DESTINATION = "$($env:LOCALAPPDATA)\nvim"
$NVIM_BACKUP = "$($env:LOCALAPPDATA)\nvim_backup"

if ( (Test-Path -Path $NVIM_DESTINATION) -and ((Get-Item $NVIM_DESTINATION).LinkType -eq $null) ){
	echo "Creating backup directory for nvim..."
	Move-Item -Path $NVIM_DESTINATION -Destination $NVIM_BACKUP
}

New-Item -Path $NVIM_DESTINATION -ItemType SymbolicLink -Value $NVIM_SOURCE
