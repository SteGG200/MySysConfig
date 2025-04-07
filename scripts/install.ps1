function sudo {
	param(
		[string]$Script
	)

	Start-Process -Verb RunAs powershell.exe -Args "-executionpolicy bypass -command Set-Location \`"$PWD\`"; $Script"
}

# Powershell
sudo ".\scripts\powershell\enable.ps1"

# Neovim
sudo ".\scripts\nvim\enable.ps1"
