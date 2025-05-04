local user_functions = require("user-functions")
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

-- Set number row
o.number = true

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
vim.opt.listchars = { tab = "▏ ", lead = "·", nbsp = "␣" }

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
vim.keymap.set("n", "<leader>h", user_functions.replaceAll, { desc = "Replace all words in current window" })
vim.keymap.set("v", "<leader>h", user_functions.replaceScope, { desc = "Replace all words in visual scope" })

-- Navigate in insert mode
vim.keymap.set("i", "<C-K>", "<Up>", { silent = true, desc = "Top" })
vim.keymap.set("i", "<C-J>", "<Down>", { silent = true, desc = "Bottom" })
vim.keymap.set("i", "<C-H>", "<Left>", { silent = true, desc = "Left" })
vim.keymap.set("i", "<C-L>", "<Right>", { silent = true, desc = "Right" })

-- Navigate vim panels better
vim.keymap.set("n", "<C-K>", "<cmd>wincmd k<cr>", { silent = true, desc = "Go to the top panel" })
vim.keymap.set("n", "<C-J>", "<cmd>wincmd j<cr>", { silent = true, desc = "Go to the bottom panel" })
vim.keymap.set("n", "<C-H>", "<cmd>wincmd h<cr>", { silent = true, desc = "Go to the left panel" })
vim.keymap.set("n", "<C-L>", "<cmd>wincmd l<cr>", { silent = true, desc = "Go to the right panel" })

-- Navigate tabpages
vim.keymap.set("n", "tl", "<cmd>bnext<cr>", { silent = true, desc = "Go to next buffer" })
vim.keymap.set("n", "th", "<cmd>bprevious<cr>", { silent = true, desc = "Go to previous buffer" })
vim.keymap.set("n", "tc", "<cmd>bdelete<cr>", { silent = true, desc = "Close the buffer" })
vim.keymap.set("n", "tac", "<cmd>%bdelete<cr>", { silent = true, desc = "Close all buffers" })
for buffer_index = 1, 9 do
	vim.keymap.set(
		"n",
		"t" .. buffer_index,
		"<cmd>lua require'bufferline'.go_to_buffer(" .. buffer_index .. ")<cr>",
		{ silent = true, desc = ("Go to " .. buffer_index .. "th buffer") }
	)
end
vim.keymap.set(
	"n",
	"t0",
	"<cmd>lua require'bufferline'.go_to_buffer(10)<cr>",
	{ silent = true, desc = "Go to 10th buffer" }
)
