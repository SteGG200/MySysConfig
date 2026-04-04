# Dotfiles & System Setup

Cross-platform dotfiles and bootstrap scripts for **Arch Linux** and **Windows**.

This repository manages editor, terminal, shell, and desktop configuration with a symlink-first workflow.

## Supported Platforms

- Arch Linux
- Windows

## What This Repo Includes

- Shared Neovim configuration (`nvim/`)
- Linux installer flow (`scripts/arch/`)
- Windows installer flow (`scripts/windows/`)
- Desktop/app configs (Hyprland, Kitty, Yazi, etc.)

## Installation

### Arch Linux

Run:

```bash
./scripts/arch/install.sh
```

What it does (high-level):

- Installs packages via `pacman` and `yay`
- Symlinks managed configs into `~/.config`
- Enables required services (for example `tailscaled`)

Optional post-install:

```bash
chsh -s $(which fish)
```

### Windows

Before running the installer, allow script execution in an elevated PowerShell:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

Then run:

```powershell
./scripts/windows/install.ps1
```

What it does (high-level):

- Installs packages via `scoop`
- Symlinks configs to targets such as `$env:LOCALAPPDATA\nvim` and `$PROFILE`
- Uses elevated linking where required

## Repo Structure

- `nvim/` – shared Neovim config (Lazy, Mason, LSP, keymaps, options)
- `scripts/arch/` – Linux install utilities, package/config manifests
- `scripts/windows/` – Windows install utilities and package definitions
- `hypr/`, `kitty/`, `yazi/`, etc. – app-specific dotfiles

## Neovim Notes

- Leader key is `<Space>`
- Keymaps should include `desc`
- Plugin versions are pinned in `nvim/lazy-lock.json`

Useful references:

- [Neovim shortcuts](./nvim/shortcuts.md)

## Conventions

- Symlink, do not copy, managed configs
- Linux managed config list is defined in `scripts/arch/configurations.conf` (`DOT_CONFIGS`)
- Keep Catppuccin Mocha theme consistency across tools
- Prefer environment/XDG paths over machine-specific hardcoded paths

## Security Notes

- Windows installer executes external remote script content (`irm ... | iex`) via elevation
- Review path and linking changes carefully before running installers

## Validation

There is no dedicated automated test suite in this repo.
Validate changes by running the relevant installer path for your platform.

