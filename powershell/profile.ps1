# Using command copy profile.ps1 $PROFILE

function prompt(){
	if((Get-Location).Path -eq $env:USERPROFILE){
		$leaf = "~"
	}else{
		$leaf = Split-Path -leaf -path (Get-Location)
	}
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
	
	Write-Host -NoNewLine "@"
	Write-Host -NoNewLine "$(hostname) " -ForegroundColor Yellow
	Write-Host -NoNewLine $leaf -ForegroundColor Cyan

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
		Write-Host -NoNewLine " - PS - " -ForegroundColor Blue
	}
	Write-Output '> '

	$time = (Get-Date -Format "HH:mm")

	$message = $time

	$startposx = $Host.UI.RawUI.CursorPosition.X;
	$startposy = $Host.UI.RawUI.CursorPosition.Y;

	# Set right aligned text
	$rightx = $Host.UI.RawUI.windowsize.width - $message.length
	$righty = $Host.UI.RawUI.CursorPosition.Y
	$Host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates $rightx,$righty
	Write-Host -NoNewLine $message -ForegroundColor DarkGray
	
	$Host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates $startposx, $startposy
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

function clsd{ # Clean all children of a folder.
	Param($Path)
	$itemFolders = Get-ChildItem -Path $Path -Force
	$itemFolders | Foreach-Object {
		Remove-item -Force $_.FullName
	}
}

function GetChildrenSize{
	Param($Path)
	ls $Path -Force | ForEach-Object {
		echo "$($_.Name):"
		$Size = (ls $_.Name -Recurse -Force | Measure-Object -Property Length -Sum).Sum
		echo "   To GB: $($Size / 1GB) GB"
		echo "   To MB: $($Size / 1MB) MB"
	}
}