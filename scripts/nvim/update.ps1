$Source = ".\nvim\"
$Destination = "$($env:LOCALAPPDATA)\nvim\"

if (Test-Path -Path $Destination){
	$children = Get-ChildItem -Path $Destination -Force
	$children | Foreach-Object {
		Remove-item -Confirm -Force $_.FullName
	}
}else {
	mkdir $Destination
}

Copy-Item -Path $Source\* -Destination $Destination -Recurse -Force
