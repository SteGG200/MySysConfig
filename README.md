# My System Configuration

This is my configuration about system and other related tools.

My conguration is available for:
- Windows
- Arch Linux

## Windows

Before installing, execute the following command with administration privileges.

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

And run installer script:

```powershell
./scripts/windows/install.ps1
```

## Arch Linux

Installer script:

```bash
./scripts/arch/install.sh
```

To set `fish` as default shell
```bash
chsh -s $(which fish)
```

To use Vietnamese input method on GNOME, install ibus-bamboo by following [this guide](https://software.opensuse.org//download.html?project=home%3Alamlng&package=ibus-bamboo)

## Other instructions

[All custom shortcuts in neovim](./nvim/shortcuts.md)

[All custom shortcuts in lf](./lf/shortcuts.md)
