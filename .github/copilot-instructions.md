# Project Guidelines

## Code Style
- **Lua (Neovim):** use tabs (`tabstop=2`, `shiftwidth=2`, `expandtab=false`) and `vim.api`/`vim.keymap.set` patterns; follow `nvim/lua/config/options.lua` and `nvim/lua/config/keymaps.lua`.
- Plugin specs live in `nvim/lua/plugins/*.lua` and each file returns a Lua table (lazy.nvim format).
- **Bash:** `set -e`, `source` imports, snake_case functions, arrays for package groups; mirror `scripts/arch/install.sh` and `scripts/arch/utils.sh`.
- **PowerShell:** snake_case functions, array-style package declarations (`@()`), and helper reuse from `scripts/windows/utils.ps1`.
- **Hyprland:** keep root config modular via `source = ...`; do not inline unrelated settings into `hypr/hyprland.conf`.
- **Yazi TOML:** preserve platform-specific openers using `for = "unix"` / `for = "windows"` in `yazi/yazi.toml`.

## Architecture
- Repo is split by platform installer flows:
  - Linux: `scripts/arch/install.sh` → `utils.sh`, `packages.conf`, `configurations.conf`.
  - Windows: `scripts/windows/install.ps1` → `utils.ps1`, `packages.ps1`.
- Dotfiles are symlinked into user config dirs (not copied):
  - Linux target: `~/.config/<name>` from `DOT_CONFIGS` in `scripts/arch/configurations.conf`.
  - Windows targets: `$env:LOCALAPPDATA\nvim` and `$PROFILE`.
- Neovim config is shared cross-platform (`nvim/init.lua` → `nvim/lua/config/init.lua`).

## Build and Test
- Linux install: `./scripts/arch/install.sh`
- Windows install: `./scripts/windows/install.ps1` (requires `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned` beforehand).
- Neovim plugin state is pinned in `nvim/lazy-lock.json`; plugin updates should keep lockfile in sync.
- No dedicated automated test suite is defined in this repo; validate changes by running the relevant installer/script path.

## Project Conventions
- Use `link_config` (`scripts/arch/utils.sh`, `scripts/windows/utils.ps1`) for linking; it backs up existing non-symlink paths to `*_backup`.
- For new Linux-managed configs, add directory names to `DOT_CONFIGS` in `scripts/arch/configurations.conf`.
- Keep Catppuccin Mocha consistency across tools (`hypr/themes/catppuccin_mocha.conf`, Neovim theme-related plugin config, and Kitty colors in `kitty/kitty.conf`).
- In Neovim, leader key is `<Space>` and mappings should include `desc` for discoverability.

## Integration Points
- Linux package managers: `pacman` + `yay`; Windows package manager: `scoop`.
- Neovim stack: `lazy.nvim`, `mason`, `mason-lspconfig`, `nvim-lspconfig`, `cmp_nvim_lsp` capabilities injection (see `nvim/lua/plugins/lsp-config.lua`).
- External runtime tools invoked by installers include `tailscaled` (systemd enable), `gsudo`, and Chris Titus winutil.

## Security
- Windows installer executes remote script content via `irm "https://christitus.com/win" | iex` under `gsudo`; treat as high-trust external execution.
- Symlink creation on Windows is elevated (`gsudo New-Item ... SymbolicLink`), so path changes must be reviewed carefully.
- Avoid introducing hardcoded machine-specific paths; preserve XDG and environment-variable-based targets.

