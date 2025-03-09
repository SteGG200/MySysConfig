$Source = ".\nvim\"
$Destination = "$($env:LOCALAPPDATA)\nvim\"

if (Test-Path -Path $Destination){
	$children = Get-ChildItem -Path $Path -Force
	$children | Foreach-Object {
		Remove-item -Force $_.FullName
	}
}else {
	mkdir $Destination
}

Copy-Item -Path $Source\* -Destination $Destination -Recurse -Force
