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
vim.keymap.set("n", "fl", "<cmd>bnext<cr>", { silent = true, desc = "Go to next buffer" })
vim.keymap.set("n", "fh", "<cmd>bprevious<cr>", { silent = true, desc = "Go to previous buffer" })
vim.keymap.set("n", "fc", "<cmd>bdelete<cr>", { silent = true, desc = "Close the buffer" })
vim.keymap.set("n", "fac", "<cmd>%bdelete<cr>", { silent = true, desc = "Close all buffers" })
for buffer_index = 1, 9 do
	vim.keymap.set(
		"n",
		"<M-" .. buffer_index .. ">",
		"<cmd>lua require'bufferline'.go_to_buffer(" .. buffer_index .. ")<cr>",
		{ silent = true, desc = ("Go to " .. buffer_index .. "th buffer") }
	)
end
vim.keymap.set(
	"n",
	"<M-0>",
	"<cmd>lua require'bufferline'.go_to_buffer(10)<cr>",
	{ silent = true, desc = "Go to 10th buffer" }
)
