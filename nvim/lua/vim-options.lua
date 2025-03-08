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
vim.keymap.set("n", "<leader>nh", ":noh<CR>", { silent = true })

-- Don't show the mode, since it's already in the status line
o.showmode = false

-- Navigate vim panels better
vim.keymap.set("n", "<C-K>", "<cmd>wincmd k<cr>", { silent = true })
vim.keymap.set("n", "<C-J>", "<cmd>wincmd j<cr>", { silent = true })
vim.keymap.set("n", "<C-H>", "<cmd>wincmd h<cr>", { silent = true })
vim.keymap.set("n", "<C-L>", "<cmd>wincmd l<cr>", { silent = true })

-- Navigate tabpages
vim.keymap.set("n", "tn", "<cmd>bnext<cr>", { silent = true })
vim.keymap.set("n", "tp", "<cmd>bprevious<cr>", { silent = true })
vim.keymap.set("n", "tc", "<cmd>bdelete!<cr>", { silent = true })
