# Project Guidelines — System Configuration (Dotfiles)

Personal dotfiles repository targeting **Arch Linux** (primary) and **Windows**. Configs are symlinked into `~/.config/` (Linux) or `$env:LOCALAPPDATA` / `$PROFILE` (Windows) by the installer scripts.

## Architecture

```
├── scripts/
│   ├── arch/          # Bash installer: install.sh → utils.sh, packages.conf, aur_packages.conf, configurations.conf
│   └── windows/       # PowerShell installer: install.ps1 → utils.ps1, packages.ps1
├── nvim/              # Neovim config (Lua, lazy.nvim plugin manager)
│   ├── init.lua       # Entry point → lua/config/init.lua
│   ├── lua/config/    # autocmds, keymaps, options, lazy (plugin bootstrap)
│   └── lua/plugins/   # One file per plugin (lazy.nvim spec format)
├── hypr/              # Hyprland WM (modular: hyprland.conf sources sub-configs)
├── fish/              # Fish shell (Linux)
├── powershell/        # PowerShell profile (Windows)
├── kitty/             # Kitty terminal
├── yazi/              # Yazi file manager + plugins (Lua + TOML)
├── lf/                # lf file manager
├── rofi/              # Rofi launcher
├── fcitx5/            # Input method (Vietnamese via Unikey)
├── hyprpanel/         # HyprPanel bar (JSON + SCSS)
└── wallpapers/        # Wallpaper images
```

- Configs listed in `scripts/arch/configurations.conf` → `DOT_CONFIGS` array are symlinked to `~/.config/<name>`.
- On Windows, only `nvim` and `powershell/profile.ps1` are linked. Scoop is the package manager.
- The Neovim config is **cross-platform** (shared between Linux and Windows).

## Code Style

- **Lua (Neovim):** Tabs for indentation (`tabstop=2`, `shiftwidth=2`, `expandtab=false`). Use `vim.api.*` and `vim.keymap.set` idioms. Plugin specs return a table from each file in `lua/plugins/`. Reference `nvim/lua/config/options.lua` for style.
- **Bash (scripts/arch/):** Use `set -e`, `source` for imports, arrays for package lists. Functions use snake_case. See `scripts/arch/utils.sh`.
- **PowerShell (scripts/windows/):** Functions use snake_case (non-standard PS). Package arrays use `@()`. See `scripts/windows/utils.ps1`.
- **Hyprland conf:** Modular `source = ./sub.conf` pattern. One concern per file (monitor, binds, appearance, etc.).
- **TOML (yazi):** Cross-platform openers use `for = "unix"` / `for = "windows"` discriminators.

## Theme & Visual Identity

- **Catppuccin Mocha** is the universal theme across Neovim, Kitty, Hyprland, and GTK.
- Hyprland theme files live in `hypr/themes/`. Kitty colors are inline in `kitty/kitty.conf` (bottom section).
- Font: **JetBrainsMono Nerd Font** everywhere.

## Neovim Plugin Conventions

- Plugin manager: **lazy.nvim** — specs live in `nvim/lua/plugins/<name>.lua`, each returns a Lua table.
- LSP: `mason` + `mason-lspconfig` + `nvim-lspconfig`. Servers configured inline in `lsp-config.lua` with `vim.lsp.enable()` / `vim.lsp.config[]`.
- Completion: `cmp_nvim_lsp` capabilities are injected into every LSP config.
- Leader key: `<Space>`. Keymaps use `desc` for which-key integration.
- Bufferline for tab-like buffer navigation (`<M-h>`, `<M-l>`, `<M-1>`–`<M-0>`).
- Adding a new plugin: create `nvim/lua/plugins/<plugin-name>.lua` returning the lazy.nvim spec table.

## Installer Scripts

### Arch Linux
```bash
# Full install (packages + symlinks)
./scripts/arch/install.sh
```
- Packages: `scripts/arch/packages.conf` (pacman) + `scripts/arch/aur_packages.conf` (yay AUR).
- Configs to link: `scripts/arch/configurations.conf` → `DOT_CONFIGS` array.
- Adding a new tool: add package to the appropriate array in `packages.conf` or `aur_packages.conf`, add config dir name to `DOT_CONFIGS` in `configurations.conf`.

### Windows
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned   # one-time, admin
./scripts/windows/install.ps1
```
- Packages: `scripts/windows/packages.ps1` (Scoop buckets + packages).
- Adding a new tool: add to the appropriate `$ARRAY` in `packages.ps1`.

## Project Conventions

- **Symlink pattern:** Installer backs up existing config to `<name>_backup` before linking. The `link_config` function in both `utils.sh` and `utils.ps1` handles this — never copy files manually.
- **No hardcoded paths in configs:** Configs assume standard XDG locations (`~/.config/`) on Linux. On Windows, `$env:LOCALAPPDATA` for Neovim.
- **Cross-platform awareness in yazi:** Openers in `yazi/yazi.toml` specify `for = "unix"` or `for = "windows"`.
- **Hyprland modularity:** Never put settings directly in `hyprland.conf` — use the appropriate sourced sub-config file.
- Cached installer selections stored at `~/.cache/MySysConfig/selections.conf`.

## Security

- The Windows installer runs **gsudo** for symlink creation and invokes Chris Titus winutil (`irm christitus.com/win | iex`) — be aware of this external execution.
- `Set-ExecutionPolicy RemoteSigned` is required on Windows before running the installer.
