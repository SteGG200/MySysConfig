# Preferences: All keyboard shortcuts of lf

## Navigation

| Keybinding | Command |
| ---------- | ------- |
| `k/Up` | Move up in the list |
| `j/Down` | Move down in the list |
| `Ctrl+u/Ctrl+d` | Move up and down half a page at a time |
| `Ctrl+b/Ctrl+f` | Move up and down a full page at a time |
| `gg/Shift+g` | Move to the beginning and end of the list |
| `h/Left` | Move to parent directory |
| `l/Right/Enter` | Open the folder or file under cursor |
| `gd` | Go to `~/Documents/` |
| `gD` | Go to `~/Downloads/` |
| `gp` | Go to `~/Pictures/` |
| `gv` | Go to `~/Videos/` |
| `gt` | Go to `Trash` folder |
| `gm` | Go to removable devices list folder |

## Enter visual mode

| Keybinding | Command |
| ---------- | ------- |
| `Space` | Toggle selection in the current directory |
| `v` | Enter visual mode to select files or folders |
| `v(Visual Mode)` | Confirm selected files or folders and escape Visual Mode |
| `V` | Invert selections in current directory |
| `u` | Unmark all selections in current directory |

## Operations

| Keybinding | Command |
| ---------- | ------- |
| `a` | Add a new file to current directory |
| `A` | Add a new folder to current directory |
| `r` | Rename the file or folder under cursor |
| `y` | Copy the file or folder under cursor or all selections |
| `xx` | Cut the file or folder under cursor or all selections |
| `p` | Paste the copied or cut files or folders to the current directory |
| `dd/Delete` | Move the file or folder under cursor or all selections to Trash |
| `dr` | Restore files or folders from Trash |
| `de` | Empty the Trash |
| `xt` | Extract the file under cursor |
| `X` | Execute the file under cursor |
| `R` | Reload lf |

## Command

| Keybinding | Command |
| ---------- | ------- |
| `:` | Read a builtin or custom command |
| `$` | Run a command in the shell |
| `%` | Run a command in the shell while piping the input from the ui and output to the ui |
| `!` | Run a command in the shell and wait for a key press |
| `&` | Run a command in the background |

## Searching

| Keybinding | Command |
| ---------- | ------- |
| `/` | Read a pattern to search |
| `n/N` | Jump to next and previous file or folder matching pattern |
| `?` | Read a pattern to search but invert jump operation |

## Other

| Keybinding | Command |
| ---------- | ------- |
| `z` | Toggle options or change their values |
| `zh` | Toggle display hidden files and folders |
| `s` | Change the value of `sortby` and `info` options |
| `e` | Launch an editor |
| `i` | Launch a pager |
| `w` | Launch a shell |
| `ot` | Open Kitty terminal in current directory |
| `on` | Open Neovim in current directory |
| `oc` | Open VSCode in current directory |
