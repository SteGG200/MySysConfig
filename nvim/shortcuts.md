# Preferences: All keyboard shortcuts

**Note**: `Leader` key is currently set to `Space`

## Normal mode:

### Navigation: 

| Keybinding | Command |
| ---------- | ------- |
| `h/j/k/l` | Move cursor to the left/bottom/top/right |
| `gg` | Go to the top of file |
| `Shift+g` | Go to the bottom of file |
| `Ctrl+e` | Scroll up |
| `Ctrl+y` | Scroll down |

### Enter insert mode:

| Keybinding | Command |
| ---------- | ------- |
| `i` | Edit before block cursor |
| `a` | Edit after the block cursor |
| `Shitf+i` | Edit at the beginning of current line |
| `Shitf+a` | Edit at the end of current line |
| `s` | Replace selected text |
| `Shift+c` / `cc` | Replace all text in current line |
| `c(j/k)` | Replace all text in current line and the line after/before |

### Enter visual mode:

| Keybinding | Command |
| ---------- | ------- |
| `v` | Toggle visual mode |
| `Shift+v` | Toggle visual line (select current line) |
| `Ctrl+v/q` | Toggle visual block |
| `y` | Copy selected text |
| `"+y` | Copy selected text to clipboard |
| `x` | Cut selected text |
| `d` | Delete selected text |

### Enter Op-pending mode:
| Keybinding | Command |
| ---------- | ------- |
| `y` | Enter copy mode |
| `Shift+y` | Copy current line |
| `x` | Cut the character under cursor |
| `d` | Enter delete mode |
| `Shift+d` | Delete all text in current line |
| `p` | Paste copied text after block cursor |
| `Shift+p` | Paste copied text before block cursor |

### Enter Cmdline mode:
| Keybinding | Command |
| ---------- | ------- |
| `:` | Enter Cmdline mode |

### Navigate between panels:

| Keybinding | Command |
| ---------- | ------- |
| `Ctrl+h/j/k/l` | Move to left/down/top/right panel |

### Package manager:

| Keybinding | Command |
| ---------- | ------- |
| `Ctrl+x` | Open LazyVim package manager |
| `Ctrl+a` | Open Mason package manager |

### Search and Replace

| Keybinding | Command |
| ---------- | ------- |
| `/<text>` | Search `<text>` in current window |
| `*` | Search word under cursor in current window |
| `[range]s/<text>/<text-to-replace>/[flags]` | Replace all `<text>` to `<text-to-replace>` in current window
| `Ctrl+p` | Search a file |
| `Leader+fg` | Search a text in current directory |
| `Leader+nh` | Stop highlighting |

### Neotree:

| Keybinding | Command |
| ---------- | ------- |
| `Leader+e` | Open neotree with source is filesystem |
| `Leader+b` | Close neotree |

### Git:

| Keybinding | Command |
| ---------- | ------- |
| `Leader+g` | Open git status |
| `gph` | Show change diff |

### Coding Support:

| Keybinding | Command |
| ---------- | ------- |
| `Shift+k` | Show documentation of object under cursor |
| `gd` | Go to definition |
| `gr` | Show references |
| `Leader+i` | Formatting current file |
| `Leader+ca` | Open code action popup |
| `gcc` | Comment current line |
| `gc(k/j)` | Comment current line and the line before/after |
| `gx` | Access file / url under the cursor |

### Debugging:

| Keybinding | Command |
| ---------- | ------- |
| `F5` | Start or continue debugging |
| `F9` | Set breakpoint at current line |

## Insert mode:

### Coding suggestion:

| Keybinding | Command |
| ---------- | ------- |
| `Ctrl+space` | Show autocompletion menu |
| `Ctrl+n` | Go to next suggestion |
| `Ctrl+p` | Go to previous suggestion |
| `Ctrl+b` | Scroll up
| `Enter` | Choose the suggestion |
| `Ctrl+e` | Close autocompletion menu |

## Visual mode:

### Basic:

| Keybinding | Command |
| ---------- | ------- |
| `iw` | Select the word under the cursor |
| `ip` | Select all code block that the cursor is currently in |
| `s` | Replace selected text |
| `y` | Copy selected text |
| `x` | Cut selected text |
| `d` | Delete selected text |
| `u` | Set all selected characters to lowercase |
| `U` | Set all selected characters to uppercase |
| `v` | Toggle visual mode |

### Coding Support:

| Keybinding | Command |
| ---------- | ------- |
| `(Visual Block) Shift+i` | Edit multi-line where is selected by visual block (Escape to apply) |
| `gc` | Comment selected code |

## Terminal mode:

### Basic:

| Keybinding | Command |
| ---------- | ------- |
| `Ctrl+\ Ctrl+n` | Escape terminal mode |
