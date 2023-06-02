# Using command powershell -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -File [directory]/profile.ps1
# function prompt {
# 	$p = Split-Path -leaf -path (Get-Location)
# 	$user = $env:UserName
# 	$host.UI.RawUI.WindowTitle = "\" + $p + ">"
# 	$host.UI.RawUI.ForegroundColor = "Blue"

# 	if (Test-Path .git) {
# 		$p = Split-Path -leaf -path (Get-Location)
# 		git branch | ForEach-Object {
# 			if ($_ -match "^\*(.*)") {
# 				$branch = $matches[1] + " - "
# 				Write-Host -NoNewLine $user -ForegroundColor Magenta
# 				Write-Host -NoNewLine "@\"
# 				Write-Host -NoNewLine $p -ForegroundColor Yellow
# 				Write-Host -NoNewLine " - " -ForegroundColor DarkGreen
# 				Write-Host -NoNewLine $branch -ForegroundColor DarkGreen
# 			}
# 		}
# 	}
# 	else {
# 		Write-Host -NoNewLine $user -ForegroundColor Magenta
# 		Write-Host -NoNewLine "@\"
# 		Write-Host -NoNewLine $p -ForegroundColor Yellow
# 		Write-Host -NoNewLine " PS" -ForegroundColor Magenta
# 	}
# 	'> ' # !! Output to the success output stream to prevent default prompt.
# }

function prompt(){
	$curDir = $pwd.ProviderPath
	$leaf = Split-Path -leaf -path (Get-Location)
	$user = $env:UserName
	
	#set up title
	$host.UI.RawUI.WindowTitle = ".\" + $leaf
	$host.UI.RawUI.ForegroundColor = "White"

	Write-Host -NoNewLine $user -ForegroundColor Magenta
	Write-Host -NoNewLine "@\" 
	Write-Host -NoNewLine $curDir -ForegroundColor Yellow

	if(Test-Path .git){
		git branch | ForEach-Object{
			if($_ -match "^\*(.*)"){
				$branch = $matches[1] + " - "
				Write-Host -NoNewLine " - " -ForegroundColor DarkGreen
				Write-Host -NoNewLine $branch -ForegroundColor DarkGreen
			}
		}
	}else{
		Write-Host -NoNewLine " - PS -" -ForegroundColor Blue
	}
	'>'
}

Set-PSReadLineOption -Colors @{
	Number = '#9EFD8F'
	String = '#FE8E6B'
	Variable = '#5CF8FF'
	Comment = '#19B600'
}