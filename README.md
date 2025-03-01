# My Configuration
This is my configuration of terminal and tools

## Table of Contents
- [Note before starting](#note-before-starting)
- [Fish Shell](#fish-shell)
- [Powershell](#powershell)
- [Neovim](#neovim)

## Note before starting

You have to make sure that destination directory was created before running update scripts

For Windows Powershell users, run the following command in powershell with administration privileges to ensure that you can run .ps1 files
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

## Fish Shell

Destination directory: `~/.config/fish/functions/`

Configuration structure:
```yaml
fish:
  - fish_prompt # config main fish prompt
  - fish_prompt_right # config right fish prompt
```
Update script:
```bash
fish ./scripts/fish/update.fish
```

## Powershell

Destination directory: `$PROFILE`

File configuration: `./powershell/profile.ps1`

Update script:
```powershell
.\scripts\powershell\update.ps1
```

## Neovim

**Requirement**:
- Neovim 0.10 or later
- tar and curl in your path (or alternatively git >= **2.19.0**)
- A C compiler in your path and libstdc++ installed (for treesitter package) ([Windows users please read this!](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support))
- A patched font (see [Nerd fonts](https://github.com/ryanoasis/nerd-fonts))
- GNU tar
- ripgrep
- For Unix systems:
	- curl or wget
	- unzip
	- gzip
- For Windows systems:
	- pwsh or powershell
	- One of the following:
		- 7zip
		- peazip
		- archiver
		- winzip
		- WinRAR

Destination directory:

- Windows Powershell: `$env:LOCALAPPDATA\nvim\`
- Other OS: `~/.config/nvim/`

Folder structure:
```yaml
nvim:
  lua:
    - plugins/ # Containing all plugins
    - vim-options.lua # Configuration for all neovim options
  - init.lua # Init file for neovim
  - lazy-lock.json
```

Update script:

- Windows Powershell:
```powershell
.\scripts\nvim\update.ps1
```
- Linux:
```bash
bash ./scripts/nvim/update.bash
```

Make sure you added mason bin inside `nvim-data` directory to `PATH`

There are several language servers that you should install manually instead of using mason:
- clangd

