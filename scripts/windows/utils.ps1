function is_installed {
	param(
		[string]$pkg
	)
	$InformationPreference = 'Ignore'
	$list = $(scoop list $pkg)
	$InformationPreference = 'Continue'
	return $list.Length -ne 0
}

function add_buckets {
	param(
		[String[]] $buckets
	)

	foreach($bucket in $buckets) {
		scoop bucket add $bucket
	}
}

function install_packages {
	param(
		[String[]] $pkgs
	)

	$to_install = @()

	foreach($pkg in $pkgs) {
		if (! (is_installed $pkg)){
			$to_install += $pkg
		}
	}
	
	if ($to_install -ne 0) {
		Write-Host "Installing: $to_install"
		scoop install "$to_install"
	}
}

function link_config {
	param(
		[String] $source,
		[String] $destination,
		[String] $backup
	)

	if ((Test-Path -Path $destination) -and ((Get-Item $destination).LinkType -eq $null)) {
		Write-Host "Creating backup for $destination..."
		Move-Item -Path $destination -Destination $backup
	}

	if (!(Test-Path -Path $destination)) {
		gsudo New-Item -Path $destination -ItemType SymbolicLink -Value $source
	}
}
