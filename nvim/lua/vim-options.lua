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
vim.keymap.set("n", "<leader>nh", ":noh<CR>", { silent = true, desc = "Set no highlight" })

-- Don't show the mode, since it's already in the status line
o.showmode = false

-- Set no swapfile
o.swapfile = false

-- Navigate vim panels better
vim.keymap.set("n", "<C-K>", "<cmd>wincmd k<cr>", { silent = true, desc = "Go to the top panel" })
vim.keymap.set("n", "<C-J>", "<cmd>wincmd j<cr>", { silent = true, desc = "Go to the bottom panel"  })
vim.keymap.set("n", "<C-H>", "<cmd>wincmd h<cr>", { silent = true, desc = "Go to the left panel"  })
vim.keymap.set("n", "<C-L>", "<cmd>wincmd l<cr>", { silent = true, desc = "Go to the right panel"  })

-- Navigate tabpages
vim.keymap.set("n", "tl", "<cmd>bnext<cr>", { silent = true, desc = "Go to next buffer" })
vim.keymap.set("n", "th", "<cmd>bprevious<cr>", { silent = true, desc = "Go to previous buffer" })
vim.keymap.set("n", "tc", "<cmd>bdelete<cr>", { silent = true, desc = "Close the buffer" })
