# Preferences: All keyboard shortcuts

**Note**: 
- `Leader` key is currently set to `Space`
- About surrounding, visit [nvim-surround](https://github.com/kylechui/nvim-surround) for details

## Normal mode

### Navigation 

| Keybinding | Command |
| ---------- | ------- |
| `h/j/k/l` | Move cursor to the left/bottom/top/right |
| `gg` | Go to the top of file |
| `Shift+g` | Go to the bottom of file |
| `Ctrl+e` | Scroll up |
| `Ctrl+y` | Scroll down |
| `zz` | Move current line to center of screen |

### Tab (buffer) navigation

| Keybinding | Command |
| ---------- | ------- |
| `Alt+h` | Move to previous tab |
| `Alt+l` | Move to next tab |
| `Alt+c` | Close a tab |
| `Alt+[1 - 9]` | Open the 1 - 9 th tab |
| `Alt+0` | Open the 10th tab |

### Enter insert mode

| Keybinding | Command |
| ---------- | ------- |
| `i` | Edit before cursor |
| `a` | Edit after the cursor |
| `Shitf+i` | Edit at the beginning of current line |
| `Shitf+a` | Edit at the end of current line |
| `cc` | Replace all text in current line |
| `Shift+c` | Replace all text to the left of cursor |
| `c(j/k)` | Replace all text in current line and the line after/before |

### Enter visual mode

| Keybinding | Command |
| ---------- | ------- |
| `v` | Toggle visual mode |
| `Shift+v` | Toggle visual line (select current line) |
| `Ctrl+v/q` | Toggle visual block |
| `y` | Copy selected text |
| `"+y` | Copy selected text to clipboard |
| `x` | Cut selected text |
| `d` | Delete selected text |

### Enter Op-pending mode

| Keybinding | Command |
| ---------- | ------- |
| `y` | Enter copy mode |
| `Shift+y` | Copy all text to the right of cursor |
| `x` | Cut the character under cursor |
| `d` | Enter delete mode |
| `Shift+d` | Delete all text to the right of cursor |
| `p` | Paste copied text after cursor |
| `Shift+p` | Paste copied text before cursor |
| `ds(surrounder)` | Delete the nearest surrounder |
| `da(surrounder)` | Delete and cut all characters inside surrounder |
| `cs(old surrounder)(new surrounder)` | Change the nearest surrounder to the new one |
| `ci(surrounder)` | Change all characters inside surrounder |
| `ciw` | Change whole word |

### Enter Cmdline mode

| Keybinding | Command |
| ---------- | ------- |
| `:` | Enter Cmdline mode |

### Navigate between panels

| Keybinding | Command |
| ---------- | ------- |
| `Ctrl+h/j/k/l` | Move cursor to left/down/top/right panel |
| `Ctrl+w H/J/K/L` | Move a panel to the left/down/top/right |
| `Ctrl+w q/c` | Close a panel |
| `Ctrl+w \|` | Zoom into current vertical panel |
| `Ctrl+w </>` | Decrease/Increase size of current vertical panel |
| `Ctrl+w _` | Zoom to current horizontal panel |
| `Ctrl+w -/+` | Decrease/Increase size of current horizontal panel |
| `Ctrl+w =` | Set all panel size equally |

### Package manager

| Keybinding | Command |
| ---------- | ------- |
| `Ctrl+x` | Open LazyVim package manager |
| `Ctrl+a` | Open Mason package manager |

### Searching

| Keybinding | Command |
| ---------- | ------- |
| `/<text>` | Search `<text>` in current window |
| `*` | Search word under cursor in current window |
| `Ctrl+p` | Search a file |
| `Leader+sf` | Search a file globally |
| `Leader+sw` | Search a text in current directory |
| `Leader+sk` | Search a key binding |
| `Leader+nh` | Stop highlighting |

#### Search and replace 

- Search and replace in current buffer: `:[range]s/<string-to-find>/<string-to-replace>/[flags]`
	- If you want to replace a word in entire buffer, range = `%`
	- If you want to replace a word from line 1 to line 3, range = `1,3`
	- In `Visual Mode`, range is set automatically
	- Here is all flags:
		- `g` is global
		- `c` is confirmation
		- `i` is toggling case insensitive
- Search and replace in current workspace: Open `Telescope live_grep`, press `<C-q>` to enter `qflist` and use command `:cfdo [range]s/<string-to-find>/<string-to-replace>/[flags]`

### Folding

| Keybinding | Command |
| ---------- | ------- |
| `za` | Toggle fold under cursor |
| `zA` | Toggle all folds under cursor |
| `zc` | Close fold under cursor | 
| `zC` | Close all folds under cursor |
| `zo` | Open fold under cursor | 
| `zO` | Open all fold under cursor |
| `zd` | Delete fold under cursor |
| `zD` | Delete all folds under cursor |
| `zM` | Close all folds in file |
| `zR` | Open all folds in file |
| `zE` | Delete all folds in file |

### Neotree

| Keybinding | Command |
| ---------- | ------- |
| `Leader+e` | Open neotree with source is filesystem |
| `Leader+b` | Close neotree |

### Task manager (Overseer)

| Keybinding | Command |
| ---------- | ------- |
| `Leader+or` | Open Overseer task runners |
| `Leader+oa` | Open Overseer task actions |

### Git

| Keybinding | Command |
| ---------- | ------- |
| `Leader+g` | Open Neotree git-status |
| `ga` | Git add in Neotree |
| `gc` | Git commit in Neotree |
| `gp` | Git push in Neotree |
| `gph` | Show change diff |

#### Git conflict resolver

| Keybinding | Command |
| ---------- | ------- |
| `co` | Choose ours |
| `ct` | Choose theirs |
| `cb` | Choose both |
| `c0` | Choose none |
| `]x` | Move to previous conflict |
| `[x` | Move to next conflict |

### Terminal

| Keybinding | Command |
| ---------- | ------- |
| `tf` | Open float terminal |
| `tv` | Open vertical terminal |
| `th` | Open horizontal terminal |
| `tt` | Toggle terminal |
| `<Esc><Esc>` | Escape terminal mode |

### Coding Support

| Keybinding | Command |
| ---------- | ------- |
| `Shift+k` | Show documentation of object under cursor |
| `gd` | Go to definition |
| `gr` | Show references |
| `Leader+i` | Formatting current file |
| `Leader+ca` | Open code action popup |
| `Leader+cd` | Show code diagnostics |
| `Leader+rn` | Rename a variable/function/class/... name |
| `Ctrl+/` | Comment current line |
| `gc(k/j)` | Comment current line and the line before/after |
| `gx` | Access file / url under the cursor |
| `~` | Toggle case of character under the cursor |
| `.` | Repeat the previous action |

### Copilot AI

| Keybinding | Command |
| ---------- | ------- |
| `<F3>` | Open Copilot Chat |
| `Alt+w` | Accept NES and go to |
| `Alt+Esc` | Dismiss NES |

### Debugging

| Keybinding | Command |
| ---------- | ------- |
| `F2` | Toggle debugging windows |
| `F5` | Start or continue debugging |
| `F9` | Set breakpoint at current line |
| `F10` | Step over |
| `F11` | Step into |
| `F12` | Escape debugging |

## Insert mode

### Coding suggestion

| Keybinding | Command |
| ---------- | ------- |
| `Ctrl+space` | Show autocompletion menu |
| `Ctrl+n` | Go to next suggestion |
| `Ctrl+p` | Go to previous suggestion |
| `Ctrl+b` | Scroll up
| `Enter` | Choose the suggestion |
| `Ctrl+e` | Close autocompletion menu |

### Coding Support

| Keybinding | Command |
| ---------- | ------- |
| `Ctrl+w` | Delete word to the left of cursor |
| `Ctrl+u` | Delete all text to the left of cursor |
| `Ctrl+t` | Indent current line |
| `Ctrl+d` | Un-indent current line | 

### Navigation

| Keybinding | Command |
| ---------- | ------- |
| `Ctrl+h/j/k/l` | Move cursor to the left/bottom/top/right |

### Copilot AI

| Keybinding | Command |
| ---------- | ------- |
| `Alt+l` | Accept next word suggestion |
| `Alt+j` | Accept next line suggestion |
| `Alt+a` | Accept all suggestions |
| `Alt+[` | Previous suggestion |
| `Alt+]` | Next suggestion |
| `Alt+Backspace` | Dismiss suggestions |

## Visual mode

### Basic:

| Keybinding | Command |
| ---------- | ------- |
| `iw` | Select the word under the cursor |
| `ip` | Select all code block that the cursor is currently in |
| `c` | Replace selected text |
| `y` | Copy selected text |
| `x` | Cut selected text |
| `d` | Delete selected text |
| `u` | Set all selected characters to lowercase |
| `U` | Set all selected characters to uppercase |
| `v` | Toggle visual mode |
| `s(surrounder)` | Surround all selected characters with input surrounder |

### Coding Support:

| Keybinding | Command |
| ---------- | ------- |
| `(Visual Block) Shift+i` | Edit multi-line where is selected by visual block (Escape to apply) |
| `Ctrl+/` | Comment selected code |
| `*` | Search selected character in current window |
| `zf` | Fold the selected block |
<!--| `<leader>h` | Replace all input words in selected scope |-->

