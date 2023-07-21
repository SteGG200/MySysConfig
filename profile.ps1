# Using command copy profile.ps1 $PROFILE

function prompt(){
	$leaf = Split-Path -leaf -path (Get-Location)
	$user = $env:UserName
	
	#set up title
	$host.UI.RawUI.WindowTitle = $leaf
	$host.UI.RawUI.ForegroundColor = "White"


	$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity
    $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

	if ($principal.IsInRole($adminRole)) {
		Write-Host -NoNewLine $user -ForegroundColor Red
	}else{
		Write-Host -NoNewLine $user -ForegroundColor Magenta
	}
	
	Write-Host -NoNewLine "@\" 
	Write-Host -NoNewLine $leaf -ForegroundColor Yellow

	if(git rev-parse --git-dir){
		$size = 0
		git branch | ForEach-Object{
			if($_ -match "^\*(.*)"){
				$size = $size + 1
				$branch = $matches[1] + " - "
				Write-Host -NoNewLine " - " -ForegroundColor DarkGreen
				Write-Host -NoNewLine $branch -ForegroundColor DarkGreen
			}
		}
		if($size -eq 0){
			Write-Host -NoNewLine " - unknow branch - " -ForegroundColor DarkGreen
		}
	}else{
		Write-Host -NoNewLine " - PS -" -ForegroundColor Blue
	}
	'> '
}

Set-PSReadLineOption -Colors @{
	Number = '#9EFD8F'
	String = '#FE8E6B'
	Variable = '#5CF8FF'
	Comment = '#19B600'

}

function get{
	Param($file)
	cat $file | clip
}