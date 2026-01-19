local g = vim.g
local o = vim.o
-- Set <Space> as the leader key
g.mapleader = " "
g.localmapleader = " "

-- Set default indentation
local TAB_WIDTH = 2
o.tabstop = TAB_WIDTH
o.shiftwidth = TAB_WIDTH
o.expandtab = false

-- Turn off recommended style of vim
g.python_recommended_style = 0
g.markdown_recommended_style = 0
g.rust_recommended_style = 0

-- Set number row
o.number = true
o.relativenumber = true

-- Set mouse events
o.mousemoveevent = true

-- Set no highlight
vim.keymap.set("n", "<leader>nh", ":noh<CR>", { silent = true, desc = "Set [N]o [H]ighlight" })

-- Don't show the mode, since it's already in the status line
o.showmode = false

-- Set no swapfile
o.swapfile = false

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "  ", lead = "·", nbsp = "␣" }

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- Replace word
-- vim.keymap.set("n", "<leader>h", user_functions.replaceAll, { desc = "Replace all words in current window" })
-- vim.keymap.set("v", "<leader>h", user_functions.replaceScope, { desc = "Replace all words in visual scope" })

-- Folding
o.foldmethod = 'expr'
o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
o.foldenable = false
o.foldlevel = 20
