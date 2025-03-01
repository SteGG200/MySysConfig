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

For Windows User, check if you had `cl.exe` or `clang-cl.exe` before. If not, please install one of them by install `MinGW` or `LLVM`.
